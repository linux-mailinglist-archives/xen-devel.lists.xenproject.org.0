Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLNFAL2Cy2l4IgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:15:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E1B365EF4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268616.1557852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UFr-00037G-9F; Tue, 31 Mar 2026 08:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268616.1557852; Tue, 31 Mar 2026 08:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UFr-00034l-56; Tue, 31 Mar 2026 08:15:19 +0000
Received: by outflank-mailman (input) for mailman id 1268616;
 Tue, 31 Mar 2026 08:15:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <edwin.torok@citrix.com>) id 1w7UFp-00034f-Jg
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:15:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7UFo-00E4mf-Us
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:15:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <edwin.torok@citrix.com>)
 id 69cb828d-2eae-0a2a0a5409dd-0a2a450cb3e0-38
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:15:16 +0200
Received: from [52.101.57.47]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <edwin.torok@citrix.com>)
 id 69cb8292-f93d-0a2a450c0019-3465392fa525-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:15:16 +0200
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by BY1PR03MB7238.namprd03.prod.outlook.com (2603:10b6:a03:52d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 08:15:11 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 08:15:10 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkJL/owkMX2P7AQEAezuwTHrUhife0B0vLuN2yv5uStj3yMN1fSBWxAmG0UYkuR4rDGU0o98f25EGY557Sv4u7olSc7ItBaHjc4AKzj+TKIxVTzJ0FUg9fXUuSSGv7CMTBGWEta7XFA3AIULt3ohHC0/1UrE2UsBhfHX1mQ+VFxuPP+t6mikz1th+o6kV5hWPUKMhJIFiIQXFYfKF8hxbFg29t7yZaxzi34OJTMNfc7LFOaa+5CV+lM1jf8Y/X/bAA22AA8A7T1vaMOoLjmDkRhaQEeWD5rII8IUeKXvVA246S2/8R4iKfZDInHXxLSBnhCdBm+VQeigNGJal5/S4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zShijB4+cGR43ywKEGBDdaXIcwhh/XzOdA/FzmKxuzg=;
 b=s21YhghIVPl0qQYCLghw1vttyWUkaf/+yOl2C+homelz44hDIDC2+MJedwI+c07vcNbIERNyCHZ3JbHBtBB/BUzguE8f7RcXk+eHDM46fpqMZSkucdj/p192mw2AuMa2McnvcpuxjTQFUNjScWCv2VLW+6rmZwIxZjtAp3WKM4pZDhUi2lUdsgMZ+qKKVyEwUiuvm/irAWvzpZwq+NBIKyogp97/XkgVxjuc2UrYaXtb8cnaseqFJyIwPBhExfMnYEbLoVnhYn/MYp3by1yQgv6jLyW6U0kPaoHgQX7nQW5r8hzS4K1fB/p0zAUCwaDmJIfjAD4tO1qcTJFrdOLdzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zShijB4+cGR43ywKEGBDdaXIcwhh/XzOdA/FzmKxuzg=;
 b=CFINfTJhWIXweSEdcQ7itouwR/BBeL503hQDqS/lvep6pk/fwOdHEScFNP1PBEiwrq7LR06h4r0LGJR8rOZPni7WSEsvG3ka71ybIEQoG3B9V9LxJhItKv7Z7zaOlMzVgZMZPkBT8d6ozyfKCfTlTGDrl2XOIROSm29tFqAk2ts=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 1/5] README: update minimum make to 4.1
Thread-Topic: [PATCH v1 1/5] README: update minimum make to 4.1
Thread-Index: AQHcwGC/br3u5UUhvkGzDiCK7sswX7XIKoSAgAAhq4A=
Date: Tue, 31 Mar 2026 08:15:10 +0000
Message-ID: <9F272BD1-F382-4337-ADFE-CCA4E390A8AC@citrix.com>
References: <cover.1774886602.git.edwin.torok@citrix.com>
 <4bbe4e23abcd5b1b32204d391bdd593205b89201.1774886602.git.edwin.torok@citrix.com>
 <16b415a9-b74f-4afe-a14f-e9d2df704eb9@suse.com>
