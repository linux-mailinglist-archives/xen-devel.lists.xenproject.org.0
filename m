Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKgKDB/D12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:17:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 933353CC80A
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:17:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277868.1562971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAr8S-0000vZ-Qp; Thu, 09 Apr 2026 15:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277868.1562971; Thu, 09 Apr 2026 15:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAr8S-0000sU-O6; Thu, 09 Apr 2026 15:17:36 +0000
Received: by outflank-mailman (input) for mailman id 1277868;
 Thu, 09 Apr 2026 15:17:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wAr8Q-0000r0-AX
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:17:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAr8P-009G47-MR
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:17:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7c2fd-bab6-0a2a0a5309dd-0a2a45028d5a-18
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:17:33 +0200
Received: from [52.101.66.98]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7c30d-42fa-0a2a45020019-346542620f1b-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:17:33 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7617.eurprd03.prod.outlook.com
 (2603:10a6:102:1d8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Thu, 9 Apr
 2026 15:17:30 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 15:17:30 +0000
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
 b=jEsavm0vu2GhdhCk4Vx2JGALQlAuHnSej8P9K0sYsFrMOVdczovQo1mNXbQQEyfRHW1heq5nYgc412Fo9wg50kKQHkhQ96c1/5vwPFHzbrtEgA3pvzPG5wUtEWipISiiW4Rls23hZkA6K93wXBU8qIx+mGC59pxo0jdVD7tDNKv//aLB1Dm/TgutdwI5e0Z3Z4OaH58S8CHkP5IMC8I18HMXFQ+i7/jsDWkCE8GicD6U/Z3tp9TxJ2pZiZCgcjU//g/02YZ1v/W4OTPZp9xL3IY4im4dH+jjOctoVHZfbfb5Efv0aGn2axyzOZCi+oElqhwW6WyGJxCSwBPTsM8gXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bTtnVqI/njnm9mF5eUmSq8syIognAlgqXXNHsvjoUM=;
 b=M0GgTAJrlVyb2XeUvLbE9grmmvGOe0TGtmTFLYrNVJykfLHMTeN3CuNtRsP1EpXfanI4ucloJiHDBNGInuf5eZIPgfuMgDUEbUtZotyjgUE1svHShUSPH1JWM5kohMfebSZk1s5SRqf2tGJ98aOEeaRhNdTnSvd1/pBGg/a1l0dPrnrPvhFEkU2lCYxNawabdnfqZ5DclTMAXqTVguZCkqj8oL8dj1FaSMrl3pjWOD4vAs31r0g31xx3hxGOOzKANZ4pHFVM2p3I+ZA/21eiT8lX5jdQ1Cleap5TGej0zromh5SSaq6FonNZ76BAeoBEj+NFIp20FQmgoP3JyUqRlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bTtnVqI/njnm9mF5eUmSq8syIognAlgqXXNHsvjoUM=;
 b=sszcnUTkEuF+0wGdFS4g237RG0n6guaYnl2mwQlcpEYsGP7md2Pn8HsHapoTozqGsnlre0B/XNAnO6v9k0fCCKzLJTETQzuBbc2ypzPFIX61e4MRC4iW99945+mST4Tbl+5zVjpDQdMzPCkn3F62kUgrvsJt7sSG3ZOGy2yCh0AUA7hxmQltA772uwQrSkpUlcm5glFS20538IhyB+RbcZLriBdw5WdjcRMjdEDkd0Jy+nq8Qk4e7DY2jw/CIZ4Oag8ReSR4VussjAuw+uvmR243x2vYjMk1+DmPKa3ieZ6rZa5EVhUbugHyd+BWkhifUs2NSo7sCKavaW0wQCE24A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 2/4] vpci: allow queueing of mapping operations
