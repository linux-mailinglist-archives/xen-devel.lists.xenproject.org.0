Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCPSBqXw6WnzogIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 12:12:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1584845067E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 12:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291871.1570639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFr2o-0003Ai-3g; Thu, 23 Apr 2026 10:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291871.1570639; Thu, 23 Apr 2026 10:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFr2o-00037f-0y; Thu, 23 Apr 2026 10:12:26 +0000
Received: by outflank-mailman (input) for mailman id 1291871;
 Thu, 23 Apr 2026 10:12:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wFr2l-00036k-OM
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 10:12:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFr2l-001OHR-4r
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 12:12:23 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69e9f081-bab6-0a2a0a5309dd-0a2a4507d8e4-18
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 12:12:23 +0200
Received: from [52.101.70.138]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69e9f086-229c-0a2a45070019-3465468ad00b-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 12:12:22 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DBBPR03MB10560.eurprd03.prod.outlook.com
 (2603:10a6:10:531::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 10:12:20 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9846.016; Thu, 23 Apr 2026
 10:12:20 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhP97p8uuqmq91ULNZBsYuI970HX+8t94XndEahq+2crKRpcsn0eeAuoIdDSaCq9wvAF0GZ9bZpI5D8Irf1XUMxDjKjpi3y7+RV7mTyouWT4fvHmvbK8eX+qFr6AndCeqBz9zWCvWqfBuPJtbPPdaEiPKtNxiBbhwmcJPvjKqz+cjvLoqWiLGtH9WJiSyizY5KtQZeKR9dHprXRfV+FlbVudRCMZFWEkrQSaPZ++WVQ70bDsoy39lRMESZdnWJv1NN+VUpWbVnFPD7oqxEl3zawG1X6GvgomEanLfqyP5l2306/2pfesLrIw6PFZdo+ghY4QCiE9Aj1w+o2Lwf+WEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXMm3UYTOZ8IKWLASSbJtUVS5pxKYkGOltztUkOoiOc=;
 b=jb8LIcezhKfe4n1DDCej8pg7+B+cMjAU1bXSv3qaFTyMDWc1JHpDRl9WbkqZYWSrjN5i+/BW1ghxjbj9qh2ezKl1Ui7m5y0112ilpw5mimzxzbb1M9nH0JXtxg7Z+h4uhgbf7EHn4Zt2VUoMYaESVpuh7p4QuLhaPcJtaLn30PpNrBx7/mWrAeqnGoKbkqZbAP/kamr9HVdbIFh1rm2uthnMH3ofFhk7ROCgmnyMUVc7cEIliSMcnmDslRQcE5fD8eCM93K69PD6MHvkaWWiNxCAJ8v9nAO1F3qAty67IY3HUfvn9//KiwASQN7a/k+0ofVUAXVi1KaOeq/fQ/1h9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXMm3UYTOZ8IKWLASSbJtUVS5pxKYkGOltztUkOoiOc=;
 b=AIzj3XT3Q/XBWRS7G2HXzlLBB8ZZKf3L7uni5f+Jb8no/yurdusw+107Sz7yaQFXdAIDTzLuwT34hH/EtWV7u0sa31LsQonIUyUlk+eUgbQxScqsHCV7i64e8XfYv6PkTFt/WN18jP9yrcNS1J8rhvkrsbR4qmNqBJo8fY11YY5twdmAdGzLSaJLSWfPsLKd4PZXZXSli+TPr6Xp4RSkdw5UKlYgaOmdnrGSShTM0aWYAzdfi+f/dNuB9g6PEH8WQEwVlfT7wCDo5O5PNKIwIPCeUzFV98m0T4jVj+TrJnFMUMgw2wxZZznzlQ1StbEqYA43c70LhfAlFYAC6GZFHQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Thread-Topic: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Thread-Index: AQHcyClfuk/Yqk/9/E2oGahG1JP+srXpqhqAgALY6YA=
Date: Thu, 23 Apr 2026 10:12:20 +0000
Message-ID: <5168207f-33ed-4fc4-918e-6c3b454b0efa@epam.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <a0abd984989237d2f36e1628db577fb25af1cdbe.1775742115.git.mykyta_poturai@epam.com>
 <5efddecc-3665-4a53-9eaa-b117370cc0e4@suse.com>
In-Reply-To: <5efddecc-3665-4a53-9eaa-b117370cc0e4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DBBPR03MB10560:EE_
x-ms-office365-filtering-correlation-id: 8a084104-5da7-426a-26e4-08dea120ce5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 /YqRpOrkk89Q6xogypnFEiVJEKtAJvmJit2XJpgwmtU7kAAoCrbMMtj/WMxXboShNfTXar3xyeSzQjLHjdfti4AwQMtSNdDHkgKvAmsa31+wqrAPIS6M0pINIgb7KxcKAuuWHgh+ypJ+1iY9oAZSSzZXKOQsnVcypLmL3k7Om553kSwY3c6sy5etyAcnvn/gxji2zNVElcBI+8T2MVInsFzdTGQ/xQJCsrDqX+FnPS+43FhAxK9GbU3PucxMPMoGBo1GBjxZ23MYa1IQksJK0lRtqlSujuQgpESksXkQS9AlywTBi6guKCO8vvHE4MDbhi/yQcsixSWYaylVNnCeCfCJpHhUvwq6hOAW8hGRnuF/EBmzNOh3l7a42/Kv5XktiovpsWbMMIFCVuuLGSnfvv57ui3arj2NAh2FplxrIB32cSgVrKwb2bOlrk3MSApr0KVx8TnhD2pGfiPiiuvnHSmnvU3Xq9r0U4Jc7mf87hMKkOBfKRFHXApssYyjraqYXvbK/0RVkHClRgVXi787UNCMEVPPx2PCmbn41YoBrLbXu6J+oMY9GK3Dv0TDHSkG83BberQP2OffUD79SF7pfwevu9wpr0KA+SZoJISoMqKXnvWiGHOHbimp0Ld8UKhDUkZyeSfUxLIMnxw05Zb4ZKcGj8ALndBgQezEcNDnTOBRvQ/dZhucrb+oJeiiVVNmbvAjvUmrDJNcFbntShkJJO6lWKb4yEBR/n8cU7wWvWO10cIAE94+OrIM36AzSvCHfrl+5CHcjwKibOtMMuTfMv2/QL9atsdvc5k05wqwNQ0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUFjT1d6NHFjYWdwbEVoOURLR2ViQzlGNGdjVEI5RGIvM2QzNTNuL0h5Z0U5?=
 =?utf-8?B?alhTMFAwUlVuZktzK1lVT01FejhjQW13M2ZnSk5IWWNxRjNyWGFIdE1SRzRk?=
 =?utf-8?B?SXJ1TFpBMTIzdTZSMmVvc3pyRGhqL3RTOFJZSnpGUUtTR0t3eFFtSUp6VndY?=
 =?utf-8?B?cHlTYTdXYVpWRy83Zys0YzNzUTArR3B1aHA5M0JWbUhUSnVWTGJkclNaOUx1?=
 =?utf-8?B?RWtYeURtaVFOQWl0eFR0RHk4dmVUQjBOdjhCeFVBYnZzWnJ2Q2pqSEMvQk1K?=
 =?utf-8?B?YVBGell0N0s1UGoyTU50a2I5b05oVDh2Q1FKUzBQVzBnWXMvS3dLeEV4YmFF?=
 =?utf-8?B?YmlQeTRCb2l5QytCa0ZmUFYyV3UycW05SXFtNTNlWUJuNDZTSzErdCtGVEdi?=
 =?utf-8?B?RGN6VUw0anVjS0pjMXZsVVU0YnBEY2J2eXJDMldRMVJNVkI4dHUzamNxa0o4?=
 =?utf-8?B?d1c0dHFJTzlWSXdQOTlCS3RPUU04YzV3U0pNOHFKVk5ScUduaEhsbjRVTmRi?=
 =?utf-8?B?Ky9VUCtOMkZjbXFWTjFLWUZoanJzV3M2M1BPSnJBdjhCaktFVzU2T29Ba1Fs?=
 =?utf-8?B?VWkzaEJsZStNSFk3VFNWbDJKajNscjF1TFdxUlEvWW5WQ0kzVVQ0YmZPMWdl?=
 =?utf-8?B?MGU4NXY2eE81WG1uZVQwb29SOXE5ekNrVjVWc1ZENEw4R2VVK3VnY21YSnFi?=
 =?utf-8?B?RHM4bTVweDZSMHNaeVM5Wm1MWGR2Yjl0cUhnRHAvOGthOFpCQnFtbzZEZGRq?=
 =?utf-8?B?K1pWSEpLMlZQT1AwMFFvY2htL0NsRUhLQVRlQ2dicTF2aUxncTcrZVJOekVm?=
 =?utf-8?B?c0ZORTFaVHBVNkZrMzV1NWdhQjBOZ2kweVcwQm0rckQ3c2Nudy9MNVBxbmxM?=
 =?utf-8?B?Z0dIdFJRUUdKZzY4aENpY084Tms0R3VxdEJMNFk1QUJsQnRmV0xxOHlaOG03?=
 =?utf-8?B?OElSYTJKR3d3Nm9jc0lvNSsvRlEzQkc5Y1dsMktIN1BlclE3RVVGQ01QcWc1?=
 =?utf-8?B?UVhwaTB1cytGTkJqMWxjRkJKTWowQTRQdGZjbWt3OVVMWWJONS9FQnkwU0gr?=
 =?utf-8?B?UHFPTHdDN3VQUG8zYXNwSHZ4NnRRcHUzVnJSQjB2a2xGb1RBT1F4VHJDOEZ4?=
 =?utf-8?B?aE1rUTA2bmJNUW1HWVJRR3ZUODBKZ3YrWTBjL3pKMDZYNDlnc3p5TFdTMklt?=
 =?utf-8?B?MGlIcjVxcjJkME53UW05TWt5NlB0OUJmOTBJMGFxQXRyNVVJek4yYzVqaHBB?=
 =?utf-8?B?N1RvZmhsSGNsL3hwWFhtMzRIN1lWNCtEQ1dWL3ZORFFxRmx5ZXFMZk84ckti?=
 =?utf-8?B?R1FOU2hGeFh5TUJ6RFRxd3A3RURIWmg2Z01VZVZ5MWF1SE5Sd1ppT3ZpaUNt?=
 =?utf-8?B?SEp2WTdFL1pEMVRqa29lbk5HUXRPYit3YUttWnYxaG45SmJVRmhad1A2N1Zz?=
 =?utf-8?B?WDdXVHBaQm1JK3Qxa3ZsY0xJMkR1Njh2VzBBYU5GRXIwR0RZTnVwSDBRSkc4?=
 =?utf-8?B?bW5UdjdncUltNjJVeDBtZnVLcWFLSDdveEdhZ294aGJ0UWxHVHBwdk5KMnpQ?=
 =?utf-8?B?T0RSalkySVFDU1lhQzZoYldYdVlROHUwVG95TWVIaGZxcTlRelV0U1RZdnY0?=
 =?utf-8?B?ekJDN0lZMG5wU2NhUG12VlpnWkxEY2xjWUpJYmlxSG9IMW42YndmR2hhV3Bp?=
 =?utf-8?B?ZWVKd3ZFWUd4REt3K0JJT0ozclVPelZHNnIzOTIwNmZ0djJDR0NHVXVmMnlw?=
 =?utf-8?B?L2tENkdIWXNpYk5aNmN6TGVUZG5jNlZkWnR6U21lQ0F5MEs3N1ZLUEVrdmJo?=
 =?utf-8?B?UngrWlZJV1RVc2F3OTZyZWp4OG9nd0hhanBNSjkyNUpobnR1SEE2NlRnalVr?=
 =?utf-8?B?Ky9VdUExQm81VDIrNTZBVjVPNW9XWXpUb0dtZFM3WkJ3UG1IL1lBOCtZQUlS?=
 =?utf-8?B?VW5IWlIwSFBkQm5FRzdudU9VTW5EMlBJTWU4d0FTbTZvZDBBYUFOemdOMW9M?=
 =?utf-8?B?OFA3Uk1ZZjJRcmx5RUdHK0t6bXptakhZL1FENmtOS1Q1SStudTJhdWlFZUhu?=
 =?utf-8?B?cXBZY1l4dWpCVUFJNzQ5UUV3ZFUxWXViTHhKVlRJMFZGbzVaS21iQmhCWE0r?=
 =?utf-8?B?R0xVemhQU2NlNDRvZGEvd0ZBMmtMRG5HcWh0YmttQUM0M05ZV1JzMGZHV3Vo?=
 =?utf-8?B?UlFtYm1sR1FDMnVTV0ljRjQ5aDhuTndvWnRsNnFVNlF2enFUQ29qMExQb2F1?=
 =?utf-8?B?V2luWjNUVW8wNEFRa0JJSzFCZE1pcFlEU1lwdlVnRXpCbU5qczdnSCtsMlFL?=
 =?utf-8?B?NFV0QjhHc2wrN0NYd3ltbDVodjVYR3dTTnFXWEF5Ymltd0xpOWhiY293VXdO?=
 =?utf-8?Q?Dp9WhIoae+H3uzpM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7019017C62BF5F498FBC5DBE8A5BE765@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a084104-5da7-426a-26e4-08dea120ce5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 10:12:20.5689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eCCDVEhiIpZpmS7yOXwM7Krk9ShhcK/hLWBgLM8RoZnjbHnEZgUQWdYz7jot0wqkflsrpT4JluJlHPPlg8+3LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10560
X-purgate-ID: tlsNG-ef75cf/1776939143-17265C48-EAD789C9/0/0
X-purgate-type: clean
X-purgate-size: 5100
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,epam.com:dkim,epam.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1584845067E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gNC8yMS8yNiAxNzo0MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA0LjIwMjYgMTY6
MDEsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gRnJvbTogU3Rld2FydCBIaWxkZWJyYW5kIDxz
dGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbT4NCj4+DQo+PiBUaGlzIGNvZGUgaXMgZXhwZWN0ZWQg
dG8gb25seSBiZSB1c2VkIGJ5IHByaXZpbGVnZWQgZG9tYWlucywNCj4+IHVucHJpdmlsZWdlZCBk
b21haW5zIHNob3VsZCBub3QgZ2V0IGFjY2VzcyB0byB0aGUgU1ItSU9WIGNhcGFiaWxpdHkuDQo+
Pg0KPj4gSW1wbGVtZW50IFJXIGhhbmRsZXJzIGZvciBQQ0lfU1JJT1ZfQ1RSTCByZWdpc3RlciB0
byBkeW5hbWljYWxseQ0KPj4gbWFwL3VubWFwIFZGIEJBUlMuIFJlY2FsY3VsYXRlIEJBUiBzaXpl
cyBiZWZvcmUgbWFwcGluZyBWRnMgdG8gYWNjb3VudA0KPj4gZm9yIHBvc3NpYmxlIGNoYW5nZXMg
aW4gdGhlIHN5c3RlbSBwYWdlIHNpemUgcmVnaXN0ZXIuIEFsc28gZm9yY2UgVkZzIHRvDQo+PiBh
bHdheXMgdXNlIGVtdWxhdGVkIHJlYWRzIGZvciBjb21tYW5kIHJlZ2lzdGVyLCB0aGlzIGlzIG5l
ZWRlZCB0bw0KPj4gcHJldmVudCBzb21lIGRyaXZlcnMgYWNjaWRlbnRhbGx5IHVubWFwcGluZyBC
QVJzLg0KPiANCj4gVGhpcyBhcHBhcmVudGx5IHJlZmVycyB0byB0aGUgY2hhbmdlIHRvIHZwY2lf
aW5pdF9oZWFkZXIoKS4gV3JpdGVzIGFyZQ0KPiBhbHJlYWR5IGludGVyY2VwdGVkLiBIb3cgd291
bGQgYSByZWFkIGxlYWQgdG8gYWNjaWRlbnRhbCBCQVIgdW5tYXA/IEV2ZW4NCj4gZm9yIHdyaXRl
cyBJIGRvbid0IHNlZSBob3cgYSBWRiBkcml2ZXIgY291bGQgYWNjaWRlbnRhbGx5IHVubWFwIEJB
UnMsIGFzDQo+IHRoZSBtZW1vcnkgZGVjb2RlIGJpdCB0aGVyZSBpcyBoYXJkd2lyZWQgdG8gMC4N
Cj4gDQo+PiBEaXNjb3Zlcnkgb2YgVkZzIGlzDQo+PiBkb25lIGJ5IERvbTAsIHdoaWNoIG11c3Qg
cmVnaXN0ZXIgdGhlbSB3aXRoIFhlbi4NCj4gDQo+IElmIHdlIGludGVyY2VwdCBjb250cm9sIHJl
Z2lzdGVyIHdyaXRlcywgd2h5IHdvdWxkIHdlIHN0aWxsIHJlcXVpcmUNCj4gRG9tMCB0byByZXBv
cnQgdGhlIFZGcyB0aGF0IGFwcGVhcj8NCj4gDQoNClNvcnJ5LCBJIGRvbid0IHVuZGVyc3RhbmQg
dGhpcyBxdWVzdGlvbi4gWW91IHNwZWNpZmljYWxseSByZXF1ZXN0ZWQgdGhpcyANCnRvIGJlIGRv
bmUgdGhpcyB3YXkgaW4gVjIuIFF1b3RpbmcgeW91ciByZXBseSBmcm9tIFYyIGJlbG93Lg0KDQog
PiBBcmVuJ3QgeW91IGVmZmVjdGl2ZWx5IGJ1c3ktd2FpdGluZyBmb3IgdGhlc2UgMTAwbXMsIGJ5
IHNpbXBseSANCnJldHVybmluZyAidHJ1ZSINCiA+IGZyb20gdnBjaV9wcm9jZXNzX3BlbmRpbmco
KSB1bnRpbCB0aGUgdGltZSBoYXMgcGFzc2VkPyBUaGlzIGltbyBpcyBhIA0Kbm8tZ28uIFlvdQ0K
ID4gd2FudCB0byBzZXQgYSB0aW1lciBhbmQgcHV0IHRoZSB2Q1BVIHRvIHNsZWVwLCB0byB3YWtl
IGl0IHVwIGFnYWluIA0Kd2hlbiB0aGUNCiA+IHRpbWVyIGhhcyBleHBpcmVkLiBUaGF0J2xsIHRo
ZW4gZWxpbWluYXRlIHRoZSBuZWVkIGZvciB0aGUgDQpub3Qtc28tbmljZSBwYXRjaCA0Lg0KDQog
PiBRdWVzdGlvbiBpcyB3aGV0aGVyIHdlIG5lZWQgdG8gYWN0dWFsbHkgZ28gdGhpcyBmYXIgKHJp
Z2h0IGF3YXkpLiBJIA0KZXhwZWN0IHlvdQ0KID4gZG9uJ3QgbWVhbiB0byBoYW5kIFBGcyB0byBE
b21VLXMuIEFzIGxvbmcgYXMgd2Uga2VlcCB0aGVtIGluIHRoZSBoYXJkd2FyZQ0KID4gZG9tYWlu
LCBjYW4ndCB3ZSB0cnVzdCBpdCB0byBzZXQgdGhpbmdzIHVwIGNvcnJlY3RseSwganVzdCBsaWtl
IHdlIA0KdHJ1c3QgaXQgaW4NCiA+IGEgbnVtYmVyIG9mIG90aGVyIGFzcGVjdHM/DQoNCiA+IEph
bg0KDQo+PiArc3RhdGljIGludCBtYXBfdmZzKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZl9wZGV2
LCB1aW50MTZfdCBjbWQpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgcGNpX2RldiAqdmZfcGRldjsN
Cj4+ICsgICAgaW50IHJjOw0KPj4gKw0KPj4gKyAgICBBU1NFUlQocndfaXNfd3JpdGVfbG9ja2Vk
KCZwZl9wZGV2LT5kb21haW4tPnBjaV9sb2NrKSk7DQo+PiArDQo+PiArICAgIGxpc3RfZm9yX2Vh
Y2hfZW50cnkodmZfcGRldiwgJnBmX3BkZXYtPnZmX2xpc3QsIHZmX2xpc3QpDQo+PiArICAgIHsN
Cj4+ICsgICAgICAgIHJjID0gdnBjaV9tb2RpZnlfYmFycyh2Zl9wZGV2LCBjbWQsIGZhbHNlKTsN
Cj4+ICsgICAgICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIGdw
cmludGsoWEVOTE9HX0VSUiwgImZhaWxlZCB0byAlcyBWRiAlcHA6ICVkXG4iLA0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgKGNtZCAmIFBDSV9DT01NQU5EX01FTU9SWSkgPyAibWFwIiA6ICJ1bm1h
cCIsDQo+PiArICAgICAgICAgICAgICAgICAgICAmdmZfcGRldi0+c2JkZiwgcmMpOw0KPj4gKyAg
ICAgICAgICAgIHJldHVybiByYzsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgIHZm
X3BkZXYtPnZwY2ktPmhlYWRlci5ndWVzdF9jbWQgJj0gflBDSV9DT01NQU5EX01FTU9SWTsNCj4+
ICsgICAgICAgIHZmX3BkZXYtPnZwY2ktPmhlYWRlci5ndWVzdF9jbWQgfD0gKGNtZCAmIFBDSV9D
T01NQU5EX01FTU9SWSk7DQo+IA0KPiBBcyBtZW50aW9uZWQgZWxzZXdoZXJlIGFzIHdlbGwsIHRo
aXMgYml0IGlzIHN1cHBvc2VkIHRvIGJlIDAgZm9yIFZGcy4NCg0KVGhlcmUgYXJlIHNvbWUgZGV2
aWNlcyB0aGF0IGV4cG9zZSBWRnMgd2l0aCB0aGUgc2FtZSBWSUQvRElEIGFzIGluIHRoZSANClBG
LCBjYXVzaW5nIExpbnV4IHRvIHVzZSBub3JtYWwgZHJpdmVyIGZvciB0aGVtIGFuZCB0aHJlYXQg
dGhlbSBsaWtlIA0Kbm9ybWFsIGRldmljZXMuIEF0IHNvbWUgcG9pbnQsIHRob3NlIG5vcm1hbCBk
cml2ZXJzIHRyeSB0byBkbyBhIA0KcmVhZC1tb2RpZnktdXBkYXRlIG9mIHRoZSBjb21tYW5kIHJl
Z2lzdGVyIGFuZCBlbmQgdXAgd3JpdGluZyAwIHRvIA0KUENJX0NPTU1BTkRfTUVNT1JZLCBjYXVz
aW5nIGNtZF93cml0ZSB0byB1bm1hcCB0aGUgQkFSUyBvZiB0aGF0IGRldmljZS4gDQpJIGFtIG5v
dCBzdXJlLCBtYXliZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8ganVzdCBpZ25vcmUgY21kIHdyaXRl
cyBmb3IgVkZzPw0KDQo+PiArICAgIHNyaW92X3BvcyA9IHBjaV9maW5kX2V4dF9jYXBhYmlsaXR5
KHBmX3BkZXYsIFBDSV9FWFRfQ0FQX0lEX1NSSU9WKTsNCj4+ICsgICAgY3RybCA9IHBjaV9jb25m
X3JlYWQxNihwZl9wZGV2LT5zYmRmLCBzcmlvdl9wb3MgKyBQQ0lfU1JJT1ZfQ1RSTCk7DQo+PiAr
DQo+PiArICAgIGlmICggKHBmX3BkZXYtPmRvbWFpbiA9PSB2Zl9wZGV2LT5kb21haW4pICYmIChj
dHJsICYgUENJX1NSSU9WX0NUUkxfTVNFKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHJjID0g
dnBjaV9tb2RpZnlfYmFycyh2Zl9wZGV2LCBQQ0lfQ09NTUFORF9NRU1PUlksIGZhbHNlKTsNCj4g
DQo+IERvZXNuJ3QgVkYgZW5hYmxlIGFsc28gbmVlZCB0byBiZSBzZXQgZm9yIHRoZSBCQVJzIHRv
IGJlIG1hcHBlZD8NCg0KDQpJIGRvbid0IHRoaW5rIHNvLiBFbmFibGluZyBtZW1vcnkgc3BhY2Ug
bG9naWNhbGx5IG1hcHMgdmVyeSB3ZWxsIHRvIA0KbWFwcGluZyBtZW1vcnkgdG8gdGhlIGd1ZXN0
LiBJIGRvbuKAmXQgc2VlIGFueSBiZW5lZml0IG9mIGFsc28gcmVxdWlyaW5nIA0KVkZFIGJpdCBo
ZXJlLg0KDQoNCi0tIA0KTXlreXRh