In-Reply-To: <16b415a9-b74f-4afe-a14f-e9d2df704eb9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|BY1PR03MB7238:EE_
x-ms-office365-filtering-correlation-id: 57cc1895-e96b-48b5-1093-08de8efda0a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 tbncdYO4qpSyVgFxsWroLIFVcodGMpfMwcJac82eaWz4fn6913qs27IexVDLOq4PxQ5o2XVu2HUQ4CJdne1EJo11AwJ5oQ/qwTo/cDuitnCFG6HRYCioMCgp0xm+k58jomQYJxLU//RzbDXDWprjNiIEBwKj2AsE7gJ53Yq4ufGhgtcqGvg46pShwN+DsS4kwS1EGvZRMgbaoFazcdqBPbao/sjyHU42pR91KRKfnsBpHKLInVrgj6joy+YpeajYe3a8TPgCIql4pnjZF37Oa3JRHeeWOEV3ZVJSpfpRbi0Qp4JfMBe6wGaUdjj+kejKWCpUI0CzWgOzZ50gFNGyBeGNSXF59U6FrM2M7fasiaajKtj9ejN5jq7a7dg+YFZN2rsMK9WfnDdjQfUfS2KdzAOo0RJGb1ni8AGy1CRc5LC39TjCQPSVYIBrbsM2aqLcMgTndYZVjXNBCbJS5+8IdhkrX8pSTwxR0RgPJnitqL3yEsc2c6EIAKpQtd/GVeRb/VoRaS2KDds0bzLsbGhXns6beFzbZQMHwDfyXLLzHph8uJk10Ub5Ei1oikR/qc5eBcfOBHFaergRNFehr9E40uyrpxRYbxBT4B3m89o7yK1OoPvVUtbaLrm4KwvQumb3U6bC3DZIRrig4rqMdl8n+S6hasXQO789Y9QODzXunhGVjY6mvA7J502RJZo7hG6k3qjTgsxAte2qSs98GAB0yvyliSajkotlCxskegdZsWcng6RJi5uDVy62cX6zhAiN7Hk87ZCBzvc9mc4fRhgLusNAxd8pFeHs+Sjve/HdnlM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Skd6VGs5Zk0wbTNDV0RzU05jcktudzZQbTZJVzBkb3IvaVpnKzZYLzhjczJy?=
 =?utf-8?B?aUcwSDFhK0NKc3ErbmtERlBKcUlXNDZNNWphLzBrQ1BWWGNNQXdLNVE4ZnFo?=
 =?utf-8?B?eG9JcXJKVzhla1g1ZnRBakFiVGduR1gwcFpXZC9mcGFLUXdwdkxkWmZ1Umpo?=
 =?utf-8?B?ZDhjcnpUZCtyU28rVzZrRGhpcmlKKzZqZERjUDF0dDlkbzAveFd2NFlDNnVs?=
 =?utf-8?B?OVR4dy80UlVLQjVHdFpnb3A3b3VqQjlYeWViU3g1V3d5dEJVdEdyZ0tLYzZk?=
 =?utf-8?B?eDBaeDBWaHowRUVYaTlRYVJtVzByMUR0WERaMXBnOHVqSFVsR1JoTi90U2I4?=
 =?utf-8?B?MFFDbmNwSFNrK0hKYTZpUmtyeTFQdHJBQ3crbmh4L0p3T1NOTGVlQWpTOVpm?=
 =?utf-8?B?RDU4R2RCcmZZbVpqY0hHR2d6NlZlOEh3alc1bTkzdkl5MnZzZEVzY0MzSGs4?=
 =?utf-8?B?OHZOaUxZdnI1bURpN3ptWkcraDVNTzZrSkZHWHo0dzhsMEowL0FoNkhoZ3lR?=
 =?utf-8?B?N2kyTG9vNnRpQllxU1ZBZHpwUVhQaXFGK3YvRmRXWkY5aUcydVF2N3hUN1c0?=
 =?utf-8?B?ZFJodE5YeFZyS1RQUkk4K3JuWGlEeitURDRVeTJnM0s1VGsrd2xjSUZDRzR4?=
 =?utf-8?B?ZjZTOHR0VXZzMmVOcURaaTcrc2NWdG1wTnlwYk5ISWl4TEFxR2gyV3RacVpt?=
 =?utf-8?B?MWtFL0t2VmRQMDV0ZGt0Ujg2T0t2d2EyQk9QZW5XS2xJVWRuVEpmRndGNWln?=
 =?utf-8?B?M3diWFRRK0tXZ29MRXFFczZhR0ZIQ3F3eExyMUd3VDIraUY4SmkxOENyZHg0?=
 =?utf-8?B?UDZVUEVuQUpraDA2TnVpcTBaaUNPcnlJTE42Mm1EZjIyQkhQWk13QmJMMWox?=
 =?utf-8?B?Yzg1TEJKN29oTXZ4THFBRXdkdm5YWWRoemJCVFJNbm91MWVvTDFNeUtBNzE4?=
 =?utf-8?B?QjhzV2xFaEU2cjJWYy9NNis2QmdiVEhEMHhMZHhiZjN1RDVadmwwQ1ZWZDJE?=
 =?utf-8?B?RzdRclYrWFB3MDJoNWxGVEUySFgrS2ROTS9Ja0FxU1dZSzVXU20rc0lEaWFq?=
 =?utf-8?B?clpVWGVyK290Y3pjeDFiN3hLMlpQczlvVU9oTlloWlhoOStObVJOeDlLelJw?=
 =?utf-8?B?TzdiTGczUWNxWVI0WmZ1OHFrVVlqMk9QVzl0TkpqU3Rnem51b3BZWEN5eFY2?=
 =?utf-8?B?eFlBeUZKYnZGSlZjQTZjY2R3YW8vbC9adGIxVXpLTDNMYkkwcEM4d0J1aEdr?=
 =?utf-8?B?dVdyZHBUaGY0Y05EckQwRWFzRkpNaFRSQjViQkRBZkxKc3NGTkNTdy95TXNX?=
 =?utf-8?B?cTh0M0xkeFV4bUtUbldFODFFUWR3RzVpY1dsUUEzd215YlFRVEFZVTN3VUxW?=
 =?utf-8?B?Vmw4VUY2UVFPL0YwVGphVTBkMTczQ1ljMjZMVmtVQzFqT04rdkQ5ZWF4d1JY?=
 =?utf-8?B?YnBHK2htVzM3eGg5bkpkUERpc25kMVNWUCthV0phTGw0UG14UXA1NmZlZ0Vm?=
 =?utf-8?B?dVFYcU4wUnpTZGVVS3V2eXdZbmpqQU1HU0ZEZzJEWUtnZ3IwV1ZEWW01RW40?=
 =?utf-8?B?dnN4aE8zZER5NXlSUGMzZ2RHNTdvY2JZbExzdWpocGh4bzcrYW43QmtiK1lv?=
 =?utf-8?B?SFhkaHVuMElRYkptbWNZWmw3b0l4SU82Q3RyQWJYMXVxbXFOZXp4QmEyaHlL?=
 =?utf-8?B?dko2M2JWcnQrcjlBano5VEdmRHBlN21xRDJWVEEyc0tZQUpJZlNtTFA4YjJN?=
 =?utf-8?B?SE12MnA4bXlBQmhIT21Vb3pIa2diNnY3VUM0YStSWjZkTGpTaUtvcU5saTk1?=
 =?utf-8?B?dUd6SjRpYk14ejhoWkF2N2dZYklUWDVaY1lkcDYwTUZIa01sYXVJaEhMWmQ0?=
 =?utf-8?B?RU8xKyt5SExWTWp2eEhQUE82RjlYQ2NGazBsQ0FlOHIrMXJuaTBLWDF3VlVj?=
 =?utf-8?B?aGlmRTRGRk1wNzQ5a1hQc3B2Tkp1VTF6OGRpaHZ0WFQ5Y1haUmxWa2g0ZXRI?=
 =?utf-8?B?cXovWTlndFdQQUNTVjFtUkJHOUdUZ21rcHIreCt1ZDVXTzlBQnlTU2FEYkhp?=
 =?utf-8?B?VzY2MWRTalBOTnhDYnpQQXFrejc3MW5Ca1RFWVFwaGg1TFkwdWduSnFpR2xM?=
 =?utf-8?B?WjUyMVA0T2NGUHB3eG5HS2ROZ0R6WGNXaldkWjUwMVFCbm4wdFlScndQUTZv?=
 =?utf-8?B?eHJ4QkVKclhsUEhZbXZiTDhXVk1XRTh4VWRqTDFseTdFUWkxNXJCY1hrbGtQ?=
 =?utf-8?B?SkZrS0ZKT3lPK2FWejBLZExYbmlReVQvb2ZWdUp6M21ZQTdxK1RXN21EUkpS?=
 =?utf-8?B?N3Frd1Jnb0YweVMraFZSalRtS2kyQnpCa25xMjU3RUhqRzlTbEdQbE5MZjFl?=
 =?utf-8?Q?Z5mMvdQVwGKYztZ8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84BF8180CBC7E54F984B6D0F9232D29E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cc1895-e96b-48b5-1093-08de8efda0a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 08:15:10.5384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TsPHviragPp0Av2miAKZnY2PQ+PN1LPuPqGI5SHcYVZyF6stWnK+FwfKkhC0KeaPXSXcjITvBUl7mOc93c06Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7238
