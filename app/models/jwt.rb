require 'jwt'
require 'json'

class Jwt
  def self.get_jwt_details(token)
    JWT.decode(token, nil, false)
  end

  def self.create_claims_hash(tool_params, resource_link_id, platform_id)
    resource_link = ResourceLink.find(resource_link_id)
    platform = Platform.find(platform_id)
    claims_hash = {}
    claims_hash["https://purl.imsglobal.org/spec/lti/claim/message_type"] = "LtiResourceLinkRequest"
    claims_hash["given_name"] = "Geri"
    claims_hash["family_name"] = "Green"
    claims_hash["name"] = "Geri Green"
    claims_hash["email"] = "Geri.II@example.org"
    claims_hash["https://purl.imsglobal.org/spec/lti/claim/roles"] = [
                              "http://purl.imsglobal.org/vocab/lis/v2/membership#Learner",
                              "http://purl.imsglobal.org/vocab/lis/v2/institution/person#Student",
                              "http://purl.imsglobal.org/vocab/lis/v2/membership#Mentor"
                            ]
    claims_hash["https://purl.imsglobal.org/spec/lti/claim/role_scope_mentor"] = ["a62c52c02ba262003f5e"]
    claims_hash["https://purl.imsglobal.org/spec/lti/claim/resource_link"] = {
                                                                                "id": "1",
                                                                                "title": "Sub_course_1",
                                                                                "description": "sub_1"
                                                                              }
    claims_hash["https://purl.imsglobal.org/spec/lti/claim/context"] = {
                                                                          "id": "1",
                                                                          "label": "Course_1",
                                                                          "title": "Imp course",
                                                                          "type": [
                                                                            "Manual"
                                                                          ]
                                                                        }
    claims_hash["https://purl.imsglobal.org/spec/lti/claim/tool_platform"] = { "name": "paidi_2" }
    claims_hash["iss"] = "http://localhost:3000"
    claims_hash["iat"] = Time.now.to_i
    claims_hash["exp"] = Time.now.to_i + 300
    claims_hash["sub"] = 0123
    claims_hash["nonce"] = tool_params[0]["state_nonce"] + "1"
    claims_hash["https://purl.imsglobal.org/spec/lti/claim/version"] = "1.3.0"
    claims_hash["https://purl.imsglobal.org/spec/lti/claim/deployment_id"] = platform.platform_keys.first.deployment_id
    claims_hash["https://purl.imsglobal.org/spec/lti/claim/target_link_uri"] = resource_link.tool_link_url
    puts(claims_hash)
    claims_hash
    # {
    #   "https://purl.imsglobal.org/spec/lti/claim/message_type": "LtiResourceLinkRequest",
    #   "given_name": "Geri",
    #   "family_name": "II",
    #   "middle_name": "Green",
    #   "picture": "http://example.org/Geri.jpg",
    #   "email": "Geri.II@example.org",
    #   "name": "Geri Green II",
    #   "https://purl.imsglobal.org/spec/lti/claim/roles": [
    #     "http://purl.imsglobal.org/vocab/lis/v2/membership#Learner",
    #     "http://purl.imsglobal.org/vocab/lis/v2/institution/person#Student",
    #     "http://purl.imsglobal.org/vocab/lis/v2/membership#Mentor"
    #   ],
    #   "https://purl.imsglobal.org/spec/lti/claim/role_scope_mentor": [
    #     "a62c52c02ba262003f5e"
    #   ],
    #   "https://purl.imsglobal.org/spec/lti/claim/resource_link": {
    #     "id": "67662",
    #     "title": "Sub_course_1",
    #     "description": "sub_1"
    #   },
    #   "https://purl.imsglobal.org/spec/lti/claim/context": {
    #     "id": "51949",
    #     "label": "Course_1",
    #     "title": "Imp course",
    #     "type": [
    #       "Manual"
    #     ]
    #   },
    #   "https://purl.imsglobal.org/spec/lti/claim/tool_platform": {
    #     "name": "paidi_1",
    #     "contact_email": "",
    #     "description": "",
    #     "url": "",
    #     "product_family_code": "",
    #     "version": "1.0",
    #     "guid": 2822
    #   },
    #   "https://purl.imsglobal.org/spec/lti-ags/claim/endpoint": {
    #     "scope": [
    #       "https://purl.imsglobal.org/spec/lti-ags/scope/lineitem",
    #       "https://purl.imsglobal.org/spec/lti-ags/scope/result.readonly",
    #       "https://purl.imsglobal.org/spec/lti-ags/scope/score"
    #     ],
    #     "lineitems": "https://lti-ri.imsglobal.org/platforms/2822/contexts/51949/line_items",
    #     "lineitem": "https://lti-ri.imsglobal.org/platforms/2822/contexts/51949/line_items/47186"
    #   },
    #   "https://purl.imsglobal.org/spec/lti-nrps/claim/namesroleservice": {
    #     "context_memberships_url": "https://lti-ri.imsglobal.org/platforms/2822/contexts/51949/memberships",
    #     "service_versions": [
    #       "2.0"
    #     ]
    #   },
    #   "https://purl.imsglobal.org/spec/lti-ces/claim/caliper-endpoint-service": {
    #     "scopes": [
    #       "https://purl.imsglobal.org/spec/lti-ces/v1p0/scope/send"
    #     ],
    #     "caliper_endpoint_url": "https://lti-ri.imsglobal.org/platforms/2822/sensors",
    #     "caliper_federated_session_id": "urn:uuid:c379ba4f9c11c25ee64c"
    #   },
    #   "iss": "https://lti-ri.imsglobal.org",
    #   "aud": "1234567890",
    #   "iat": 1644317625,
    #   "exp": 1644317925,
    #   "sub": "43284b0fb82758c8152c",
    #   "nonce": "2030fe0c58eb7957dc02",
    #   "https://purl.imsglobal.org/spec/lti/claim/version": "1.3.0",
    #   "locale": "en-US",
    #   "https://purl.imsglobal.org/spec/lti/claim/launch_presentation": {
    #     "document_target": "iframe",
    #     "height": 320,
    #     "width": 240,
    #     "return_url": "https://lti-ri.imsglobal.org/platforms/2822/returns"
    #   },
    #   "https://www.example.com/extension": {
    #     "color": "violet"
    #   },
    #   "https://purl.imsglobal.org/spec/lti/claim/custom": {
    #     "myCustomValue": "123"
    #   },
    #   "https://purl.imsglobal.org/spec/lti/claim/deployment_id": "SS1",
    #   "https://purl.imsglobal.org/spec/lti/claim/target_link_uri": "https://lti-ri.imsglobal.org/lti/tools/2532/launches"
    # }
  end

  def self.json_claims(claims_hash)
    claims_hash.to_json
  end

  def self.create_jwt(json_claims, platform_id)
    platform = Platform.find(platform_id)
    token = JWT.encode(json_claims, OpenSSL::PKey::RSA.new(platform.private_key), 'RS256')
    print(token)
    token
  end

  # def generate_keys
  #   pkey = OpenSSL::PKey::RSA.generate(2048)
  #   self.pem = pkey.to_pem
  #   self.kid = pkey.to_jwk.thumbprint
  # end

  # def alg
  #   "RS256"
  # end

  # def private_key
  #   OpenSSL::PKey::RSA.new(pem)
  # end

  # def to_json
  #   pkey = OpenSSL::PKey::RSA.new(pem)
  #   json = JSON::JWK.new(pkey.public_key, kid: kid).as_json
  #   json["use"] = "sig"
  #   json["alg"] = alg
  #   json
  # end
end