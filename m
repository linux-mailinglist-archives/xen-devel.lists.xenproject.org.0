Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC4GBEWZqWm7AgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 15:55:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44558213EBE
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 15:54:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246857.1545911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyA5d-0006ZM-Cn; Thu, 05 Mar 2026 14:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246857.1545911; Thu, 05 Mar 2026 14:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyA5d-0006Xk-8N; Thu, 05 Mar 2026 14:54:13 +0000
Received: by outflank-mailman (input) for mailman id 1246857;
 Thu, 05 Mar 2026 14:54:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfX/=BF=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vyA5b-0006Xe-SZ
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 14:54:12 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 275b65d6-18a3-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 15:54:05 +0100 (CET)
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by SA2PR03MB5705.namprd03.prod.outlook.com (2603:10b6:806:11a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 14:54:00 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 14:54:00 +0000
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
X-Inumbo-ID: 275b65d6-18a3-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLGYOTuPxTXNjoHvjehz8eGfFds28qDl1YkIeh4Ve2ifJ1TDFk1BwsUyojsbokAg57GobS0XFNkVJeoPLlP4puS8QWLbH0OBK4fOmlGbWnUX23VXM+dge8tE0qkjSPpYz7dOYfTD61Yd9dMbEurDt5dwOB+wr1CL5scD6SPs0Xf81lYx/HFdNCgnw3pO1RAg8fedBMTWpMkNzhnmAcQXuvigL7PyfaEloc7d1Rq4MIMkDdgNCthvmNe29Moq3zBnOGtnMsEqk3HH+UymtslkI1AAb/Vp6yoseLjinerqpDkX0yEMw0TqoadvBCPVaHSW+iJx/V3b18QO2mAFMUmnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cs5pfM9ZmzxU3q409GwwHFrbDnNPoBv2RjcPlMzcoNk=;
 b=mqlNifuFfUG00+lRtrV4WJ3EtGnAdnAdHfH4xZyzgoLcU6vtb8qOGBL1zfBOr0206Ad5PP7jnt3UDQP7d095Clds2LGZkSH1o5cR1VA9zd4T0Z7/vioXs5Hd8ybZfXyX+3o84ZShpLv4MD/gPLC0jF8+zDOmKYnMwxxaAn1NrKAWk+BquHIEQBeO5bYWTF8Pd8XtzQQYaFl02gDrDnYuO4FFeZtmRFbrDB/y75kOGaHJM+GsAGaXawsAOko00SZIBvIktw4KKgShs6eneGgtW5xA9WDWRTfLdBzCBbqzF2IhDBOlb/uHm9TljQGq0WPk1L0J0Hprj/RkMGESL3C4Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cs5pfM9ZmzxU3q409GwwHFrbDnNPoBv2RjcPlMzcoNk=;
 b=mw9jJsF9eRhwZDJhvAE0+LV4FbIKESpEE/GJkK1z0938FF7RV+tnaHNFHW1zhUfgErrV2fwz8o1ovvAjxnW2JuCRFXKjNgXT8tQo5v4/x1vZMfPZOeWoZ/LbsGb9O/lYcDUSKrd5N0EGk8QlxA5RwrgdLEBZN6qgxYohLVbBxCY=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Marcus Granado
	<Marcus.Granado@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Alejandro Vallejo
	<Alejandro.GarciaVallejo@amd.com>
Subject: RE: [PATCH v4 03/10] xen/page_alloc: Implement NUMA-node-specific
 claims
Thread-Topic: [PATCH v4 03/10] xen/page_alloc: Implement NUMA-node-specific
 claims
Thread-Index: AQHcpy5A2UpiyJQ97kePD66zF1miC7Wfzj4AgAAAi7CAACzoAIAAAbjQ
Date: Thu, 5 Mar 2026 14:54:00 +0000
Message-ID:
 <LV3PR03MB7707B0093DEBA939361156FD877DA@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <6927e45bf7c2ce56b8849c16a2024edb86034358.1772098423.git.bernhard.kaindl@citrix.com>
 <1497b37d-f47a-41c6-8037-a00a555d13a0@suse.com>
 <LV3PR03MB7707BD13DBB8516C60B06927877DA@LV3PR03MB7707.namprd03.prod.outlook.com>
 <cea8125a-e111-4dd7-a314-4d04c7270b70@suse.com>
In-Reply-To: <cea8125a-e111-4dd7-a314-4d04c7270b70@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|SA2PR03MB5705:EE_
x-ms-office365-filtering-correlation-id: 744287d1-963e-4688-844b-08de7ac708fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 xwJWhFjslBkDv2fehZpBWb5WVuUa85sXLww5jUov19SXaLrBtggvQstxwEtGIWb6rzo250g+bEyyD1yyU63XiSk2DlscY0FqZv0lR7a1sI92D0ojHrofBIRrSuQwAX/xUtY9vVW3XDU0wwoxsQeR/lvv7dfPYsraVMg4ZMoDHxtqoKhe7hf9Mn2TOFHPRrYjMiSr+VPvK4ciGcj961rBBBBBUs4ZoiUBGGfYmLQnmry06MUHAViYX361GgLSgI8/xXh9P81t5g6iURP+Ah98H+XvKLB+tZlctfE53paSo9D6Hc71O/Uo1FGBY+muzz+bBdnRdarfnQWjLOw2jqKDZVHeL1O4oBy5YPRFifVv4HTeJOAEyC+iJJmkHXlYbA492yao3TPV/ncE416ihV3DJeUOHp7WMCXTAvmL6ktsQCfMzSd7L0Mcbbh4v23ZGLi/5/UT1Y2lTztE42lhc42e2oD/2KUtuzt20caPDv/HD23yeyKageA1t/a3A9kS7sdf+1cnxx8XmSmCXa1UlYPdEYCqG/1q2vtiUCMidu6H//fnE8iGpUTlKXYnNU5R8RCyshs8UHy1oMJJzvMmZvn6YAzLx6tOx0FxAme/funfc2ICAYJ0pK940x5fKc0fsYLPAvZBTfR7BeheeRfl5qXeRzWIdIaq/7KZGe88R83DHZGacacmhchkzlbX+00UMNTGMD3j62fK8zSYw18OEhsQ5zm6BeznOq4znov8sEzPoYs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZjNxTm5OR0JQWXMvVVhkMWY4VTBKaGpPcDdRb2pXaGRnMFdOT1FjS0pSVWZC?=
 =?utf-8?B?d3k0dTVCSFo4Q2Q1RWhMTzZXN2MxWmlvMEpJTzFYek82NzJ6azhRMU5aMUlS?=
 =?utf-8?B?azF3MzduTzBQTmhxc3loRFBaNExMb0dERFpqKzlkYUFGVGxDRmlMSG9lVmhn?=
 =?utf-8?B?N1BEeDE2aUNEM0JaYXVqZ3hLeHB2WHZQNWlnaytaU2l2ME56L3VDZ3ZiWnRn?=
 =?utf-8?B?TFp0Rkw5L1NWNnFIckgyK1lsWHpSMXBremNKNWk1M0RSa0EybUpIUExjdm1L?=
 =?utf-8?B?VkNRZkVXcHlWU0ZIMHhFRVhkSlpkY1h5Rlo4NTVxcHBpRGMwK3FNakluRkQ0?=
 =?utf-8?B?RCtub1lOcUZOQ244SVlQUnZGT0R6SERQRkcxaERZb0M4SlI0Y3Jra1B4QUpK?=
 =?utf-8?B?ejFBODZmV3VYK1RpSitWODRHci9hSy9FaTB0L3VqYWdIQnAyNjRSemhVN05J?=
 =?utf-8?B?OGJ2T0drUTdqRnIyVG14ZGVMQUIvSEc1aGRzUC8zcVZLczY1bDFUaEgwSkNw?=
 =?utf-8?B?TXhacmtNT3N1T1U3OFhEV2NDTkg4Y0J0UVdsVGJ6Q1R1N202dVYrSHJRSHRi?=
 =?utf-8?B?NTJrLzRXdm1NM0FjSjdLQ0VjNjlCYmd2cUI4RkxJejM5NDBpWTJ3djdRTlpZ?=
 =?utf-8?B?SzQxLzA4Sk1tTXRkUUFiTnFYYkQ3aWxpT1dBaElGbmtWNGV3L1dWWEI2MENP?=
 =?utf-8?B?ZUVzOUc4UTYzTVBydSsyeVJ4SCtpTExWMExxUTRxaFBVVlE4bWhpb0tMd2VN?=
 =?utf-8?B?N2s0dDMxZEd1OHhDM0F6RlBDOGhERC92RmpjbzlETXkxaDdXLzFLOHJQMXl3?=
 =?utf-8?B?Vmt2ZmRQazMvUk1oSkQ3azRLYmNDNmNVQ2xQSkxOb3IvUitvU3JCZHJHT01N?=
 =?utf-8?B?Sk5oKzJHVGhlVTlMMy9LbFFTVDNmcFdyQmVsY1JhRG9KT2ZPRzlZc3lZeXRI?=
 =?utf-8?B?cUllTkQwNlZkcHR1bmVaZmVtWHhlL3p0T3lwODRMaEptZmVGT1FrTzZqY0tl?=
 =?utf-8?B?YnF2UmpHL0tQejhCc0pReDh3eFNHRUcyZElJRXZRRnBNeVNFbDc1TjAvcFJp?=
 =?utf-8?B?dzVKeHFTYllxSHRrd3QwVWd1V2x0YmFNSTFOcENwd1dab1ltK3FGcmFZMDEw?=
 =?utf-8?B?R0NRMmIzNWx6b3lPUHQ5MkN6S1lzTXlnWHVVWXp1THFkUVhlTWpqUnlXaGNa?=
 =?utf-8?B?TFg1SXMzZWZUWmFXUzVQRGVDZThRajJIaW4vQWVKSWoyeDFaTUpvTEdkY3hK?=
 =?utf-8?B?YVkvK1Y4Rk4yVEFCUm44VmpFNkIxQlRuN3c4ZjlYVWZ3Vy9YWHgvTFJGelli?=
 =?utf-8?B?RzFMVTRYVkZMK1VCK3JFM25ucVNjaFVNYmFGS1FpMmpzRm52YjRkaUVNL0Z6?=
 =?utf-8?B?QXpFUzIxYmNMQlJWUWNlZDBpZ2NHYnBjVDZ6YlkwTVJQeVhTK1Y4MEF2NzlJ?=
 =?utf-8?B?N0hESTd3SEMwV1kxaVlhdjFmd296bVJKME45bllGemYvci85WUxFdkZXTEF4?=
 =?utf-8?B?VXYwVHpWTHI4L2tpYlBXTnVjSWRuWEpHekZodWF2enZlZS9PUkE2SUlUbGdn?=
 =?utf-8?B?MC9DeG50NlgyZGpHTDl6a2xqaW92UVI5UVVXeFRVMzFBaWVrSlM0Zm5BaTE1?=
 =?utf-8?B?UmVwYVVzellTT3JNenJwMnh2YWxTSnhNWUhxbW91YVFpQmxDTjJ5ZVB0RHNy?=
 =?utf-8?B?M245dkQxLzBUeldCZGZsKzhyMitDQTMvWkVvd1NMTDV6ZS8wcUVlQkk3NWI4?=
 =?utf-8?B?VllSY21zaTZYa3JkRDEvSW1GVVBXTWNVVGNDRFFEalVZbTczRGhkZlp4RDht?=
 =?utf-8?B?U0ZIYzI5MDg5SWxNeUlEM1QrZG8yVXJ4R2dUUkNZR0FCL00xbmdqK0JxRmxN?=
 =?utf-8?B?YjFXa3JDbXJuTldNZXA3RERPY3NUUFh4SWFRMXFKbnZBZjhPNWIvVmtKMnlI?=
 =?utf-8?B?d2RGbFFKNksrdFo3bnFJNGx4bWVyc0pSMU94ODU1T2ViT2ZVL0hTQjI1Z1Ev?=
 =?utf-8?B?dHJZVEdhWFdoSktlKzZiWUFIcE1lQnhJVk16SEhXZ0szQkhpRzI4dCs2REpy?=
 =?utf-8?B?OUxYYTc3NGVjcmpxUlhmV012TStFOTI2bXBkRkp5K2kxcy9Sa3R0cFZZT2Ix?=
 =?utf-8?B?YXdtOUVoSG01RktUclpwL3ZSYjhqYzlHV29rWWRzMHd2UUkrbjMxbzBsMHVz?=
 =?utf-8?B?eWYrRDdwNTZldzNuallXUzNJZTE2a0FYN3d4alh6ck1ENER6QXR4WDkwbjgy?=
 =?utf-8?B?K3lMbHl2MFdleXNkSVVTVktlMExOMEZJbFRRVUVQYnh1WFZpRzBUQ2NvUS8r?=
 =?utf-8?B?RDZ4d0xQYnczK1EraXE1SkhkVlU3QTk5dXlmbXh0L2lxajRtaUlXUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 744287d1-963e-4688-844b-08de7ac708fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 14:54:00.0689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZkKpPBDWRV8OTQA9iEBs1wZ/Y6neb0RHVFZIAJWAAJ2wW98Ynm79CGMXzLljmxHR7EQaEwnvG6Bdigl9UhnSZ01pSJ+3sXpd7HWbQwNA7qI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5705
X-Rspamd-Queue-Id: 44558213EBE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.09 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Marcus.Granado@citrix.com,m:xen-devel@lists.xenproject.org,m:Alejandro.GarciaVallejo@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[LV3PR03MB7707.namprd03.prod.outlook.com:mid,citrix.com:dkim,bernhardk-xen-review.readthedocs.io:url,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

SmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA1LjAzLjIwMjYgMTQ6MTIsIEJlcm5oYXJkIEthaW5k
bCB3cm90ZToNCj4gPg0KPiA+IFJvZ2VyIHJlcXVlc3RlZCB0aGUgZG9tY3RsIEFQSSB0byBhbGxv
dyBjbGFpbWluZyBmcm9tIG11bHRpcGxlIG5vZGVzIGluIG9uZSBnbw0KPiA+IGFuZCBoZSBzcGVj
aWZpZWQgdGhhdCB3ZSBzaG91bGQgZm9jdXMgb24gZ2V0dGluZyB0aGUgaW1wbGVtZW50YXRpb24g
Zm9yIG9uZQ0KPiA+IG5vZGUtc3BlY2lmaWMgY2xhaW0gZG9uZSBmaXJzdCBiZWZvcmUgd2UgZGl2
ZSBpbnRvIG11bHRpLW5vZGUgY2xhaW1zIGNvZGUuDQo+ID4NCj4gPiAtIEluc3RlYWQgb2YgYWRk
aW5nL2xpbmtpbmcgYW4gYXJyYXkgb2YgY2xhaW1zIHRvIHN0cnVjdCBkb21haW4sIHdlIGNhbiBr
ZWVwDQo+ID4gICB1c2luZyBkLT5vdXRzdGFuZGluZ19wYWdlcyBmb3IgdGhlIHNpbmdsZS1ub2Rl
IGNsYWltLg0KPiA+DQo+ID4gLSBUaGVyZSBhcmUgbnVtZXJvdXMgY29tbWVudHMgYW5kIHF1ZXN0
aW9ucyBmb3IgdGhpcyBtaW5pbWFsIGltcGxlbWVudGF0aW9uLg0KPiA+ICAgSWYgd2UnZCBhZGQg
bXVsdGktbm9kZSBjbGFpbXMgdG8gaXQsIHRoaXMgcmV2aWV3IG1heSBiZWNvbWUgZXZlbiBtb3Jl
IGNvbXBsZXguDQo+ID4NCj4gPiAtIFRoZSBzaW5nbGUtbm9kZSBjbGFpbXMgYmFja2VuZCBjb250
YWlucyB0aGUgaW5mcmFzdHJ1Y3R1cmUgYW5kIG11bHRpLW5vZGUNCj4gPiAgIGNsYWltcyB3b3Vs
ZCBiZSBhbiBleHRlbnNpb24gb24gdG9wIG9mIHRoYXQgaW5mcmFzdHJ1Y3R1cmUuDQo+IA0KPiBX
aGF0IGlzIGF0IHRoZSB2ZXJ5IGxlYXN0IG5lZWRlZCBpcyBhbiBvdXRsaW5lIG9mIGhvdyBtdWx0
aS1ub2RlIGNsYWltcyBhcmUNCj4gaW50ZW5kZWQgdG8gd29yay4gVGhpcyBpcyBiZWNhdXNlIHdo
YXQgeW91IGRvIGhlcmUgbmVlZHMgdG8gZml0IHRoYXQgc2NoZW1lLg0KPiBXaGljaCBpbiB0dXJu
IEkgdGhpbmsgaXMgZ29pbmcgdG8gYmUgZGlmZmljdWx0IHdoZW4gZm9yIGEgZG9tYWluIG1vcmUg
bWVtb3J5DQo+IGlzIG5lZWRlZCB0aGFuIGFueSBzaW5nbGUgbm9kZSBjYW4gc3VwcGx5LiBIZW5j
ZSB3aHkgSSB0aGluayB0aGF0IHlvdSBtYXkNCj4gbm90IGJlIGFibGUgdG8gZ2V0IGF3YXkgd2l0
aCBqdXN0IHNpbmdsZS1ub2RlIGNsYWltcywgbm8gbWF0dGVyIHRoYXQgdGhpcw0KPiBvZiBjb3Vy
c2UgY29tcGxpY2F0ZXMgdGhpbmdzLg0KPiANCj4gSXQncyBhbHNvIG5vdCBxdWl0ZSBjbGVhciB0
byBtZSBob3cgbXVsdGlwbGUgc3VjY2Vzc2l2ZSBjbGFpbXMgYWdhaW5zdA0KPiBkaXN0aW5jdCBu
b2RlcyB3b3VsZCB3b3JrICh3aGljaCBpc24ndCBhbGwgdGhhdCBkaWZmZXJlbnQgZnJvbSBhIG11
bHRpLW5vZGUNCj4gY2xhaW0pLg0KPiANCj4gVGhpbmtpbmcgb2YgaXQsIGludGVyYWN0aW9uIHdp
dGggdGhlIGV4aXN0aW5nIG1lbS1vcCBhbHNvIHdhbnRzIGNsYXJpZnlpbmcuDQo+IEltbyBvbmx5
IG9uZSBvZiB0aGUgdHdvIG91Z2h0IHRvIGJlIHVzYWJsZSBvbiBhIHNpbmdsZSBkb21haW4uDQoN
ClllcywgY29ycmVjdC4gQXMgaW1wbGVtZW50ZWQgYnkgWGVuIGluIGRvbWFpbl9zZXRfb3V0c3Rh
bmRpbmdfY2xhaW1zKCksDQpYZW4gY2xhaW1zIHdvcmsgdmVyeSBkaWZmZXJlbnQgZnJvbSBzb21l
dGhpbmcgbGlrZSBhbiBhbGxvY2F0aW9uOg0KDQpGb3IgZXhhbXBsZSwgd2hlbiB5b3UgYWxsb2Nh
dGUsIHlvdSBnZXQgbWVtb3J5LCBhbmQgd2hlbiB5b3UgcmVwZWF0LA0KeW91IGhhdmUgYSBiaWdn
ZXIgYWxsb2NhdGlvbi4NCg0KQnV0IFhlbiBjbGFpbXMgaW4gZG9tYWluX3NldF9vdXRzdGFuZGlu
Z19jbGFpbXMoKSBkb24ndCB3b3JrIGxpa2UgdGhhdDoNCg0KLSBXaGVuIGEgZG9tYWluIGhhcyBh
IGNsYWltLCBkb21haW5fc2V0X291dHN0YW5kaW5nX2NsYWltcygpIG9ubHkgYWxsb3dzDQogIHRv
IHJlc2V0IHRoZSBjbGFpbSB0byAwLCBub3RoaW5nIGVsc2UuIEEgc2Vjb25kLCBvciBjaGFuZ2Vk
IGNsYWltIGlzIG5vdA0KICBwb3NzaWJsZS4gSSB0aGluayB0aGlzIHdhcyBpbnRlbnRpb25hbDoN
Cg0KICAtIGRvbWFpbl9zZXRfb3V0c3RhbmRpbmdfY2xhaW1zKCkgcmVqZWN0cyBpbmNyZWFzaW5n
L3JlZHVjaW5nIGEgY2xhaW06DQoNCiAgICBBIGNsYWltIGlzIGRlc2lnbmVkIHRvIGJlIG1hZGUg
YnkgZG9tYWluIGJ1aWxkIHdoZW4gdGhlIHNpemUgb2YgdGhlDQogICAgZG9tYWluIGlzIGtub3du
LiBUaGVyZSBpcyBubyB0d2Vha2luZyBpdCBhZnRlcndhcmRzOiBUaGUgbmVlZGVkIHBhZ2VzDQog
ICAgc2hhbGwgYmUgY2xhaW1lZCBieSB0aGUgZG9tYWluIGJ1aWxkZXIgYmVmb3JlIHRoZSBkb21h
aW4gaXMgYnVpbHQuDQogICAgDQogICAgTm90ZTogVGhlIGNsYWltcyBhcmUgbm90IG9ubHkgY29u
c3VtZWQgd2hlbiBwb3B1bGF0aW5nIGd1ZXN0IG1lbW9yeToNCiAgICBDbGFpbXMgYXJlIGFsc28g
KGF0IGxlYXN0IGF0dGVtcHRlZCB0byBiZSkgY29uc3VtZWQgd2hlbiBYZW4gbmVlZHMgdG8NCiAg
ICBhbGxvY2F0ZSBtZW1vcnkgZm9yIG90aGVyIHJlc291cmNlcyBvZiB0aGUgZG9tYWluLiBGb3Ig
dGhpcyByZWFzb24sDQogICAgdGhlIGRvbWFpbiBidWlsZGVyIG5lZWRzIHRvIGFkZCBzb21lIGhl
YWRyb29tIGZvciBhbGxvY2F0aW9ucyBkb25lIGJ5DQogICAgWGVuIGZvciBjcmVhdGluZyB0aGUg
ZG9tYWluLg0KDQogICAgV2hlbiB0aGUgZG9tYWluIGJ1aWxkZXIgaGFzIGZpbmlzaGVkIGJ1aWxk
aW5nIHRoZSBkb21haW4sIGl0IGlzIGV4cGVjdGVkDQogICAgdG8gcmVzZXQgdGhlIGNsYWltIHRv
IHJlbGVhc2UgYW55IG5vdCBjb25zdW1lZCBoZWFkcm9vbSBpdCBhZGRlZC4NCg0KICAtIElmIGEg
ZG9tYWluIGFscmVhZHkgaGFzIG1lbW9yeSB3aGVuIHRoZSBkb21haW4gYnVpbGRlciBzdGFrZXMg
YSBjbGFpbQ0KICAgIGZvciBjb21wbGV0aW5nIHRoZSBidWlsZCBvZiB0aGUgZG9tYWluLCB0aGUg
b3V0c3RhbmRpbmdfY2xhaW1zIGFyZSBzZXQNCiAgICB0byB0aGUgdGFyZ2V0IHZhbHVlIG9mIHRo
ZSBjbGFpbSBjYWxsLCBtaW51cyBkb21haW5fdG90X3BhZ2VzKGQpLCBzbw0KICAgIGFscmVhZHkg
YWxsb2NhdGVkIG1lbW9yeSBkb2VzIG5vdCBjb250cmlidXRlIHRvIGEgYmlnZ2VyIHRvdGFsIGJv
b2tpbmcuDQoNCkZvciBOVU1BIGNsYWltcyBhbmQgZ2xvYmFsIGhvc3QtbGV2ZWwgY2xhaW1zLCBp
dCBpcyBzaW1pbGFyOg0KDQpBIE5VTUEgbm9kZS1zcGVjaWZpYyBjbGFpbSBpcyBpbXBsaWNpdGx5
IGFsc28gYWRkZWQgdG8gdGhlIGdsb2JhbA0KaG9zdC1sZXZlbCBvdXRzdGFuZGluZ19jbGFpbXMg
b2YgdGhlIGhvc3QsIGFzIGEgTm9kZS1zcGVjaWZpYyBtZW1vcnkNCmlzIGFsc28gcGFydCBvZiB0
aGUgaG9zdCdzIG1lbW9yeSwgc28gdGhlIGhvc3QtbGV2ZWwgY2xhaW1zIHByb3RlY3Rpb24NCmRv
ZXMgbm90IGhhdmUgdG8gYWxzbyBjaGVjayBmb3Igbm9kZS1zcGVjaWZpYyBjbGFpbXM6DQoNClRo
ZSBlZmZlY3Qgb2YgaG9zdC1sZXZlbCBjbGFpbSBpcyBhbHNvIGdpdmVuIHdoZW4geW91IG1ha2Ug
YSBub2RlLWxldmVsIGNsYWltLg0KDQpXaGVuIGEgZG9tYWluIG9uZSBraW5kIG9mIGNsYWltLCBp
dCBkb2VzIG5vdCBtYWtlIGEgbG90IG9mIHNlbnNlIHRvIHRoZW4NCmxhdGVyIGFkZCBhIGRpZmZl
cmVudGx5IHNpemVkIGNsYWltIGZvciBhbm90aGVyIHRhcmdldC4gTGlrZSBkZXNjcmliZWQgaW4N
CmhvdyBkb21haW5fc2V0X291dHN0YW5kaW5nX2NsYWltcygpIGlzIGltcGxlbWVudGVkLCBhIGRv
bWFpbiBidWlsZGVyIHN0YWtlcw0KYSBjbGFpbSBvbmNlLCB0aGVuIGJ1aWxkcyB0aGUgZG9tYWlu
LCB0aGVuIHJlc2V0cyBpdCwgYW5kIHRoYXQncyBhbGwgdG8gaXQuDQoNCkZvciBleGFtcGxlLCBY
YXBpIHRvb2xzdGFjayBhbmQgbGlieGVuZ3Vlc3QgaGF2ZSBjYWxscyB0byBjbGFpbSBtZW1vcnks
DQpidXQgaW4gYW55IGdpdmVuIGNvbmZpZ3VyYXRpb24sIG9ubHkgdGhlIGZpcnN0IGFjdG9yIHRv
IGNsYWltIG1lbW9yeSBmb3INCmEgZG9tYWluIGlzIHRoZSBvbmUgd2hvIGRlZmluZXMgdGhlIGNs
YWltOiBObyBtaXhpbmcsIGNoYW5naW5nLCB1cGRhdGluZy4NCkl0IG1ha2VzIHRoaW5ncyBjbGVh
ciB0aGF0IHRoZSBpbml0aWFsIGNyZWF0b3IgZGlkIG1ha2UgdGhlIGNsYWltLg0KDQpTaW1pbGFy
IGZvciBtdWx0aS1ub2RlIGNsYWltczoNCg0KUm9nZXIgZGVzY3JpYmVkIGhvdyBoZSB3YW50cyB0
aGlzIEFQSSBkbyB3b3JrIGhlcmU6DQpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hp
dmVzL2h0bWwveGVuLWRldmVsLzIwMjUtMDYvbXNnMDA0ODQuaHRtbA0KDQooQmVmb3JlLCBoZSBz
YWlkIHRoYXQgd2l0aCBtdWx0aXBsZSBjYWxscywgaXQgd291bGQgYmUgYXdrd2FyZCwgd2l0aCBw
YXJ0aWFsDQogY2xhaW1zIGFuZCByb2xsYmFjaywgYW5kIEkgd2FudCB0byBhZGQgdGhhdCB3b3Vs
ZCBiZSBkaWFtZXRyaWNhbGx5IGNvdW50ZXINCiB0aGUgb3JpZ2luYWwgY2xhaW1zIGRlc2lnbiBv
ZiBub3QgYWxsb3dpbmcgbXVsdGlwbGUgY2FsbHMpDQogDQo+IElkZWFsbHksIHdlIHdvdWxkIG5l
ZWQgdG8gaW50cm9kdWNlIGEgbmV3IGh5cGVyY2FsbCB0aGF0IGFsbG93cyBtYWtpbmcNCj4gY2xh
aW1zIGZyb20gbXVsdGlwbGUgbm9kZXMgaW4gYSBzaW5nbGUgbG9ja2VkIHJlZ2lvbiwgYXMgdG8g
ZW5zdXJlDQo+IHN1Y2Nlc3Mgb3IgZmFpbHVyZSBpbiBhbiBhdG9taWMgd2F5Lg0KDQpJbiB0aGUg
bG9ja2VkIHJlZ2lvbiAoaW5zaWRlIGhlYXBfbG9jayksIHdlIGNhbiBjaGVjayB0aGUgY2xhaW1z
IHJlcXVlc3RzDQphZ2FpbnN0IGV4aXN0aW5nIGNsYWltcyBhbmQgbWVtb3J5IG9mIHRoZSBhZmZl
Y3RlZCBub2RlcyBhbmQgZGV0ZXJtaW5lIGlmDQp0aGUgY2xhaW0gY2FsbCBpcyBhIGdvIG9yIGEg
bm8tZ28uIElmIGl0IGlzIGEgZ28sIHdlIHVwZGF0ZSBhbGwgY291bnRlcnMNCndoaWNoIGFyZSBh
bGwgcHJvdGVjdGVkIGJ5IHRoZSBoZWFwX2xvY2sgYW5kIGFyZSBkb25lLg0KDQpUaGVyZSBpcyBu
byBwYXJ0aWFsIHN1Y2Nlc3Mgb3IgZmFpbHVyZS4gSXQgd2lsbCBiZSBhdG9taWMsIGxpa2UgUm9n
ZXIgYXNrZWQuDQoNCldpdGggdGhpcywgYXMgSSB1bmRlcnN0YW5kIHRoaW5rIEkgc2hvdWxkIGNy
ZWF0ZSBhIGRlc2lnbiBzcGVjaWZpY2F0aW9uDQpmb3IgaG93IGNsYWltcyBhcmUgZGVzaWduZWQg
aW4gWGVuIGFuZCBob3cgdGhlIGNsYWltcyBkZXNpZ24gY2FuIGJlDQpleHRlbmRlZCB0byBzdXBw
b3J0IGF0b21pYyBtdWx0aS1ub2RlIGNsYWltcyAod2l0aG91dCByb2xsYmFja3MvY29uY3VycmVu
Y3kNCmlzc3VlcykuDQoNCkkgc3RhcnRlZCBkZXNjcmliaW5nIGhvdyBYZW4gaW1wbGVtZW50cyBj
bGFpbXMgaW4gL2RvY3MvaHlwZXJ2aXNvci1ndWlkZSBoZXJlOg0KaHR0cHM6Ly9iZXJuaGFyZGst
eGVuLXJldmlldy5yZWFkdGhlZG9jcy5pby9ub2RlLWNsYWltcy9oeXBlcnZpc29yLWd1aWRlL21t
L2NsYWltcy5odG1sDQoNCkknZCBhZGQgdGhlc2UgbmV3IGNsYXJpZmljYXRpb25zIHRvIHRoaXMg
ZGVzY3JpcHRpb24gdGhlbiwgSSB0aGluay4NCg0KVG8gY29tbXVuaWNhdGUgdGhlIHBsYW4gb2Yg
aG93IG11bHRpLW5vZGUgY2xhaW1zIHdvdWxkIHdvcmssDQphcyBkZXNjcmliZWQgYnkgUm9nZXIs
IEknZCBzdWdnZXN0IEknZCBhZGQgYSBkZXNpZ24gZG9jdW1lbnQNCmZvciBtdWx0aS1ub2RlIGNs
YWltcywgbW9kZWxsZWQgYWZ0ZXIgdGhlIEh5cGVybGF1bmNoIGRlc2lnbg0KZG9jdW1lbnQgZm91
bmQgaW4gdGhlIGRvY3MuDQoNCk9uY2UgdGhhdCBkZXNpZ24gaXMgYXBwcm92ZWQsIHdlIHNob3Vs
ZCBoYXZlIGEgY2xlYXIgc2hhcmVkDQp1bmRlcnN0YW5kaW5nIG9mIHRoZW0gYmVmb3JlIHdlJ2Qg
YmUgbG9va2luZyBhdCBpbXBsZW1lbnRhdGlvbi4NCiANCiAgIEJlcm5oYXJkDQo=