X-purgate-ID: tlsNG-d25034/1774944916-F6CAA734-DBAE3E27/0/0
X-purgate-type: clean
X-purgate-size: 2024
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 65E1B365EF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gT24gMzEgTWFyIDIwMjYsIGF0IDA3OjE0LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMzAuMDMuMjAyNiAxODoxNywgRWR3aW4gVMO2csO2ayB3
cm90ZToNCj4+IFVzaW5nIC5ERUZBVUxUX0dPQUwgcmVxdWlyZXMgYXQgbGVhc3QgR05VIG1ha2Ug
My44MS4NCj4+IEl0IHdhcyBzdWdnZXN0ZWQgdG8gdXBkYXRlIG1ha2UgdG8gbWF0Y2ggfjIwMTUg
ZXJhIGdjYy9iaW51dGlscywgaGVuY2UNCj4+IDQuMS4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTog
RWR3aW4gVMO2csO2ayA8ZWR3aW4udG9yb2tAY2l0cml4LmNvbT4NCj4+IFN1Z2dlc3RlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcveGVuLWRldmVsL2MwYmE1N2JiLTBkODYtNDIwOS1iMDE5LWRhZjgzMjhiNTIwNUBz
dXNlLmNvbS8NCj4gDQo+IFVubGVzcyB3ZSdyZSBzcGVjaWZpY2FsbHkgbWVhbmluZyB0byB1c2Ug
NC4xIGZlYXR1cmVzLCBwZXJzb25hbGx5IEknZCBwcmVmZXINCj4gdGhlIGxvd2VyIDQuMA0KDQoN
Ck9LLg0KDQo+ICh3aGljaCBpcyB3aGF0IEkgaGF2ZSBvbiBteSBtYWluIGRldiB3b3Jrc3RhdGlv
bikuDQoNCldoaWNoIE9TL2Rpc3RyaWJ1dGlvbiBhcmUgeW91IHVzaW5nPw0KSXTigJlkIGJlIGJl
c3QgdG8gYWRkIHRoYXQgdG8gdGhlIENJLCBzdWNoIHRoYXQgdGhlcmUgaXMgYXQgbGVhc3Qgb25l
IGNvbmZpZ3VyYXRpb24gdGVzdGluZyB0aGUgbWluaW11bSB2ZXJzaW9ucyBsaXN0ZWQgaW4gdGhl
IFJFQURNRS4NCihPciBhdCBsZWFzdCB0aGUgaW50ZXJzZWN0aW9uIG9mIHRoZSB2ZXJzaW9ucyBv
ZiBidWlsZCB0b29scyBpbiB0aGUgQ0kgc2hvdWxkIG1hdGNoIHRoZSBvbmVzIGluIHRoZSBSRUFE
TUUpDQoNCkJlc3QgcmVnYXJkcywNCuKAlEVkd2luDQoNCj4gDQo+IEFsc28sIG5pdDogVGFncyBp
biBjaHJvbm9sb2dpY2FsIG9yZGVyLCBwbGVhc2UuDQo+IA0KPiBKYW4NCj4gDQo+PiAtLS0gYS9S
RUFETUUNCj4+ICsrKyBiL1JFQURNRQ0KPj4gQEAgLTM1LDcgKzM1LDcgQEAgU2Vjb25kLCB0aGVy
ZSBhcmUgYSBudW1iZXIgb2YgcHJlcmVxdWlzaXRlcyBmb3IgYnVpbGRpbmcgYSBYZW4gc291cmNl
DQo+PiByZWxlYXNlLiBNYWtlIHN1cmUgeW91IGhhdmUgYWxsIHRoZSBmb2xsb3dpbmcgaW5zdGFs
bGVkLCBlaXRoZXIgYnkNCj4+IHZpc2l0aW5nIHRoZSBwcm9qZWN0IHdlYnBhZ2Ugb3IgaW5zdGFs
bGluZyBhIHByZS1idWlsdCBwYWNrYWdlDQo+PiBwcm92aWRlZCBieSB5b3VyIE9TIGRpc3RyaWJ1
dG9yOg0KPj4gLSAgICAqIEdOVSBNYWtlIHYzLjgwIG9yIGxhdGVyDQo+PiArICAgICogR05VIE1h
a2UgdjQuMSBvciBsYXRlcg0KPj4gICAgICogQyBjb21waWxlciBhbmQgbGlua2VyOg0KPj4gICAg
ICAgLSBGb3IgeDg2Og0KPj4gICAgICAgICAtIEdDQyA1LjEgb3IgbGF0ZXINCj4gDQoNCg==