Thread-Topic: [PATCH v4 2/4] vpci: allow queueing of mapping operations
Thread-Index: AQHcxflWTbgzk4jzUUShSlP6L/DRmLXW3AQA
Date: Thu, 9 Apr 2026 15:17:30 +0000
Message-ID: <6dbea931-e449-4ce4-abe0-6167e75b0fc2@epam.com>
References: <20260406191203.97662-1-stewart.hildebrand@amd.com>
 <20260406191203.97662-3-stewart.hildebrand@amd.com>
In-Reply-To: <20260406191203.97662-3-stewart.hildebrand@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB7617:EE_
x-ms-office365-filtering-correlation-id: 695bb93c-4955-4bd8-d1e5-08de964b1e43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 E31cFhM9MW83Ryp+Pcy5tH6rxKs73kxet/1zfeqJ3Kpk8tlH6MO37cGsqSn4R+k27+LegHhoM2p+zqn1I1DdlnCE2JYSuxDQlxZJ3d/BRQdVyui+koY5CZqqPKXot7qGYTrcLuJcFkSN5BXtPpWle1ImsF9X+Xy8V4V8pxKjKWP26rsUo7MGJ5VMwUqg4MwQLY2oISoJacVtq48NJAZXUe7C1FxWuJ58QUrnWUdR1cP5iDRX9w+kDHxFbUaC1I9qvQc4l4kzvwGAe8Th+QV0kzVJfIu85tmxDbylcH1Elmcnh0D7iXwarbyTcRDb/6tZNEsGfqMRjMS7pLD3fiHB+qYZKb1SrQtYZiIBgIo4SPDQjkoM3pBBgyO7MiBEg1HBAR50AaeKM8IHT1iziAHtFCOl7VlnQRMONZUkG+TzJqRkOq3W79ds8286NosGeJ3e01oGsE+j8b8PltWWWG50D5B4+CmXfX+uu5a6JTHAbgCj5R7qvQ5Pd2/3QDumstQ4RrIBun8hrC3q+VISEA3h1JIHxyCWIhBeuwkp57bsl1kB/DErN8sK+UdTO3oasc5NSemvKG1etaZPn+q2IUmeF3wF+0CP5r2dfwzBmN+6AQtPEtkS8KR8UsueXQOd8pXll/piXAccojg81ZHZSQuKnMNZbRAyxfKU5QoYqtg4jceTluA2iKTm9D703qcWz5PUr8cAUKYTHjh0/s3WG1U5mRUR5hQCFlb9ty8fyc3cXKMkJaGNH6QRVFqh82hIa5NN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c29GMy9ySmNIOVZndEs4RmZZaG1SN2ltWDdaa0cvTHh5Ukoram8xbHFZbCtS?=
 =?utf-8?B?cEZRbEdzdmVqYVAvSTQ2T3FVWmZhSm9xSDhmZ3VDMEV0L0lvYnVQT1hySUhU?=
 =?utf-8?B?NncvOEE1bHRncDY0UFVnbnNrVldFRkp5Q3FaOUxuWnAwQURtbXpMVStrallW?=
 =?utf-8?B?aFV2RElUSFIvWUE5TlFvbXFhcmNCcWcwZkNrT2w4elJFVGRNYzV4Sk1ERTJO?=
 =?utf-8?B?a3oyQitLeEtsYVVJb3R5bVFURTlnR2gxMnFpZS9FV3hzZXVIOXRBeXhBeFNq?=
 =?utf-8?B?Y3U2cUFSUmgzVkw5TkdkNFBNMlZucGxyeFVyTHMvMlZFdHdrSmd3YmJTZVJk?=
 =?utf-8?B?VG0xREMyV2hqZ3Nja1o5UzljNmU5V09CN3pCTUtVTEJXd1BZVTVMSU9Yem44?=
 =?utf-8?B?QmlBWTZRTjhhMk1kaG9haUQ4RDhLQnJXVFRFbEx1MjhlZGRyUS9yb1duQmpi?=
 =?utf-8?B?d1oyaWVRODBwT1R0NGt4eVZVOWFWM253dFpkcU5DSWNCdFI5REJ0ZW40SzdT?=
 =?utf-8?B?UFR0RXZicFRzdEc1VnI5QWxwQTNRQWtKN3kyOURSWXZqekg1RXJ2SjNxbUNM?=
 =?utf-8?B?ZE1HeG93cEN4blUrdjl4WlJObk5jRmVmQklhRFgzVWt1c2U5LzRSbXRLbytD?=
 =?utf-8?B?dS82WVpVZ29VcDVBeE9WdHdaV240V1RweXZyZytkdW5XOHUreFgxV2dEaGVU?=
 =?utf-8?B?SGhJMDgxUDcvcnNTVE1LZWFLeXNqUG5wZXZpRTRyYUJ3RDR4bGx5VG5iQWlT?=
 =?utf-8?B?Vm92WW10b3UwZ0RVNWU1ZS9oQlV4NDBPVXY0R3hkU3NNUHRWNFZGRzNkMHR3?=
 =?utf-8?B?T3FEcHp5MjQvV24xbERiSXRqdUp5UjY0MGxFbDB4TUR4QkprdzZmLy9mVElk?=
 =?utf-8?B?TERuWDROVzV4ZjV6dkM4c1g2SkZNcjR5RFFJWDFZTUFEbWFMdU9LWVM1djh3?=
 =?utf-8?B?LzlJalVRbEZ3Y1dVYWROUjlsL0FqaXZHVGt1MTQ0SFZCQldsYUkwSlh3V2pj?=
 =?utf-8?B?ZXd4NGdWcGE5RkU1R2FSM3BLQ2p5QkhUaENZakxQa1EySG1oalVKU3JIL0tX?=
 =?utf-8?B?QmQzL2gzNVk4UnNiZGFiMFZsVjBjVUhRZVFkMXlUZnBoZUUzQ3NEemMzZnpi?=
 =?utf-8?B?T3h3TFd2NnBBQzJ3MGVRckRqT2RSanZvUTE4S29lQlF3Wm5zQjVZekowSUlS?=
 =?utf-8?B?ZjhMdUM2RFVlS1U2cTJtRGZ3SlNUU0lacTg0UTVFNTRIekZYMlZwMG80WVQ4?=
 =?utf-8?B?MXFqQW9Pc212ZDIvMldRVi9VMVAyZmlPSU5NN0JPWkR2R1daUktQMGNoTTlR?=
 =?utf-8?B?dXJCS1dHbzJ4alZNM3c5di9VYnh6ckd0dDZqejFDWW1XdWNMeFdpTFIwMGMr?=
 =?utf-8?B?amYxYnZhZ2ZKNHlYQ0lPMWE5ajN4TU5ucG51YVJiT2FWeFMxWUVmY0pJNklm?=
 =?utf-8?B?V1M2QWFrK3dSd2pMLzQyOWhLd3RUdkwzajhGYzh3ZzlzMHZmdmd3U0dwd3I1?=
 =?utf-8?B?WlFvZEZ2VWkxTVhVaXhUYUZQOFhMOVdFQVRIK2twOGlPMUNpVGw5S0EraDN0?=
 =?utf-8?B?Ri94U2MwNEY3WWlmRkFPTUthZjlDSkZaWWUreGVYV2xOT0Jta2w4TSs0bWV2?=
 =?utf-8?B?VnRYdWxLSTdlUnJBTXJ3Q2NQZnhITnQwY2lSbS9ROGpXbEtSOUNrS1BwRUtX?=
 =?utf-8?B?dFJSMlgycGJERmhDa3c0WHZwdlY2ZkdQSXp0anR5Z2ZyR2VDclpkR3UrQTM2?=
 =?utf-8?B?b0I0ZXg4SndVUmc2dXh4Z05hV056VXNwSWtoZTlQaExJRG51di95YmV6N21G?=
 =?utf-8?B?YlhWZVBnTVlTandYQ3AvL0Z3MU9BbW1PanpPRTFjNWdxVUNlYXFabnNHWG5x?=
 =?utf-8?B?QmdVM1J5Ukl3OXdkdmhwVUZ0V1dHWU05bEt5WmROMjBpTDFCV2dNWTZ0WUo1?=
 =?utf-8?B?ZWhNb3k2b2xxTlRwRkFobDE4TmxIdGIvQUVqY215WFdYUlh4WCswUnJSUlBT?=
 =?utf-8?B?L1FxZkxDUU9EVnVqdlExaUQzWnh0QXJuVlZRSjZtTDQ2b0l1OGpiK0hCTlI0?=
 =?utf-8?B?TXFwa2NkUGN4aWRXWGQzNDdQc1VLdjlDOGRGZk9KclZEK1Z3bEhORTUzWklv?=
 =?utf-8?B?NWNTVWtVd1o5WS9tcnVVM0lyNjl3eXJBSWcrM0RBSW9KOFUwb0N1SFhMV0VD?=
 =?utf-8?B?aVdvbmx6UE1Jb1NVUm53cENwZjhzMk5yRnREM0FoNm5VUHRnRHJWa0tseU96?=
 =?utf-8?B?NGNIY0RETnN0MCtkQkN4SlN5VnVwTW1oMTRlQVBRaDVnTVFuZFRKNGtid1lW?=
 =?utf-8?B?bmloZlpuVVdpNHZkUGxGRXdhYVd1YnZ2MU95SlgrOGRBb2tDQ0VwRWdoS0ZL?=
 =?utf-8?Q?t/9ORwzi/s9W1OAk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4BD37181DD1A4438258B542A5B1509D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695bb93c-4955-4bd8-d1e5-08de964b1e43
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 15:17:30.7283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7vLXM1drOzdqt/t+8GIMXbtXkULXlCIJSv3879HhomXmEVxj0G1gSvTS2Yc6yt7HymBZS7Q/ofVym0JCfaDUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7617
X-purgate-ID: tlsNG-720697/1775747853-4CFF7CD1-B07736DB/0/0
X-purgate-type: clean
X-purgate-size: 2448
X-Spamd-Result: default: False [-1.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,epam.com:dkim,epam.com:mid];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 933353CC80A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gNC82LzI2IDIyOjExLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+IEludHJvZHVjZSB2
UENJIEJBUiBtYXBwaW5nIHRhc2sgcXVldWUuIFN0b3JlIGluZm9ybWF0aW9uIG5lZWRlZCB0bw0K
PiBtYXAvdW5tYXAgQkFScyBpbiBzdHJ1Y3QgdnBjaV9tYXBfdGFzay4gQWxsb3cgcXVldWVpbmcg
b2YgQkFSIG1hcC91bm1hcA0KPiBvcGVyYXRpb25zIGluIGEgbGlzdCwgdGh1cyBtYWtpbmcgaXQg
cG9zc2libGUgdG8gcGVyZm9ybSBtdWx0aXBsZSBwMm0NCj4gb3BlcmF0aW9ucyBhc3NvY2lhdGVk
IHdpdGggc2luZ2xlIFBDSSBkZXZpY2UuDQo+IA0KPiBUaGlzIGlzIHByZXBhcmF0b3J5IHdvcmsg
Zm9yIGZ1cnRoZXIgY2hhbmdlcyB0aGF0IG5lZWQgdG8gcGVyZm9ybQ0KPiBtdWx0aXBsZSB1bm1h
cC9tYXAgb3BlcmF0aW9ucyBiZWZvcmUgcmV0dXJuaW5nIHRvIGd1ZXN0Lg0KPiANCj4gQXQgdGhl
IG1vbWVudCwgb25seSBhIHNpbmdsZSBvcGVyYXRpb24gd2lsbCBiZSBxdWV1ZWQuIEhvd2V2ZXIs
IHdoZW4NCj4gbXVsdGlwbGUgb3BlcmF0aW9ucyBhcmUgcXVldWVkLCB0aGVyZSBpcyBhIGNoZWNr
IGluIG1vZGlmeV9iYXJzKCkgdG8NCj4gc2tpcCBCQVJzIGFscmVhZHkgaW4gdGhlIHJlcXVlc3Rl
ZCBzdGF0ZSB0aGF0IHdpbGwgbm8gbG9uZ2VyIGJlDQo+IGFjY3VyYXRlLiBSZW1vdmUgdGhpcyBj
aGVjayBpbiBwcmVwYXJhdGlvbiBvZiB1cGNvbWluZyBjaGFuZ2VzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbT4NCj4g
LS0tDQo+IGFwcGx5X21hcCgpIGFuZCB2cGNpX3Byb2Nlc3NfbWFwX3Rhc2soKSBhcmUgdmVyeSBz
aW1pbGFyLiBTaG91bGQgd2UgdHJ5DQo+IHRvIGNvbWJpbmUgdGhlbSBpbnRvIGEgc2luZ2xlIGZ1
bmN0aW9uPw0KPiANCj4gSSBjb25jZWRlIHRoYXQgdGhlIGR5bmFtaWMgYWxsb2NhdGlvbi9kZWFs
bG9jYXRpb24gb2Ygc3RydWN0DQo+IHZwY2lfbWFwX3Rhc2sgaXMgbm90IGlkZWFsLiBIb3dldmVy
LCB0byBzdXBwb3J0IFNSLUlPViwgdGhlcmUgd2lsbCBiZSBhDQo+IG5lZWQgdG8gcXVldWUgbWFu
eSBtYXBwaW5nIG9wZXJhdGlvbnMgKG9uZSBwZXIgVkYpLCBhbmQgc3RhdGljYWxseQ0KPiBwcmUt
YWxsb2NhdGluZyB0aGF0IG11Y2ggd291bGQgc2VlbSB3YXN0ZWZ1bC4gT25seSB0aGUgaGFyZHdh
cmUgYW5kL29yDQo+IGNvbnRyb2wgZG9tYWluIHdvdWxkIG5lZWQgdG8gcXVldWUgbWFueSBvcGVy
YXRpb25zLCBhbmQgb25seSB3aGVuDQo+IGNvbmZpZ3VyaW5nIFNSLUlPVi4NCj4gDQo+IHYzLT52
NDoNCj4gKiBzd2l0Y2ggYmFjayB0byBkeW5hbWljYWxseSBhbGxvY2F0ZWQgcXVldWUgZWxlbWVu
dHMNCj4gDQo+IHYyLT52MzoNCj4gKiBiYXNlIG9uICgidnBjaTogVXNlIHBlcnZjcHUgcmFuZ2Vz
IGZvciBCQVIgbWFwcGluZyIpIGZyb20gWzFdDQo+ICogcmV3b3JrIHdpdGggZml4ZWQgYXJyYXkg
b2YgbWFwL3VubWFwIHNsb3RzDQo+IA0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVu
LWRldmVsL2NvdmVyLjE3NzI4MDYwMzYuZ2l0Lm15a3l0YV9wb3R1cmFpQGVwYW0uY29tL1QvI3QN
Cj4gDQo+IHYxLT52MjoNCj4gKiBuZXcgcGF0Y2gNCkl0IHNlZW1zIGxpa2UgdGhpcyBwYXRjaCBp
cyBtb2RpZnlpbmcgYSBsb3Qgb2YgdGhlIHNhbWUgY29kZSBhcyB0aGUgDQpwcmV2aW91cyBvbmUu
IE1heWJlIGl0IHdpbGwgYmUgYSBnb29kIGlkZWEgdG8gc3F1YXNoIHRoZW0gaW50byBhIHNpbmds
ZSBvbmU/DQoNCi0tIA0KTXlreXRh

