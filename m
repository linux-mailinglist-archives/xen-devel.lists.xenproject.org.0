Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPsJINZlymll8gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:00:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355B335AB9B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267450.1556953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BHg-0000jT-U1; Mon, 30 Mar 2026 11:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267450.1556953; Mon, 30 Mar 2026 11:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BHg-0000gK-PF; Mon, 30 Mar 2026 11:59:56 +0000
Received: by outflank-mailman (input) for mailman id 1267450;
 Mon, 30 Mar 2026 11:59:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1w7BHf-0000FF-0o
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 11:59:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7BHe-00CdRq-Ck
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:59:54 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ca65af-bab6-0a2a0a5309dd-0a2a4503af12-36
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:59:54 +0200
Received: from [52.101.70.120]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ca65ba-1947-0a2a45030019-346546784220-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:59:54 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB8639.eurprd03.prod.outlook.com
 (2603:10a6:150:95::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:59:51 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:59:51 +0000
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
 b=AM50aZ4ISwxkt5YJBE1FQ86cgijEhTNV3pJgK42CHERX9trvYaFyIVHi/4SbO98/KYLIkCrTjmdBvPfWKQxDYX6cbJCqJXZ2Mtyd5L8pGp3B/vQMh50BMu/y7pDEOhovVPmZ9gAqRpjA7+jfT7EhDBqiKxyFUtArXofrZ+xsR6ozRh5qZ8+0R4DMgWC2uBU0BS7v7jEFChV7D1WQ1qvxvJ2BwLQqBaB4DcndJEjDPEPc4Rzpk20/1oQrKUxMkXU3nbIkOInKP/QDxTQ9zjVsQU1VXsMXYm9D7v1Z9yE4QN4TTH1i3hs0u7A9aIMKynpYoseNp2iTm2VGiVMVCx4bTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xTyO2upwSLUp4nTUcsf626YB6NY7IhNhJBAKKSZkKc=;
 b=KFG3LU+rUONVXNued0k9UCdoiq2CIsT5qat1iiS5mPbdI1xhtZcuK9/x7xVKjrV/2QAPqr+6D+HZp2Bg7WuIjBe5mm6G1VjyGh0iJn4ZNOWWJOos/oMftQwlxy563GslH4s3qisi9iXl5l59JElihD1PDnRhAfZmIS5KUgw9S51ibW+dgPpkQVAqMeJVD2jLUv8kQkQemEIs3ltQpCsEe9c626GaomiyAxVawzMQVCq6u2kf2Ou1CRkq4DaP8FAtNQAhxlfc89/FSy9YgyLV9Z7ChzXxU4E3VweqQUWR0Jy9b1/cRerIE+mOlFnmKhfASxaexkTIsDX1EQn0UypfNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xTyO2upwSLUp4nTUcsf626YB6NY7IhNhJBAKKSZkKc=;
 b=PdOKF9ULXnmuQcAL7nTvTaTDbUg1NGfdsrE66Gbl0lXtfBeArg2EehwuntCsZkdNciZfTnWnDuvYLSWt4W/DKnatnI3mYk9XM/5Zj1bfEy9pHyBD7rMYw2SeqGMMxn9QkFOKtnhPMrTO0pXh6xs/8kGQB0jeEdzL2chJr1yG30qvte+dAL/rqJqsoQu+peXvYvaJwk+A78cxt3i8LUMwy3cyEJ6+MR5+7amyeS8LRNipHhRiUegr8fe+mgLVRJJWwbCkAqDoiV+WeJLrp9Ib1rEai+fiCl4s0DpkITTYh2s8ZV9aF+kTdMSZL+d6tlYWf1u/cyHpPYx1vVal80qAMA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 3/6] Kconfig: Make cpu hotplug configurable
Thread-Topic: [PATCH v7 3/6] Kconfig: Make cpu hotplug configurable
Thread-Index: AQHcwDy29LsBHsG5wEG6AuodBSMA4Q==
Date: Mon, 30 Mar 2026 11:59:51 +0000
Message-ID:
 <f3c523ef5b94e930902016d69b440032c9e6c3bd.1774871881.git.mykyta_poturai@epam.com>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1774871881.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB8639:EE_
x-ms-office365-filtering-correlation-id: a4b55bc4-8d77-4b4c-be4c-08de8e53d956
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 Nlt9eYmtIXFMEHBUlvs1NuKeGDjx2nl7cBuut0T0rVbgrmtsSUAdnbvUvqbIVcAQXbI+SrW9BA7xCz9y0Jowdt2pUuaVEDLbEtruVlybCWnroa4w3A+W4mIMSrV5oCoVMCBJ20LWB2n3ggl251Pewp8xKmrkXywTmcJQKfoqZCuRbz/BZsDngUTHZw87On0b671sYLoDh87UXR91twqPEShoxNsrFs/+D37120jfDt4TXmbpM6nK/ZgdLOp5ffKq7TTqIFHGhMNeUBkNxCUNNKOYoeWrMLmCkM8gV66I0HaARO1iikS+u+l87qU83o5FTpQQ3XQU35FNdwRHQ7OvZJaT+v89dmANJSIVeEEoP6jL3KDvBFy011qg7xjTe8g6Xq1hHK/eT6lb0AZUMdI+2wjbbA9wXvTuFNfh2DR/HKbPyk2+7l87u9G4KhdSsUgYYI9fXzy1JXjiRuRuYrBg+ibd0oyhrw28SJ7pW4a5Xsz5/wdmPFzpFflY8WdPNOLRTCIld1iGN1E29UHF23swLRC3BLqvh6UWLhZQIYjrtcZi0T46S8WP2+b+aUSs/7sMuHaDjeIvSX7hIBMNvk2m2WVBuVy6aeflCne5QxOzcCEk1pf0sU0xB86mT1DMf0zaNBM2t4MWTLbiM6Gb+8ad3hnNQLQbqiJ5tH2gxBaep7NwlD8/94q80hYVQVWwcCuOP8yJwMYDsIJpuFPFo61F92IpMFxG+zadvtRgFi9mGt4b4v9dhMkvSfeKpjQdFIeneNGbXDvif5/miYvzNxbDoAHLEXjF8yYQCN60wuKFzQ4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?y18DOCd6FB5TRyYlHfbH8ie1UWQg94USW+ZPCKL304nmDyvBGws4ozM1Uk?=
 =?iso-8859-1?Q?IgybyGc5SRrGFJ5E0G+Ac8KOIjUFxWzj0dVe6ZpdQbkJ8+dxuLzOONMhbi?=
 =?iso-8859-1?Q?l/FoFrYVrYb2/sQCSDtGQdpDzNeia7am0m5bHbnvvA6VyAZjrraL4Qltbw?=
 =?iso-8859-1?Q?Nl5e7uN+teM0S3VhhDVWDS4kMgwgothasCeMiK3BofxqKx8NwwHmJmga7q?=
 =?iso-8859-1?Q?rF8ahXDe//9c5WDfp/dSoPKVOOdlBfX5ltc6qM2wGEELoU826EpoOfbmwD?=
 =?iso-8859-1?Q?pDF2gldCHtu+w1jR/a9+uiEGYhGIv4p/kYyCUzquux+tHGjUzz633Zrzmr?=
 =?iso-8859-1?Q?ylm917NZj4Ay0+fMUIhKNNHXKtY08Mj1Z19lmtYM9kqFbycr1b6c0VEKSI?=
 =?iso-8859-1?Q?Aptetq4QiFRc5R6XX2hRAIz3uoRDeXFiBvKAzmUl+eaz9ZbzboRrdeLAuT?=
 =?iso-8859-1?Q?bHkO190dnJNC///97r/B0e6c68s2SUMCJmRAs4br8w2k/d8N9thxQbhPTI?=
 =?iso-8859-1?Q?dEnUtD3Lcd300ZnkGIvuO1eUiXB9MazYJeSWp1xLFPNoAdZDDylPqpMlf5?=
 =?iso-8859-1?Q?tr2wuE7L5fui1gPj3WYEERfUPl8YVDykcji4pfrWHYHLACPO4aesGtSXwj?=
 =?iso-8859-1?Q?Gvu6n2v0hh+jCoSqN17cRvohBUbvFVpdJLRMWJRJxW/36a9zu+qAIdaz2x?=
 =?iso-8859-1?Q?CEGMVRYpGrpNyCcZ3tteycFyVDci+kgBs/hf1XOzWiUayIPq1Mm3hVLO8u?=
 =?iso-8859-1?Q?aNnbuqmlEQtfTfNpuNNcPZAvzhdUSfUmNxE7R3oX2x+4fjGixNE5DtS3VO?=
 =?iso-8859-1?Q?t48G9t7uxMumIWJR8lkpY+xzgp213QuC1eyQXi12eZBbvtYF00XvUn8UO7?=
 =?iso-8859-1?Q?p/B6uFLVGKXQKrsUa8bqP2hiUHvjhXc5hb708ovcNhElI9gYTQxUvAfT7i?=
 =?iso-8859-1?Q?/HkxiVT1Gj2dSD+EVqScGY22mxEIRm9PeJzwxgZlPQRznmJYgjEJqe48Uo?=
 =?iso-8859-1?Q?lCK+Lng6J6vHb6k/8RU4yKXUXEtk+531xAG310afGGpgi9vS1pPgjuMXnG?=
 =?iso-8859-1?Q?LT8TI0Z0k/IOGiXMObijxJeCz2U5eoJJEECNPyHdK2KBqGhYrmypdl4fo7?=
 =?iso-8859-1?Q?YofcPL9zEM0DBRtUVE0yHGz90DL6mQiTnz/TnegazgmnKe8DjgZemO2RJS?=
 =?iso-8859-1?Q?njh46zMXmBpEWBOTOYlmLmhb5YdxRtsWUGcV6Ro/CGl3sMuB5U7oeZQoaA?=
 =?iso-8859-1?Q?jkDu5Tjizg8TP0wubCuZHvHOsF+xRYKVuGYD2S9K3tH5+K1EMjLD/SNsvc?=
 =?iso-8859-1?Q?zhP7Z4Fl08MAewFcYyXH1gZpGrV4jqjOBrbXy6qlagyo6j2SUgGMEJzGEr?=
 =?iso-8859-1?Q?nXVtfIvBleVnl95ThbHfL48igDgVhVLmTGaIZ0+xK3vv9sVnL71qlA0S4e?=
 =?iso-8859-1?Q?8OMn6A1ly3NXDXsrXACnboSzU4U//5Grkjft9TsWFWPvHguAm20ud+6U9B?=
 =?iso-8859-1?Q?OFVp8ukZFJa/z5Vtwv+0/L4taoJpCWlVvfmBlbP8RjCcEoAtBevF6wjScq?=
 =?iso-8859-1?Q?KT7XEHSJ98YJUrfgOFpO3sN43N44CbBTSXgkaagblDDzFFGTbUkVRUD/U+?=
 =?iso-8859-1?Q?TXveJJLAQqiqj0PhexnRT0qa8AqDm5/twAnChnRbNBwtmNdR0zhGS93G3Q?=
 =?iso-8859-1?Q?jdMbDyAAygmT25XiWuOQGTCcEKloLZhgtqOlLZlkoeufC7aBaS6DsX9zaM?=
 =?iso-8859-1?Q?O5zgHOnnLg8iF7ELQn9OFc5GDhQYws5pZZJK19EMY68XtgCZ0GZ+/2dWDK?=
 =?iso-8859-1?Q?I5GiudqolywFUa9bP1j4MfrHt8XRqRA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b55bc4-8d77-4b4c-be4c-08de8e53d956
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 11:59:51.2052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aLFBYyMAEBtiNhzqULvvMNchQZhws9v59nQEYmKH3lgW4klhP6fxvPKA9tOGgRpTU7/e3I0me338OE5DuUcqNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8639
X-purgate-ID: tlsNG-33051d/1774871994-7748872C-DC4FCF76/0/0
X-purgate-type: clean
X-purgate-size: 3464
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 355B335AB9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For the purposes of certification, we want as little code as possible to
be unconditionally compiled in. Make CPU hotplug and SMT operations
configurable to ease the process. This will also help with introducing
CPU hotplug on Arm, where it needs to be configurable.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v6->v7:
* new patch
---
 xen/arch/x86/platform_hypercall.c | 12 ++++++++++++
 xen/arch/x86/smp.c                |  3 +++
 xen/arch/x86/sysctl.c             | 11 +++++++++++
 xen/common/Kconfig                |  8 ++++++++
 4 files changed, 34 insertions(+)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hype=
rcall.c
index cd4f0ae5e5..e745151790 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -735,6 +735,12 @@ ret_t do_platform_op(
     {
         int cpu =3D op->u.cpu_ol.cpuid;
=20
+        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
+        {
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
         ret =3D xsm_resource_plug_core(XSM_HOOK);
         if ( ret )
             break;
@@ -761,6 +767,12 @@ ret_t do_platform_op(
     {
         int cpu =3D op->u.cpu_ol.cpuid;
=20
+        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
+        {
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
         ret =3D xsm_resource_unplug_core(XSM_HOOK);
         if ( ret )
             break;
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 7936294f5f..a49505fb57 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -418,6 +418,7 @@ void cf_check call_function_interrupt(void)
     smp_call_function_interrupt();
 }
=20
+#ifdef CONFIG_CPU_HOTPLUG
 long cf_check cpu_up_helper(void *data)
 {
     unsigned int cpu =3D (unsigned long)data;
@@ -445,8 +446,10 @@ long cf_check cpu_down_helper(void *data)
 {
     int cpu =3D (unsigned long)data;
     int ret =3D cpu_down(cpu);
+
     /* Have one more go on EBUSY. */
     if ( ret =3D=3D -EBUSY )
         ret =3D cpu_down(cpu);
     return ret;
 }
+#endif
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1b04947516..bdad44fef1 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -53,6 +53,11 @@ static long cf_check smt_up_down_helper(void *data)
     unsigned int cpu, sibling_mask =3D boot_cpu_data.x86_num_siblings - 1;
     int ret =3D 0;
=20
+    if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
+    {
+        ASSERT_UNREACHABLE();
+        return -EOPNOTSUPP;
+    }
     opt_smt =3D up;
=20
     for_each_present_cpu ( cpu )
@@ -121,6 +126,12 @@ long arch_do_sysctl(
         long (*fn)(void *data);
         void *hcpu;
=20
+        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
+        {
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
         switch ( op )
         {
         case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d7e79e752a..0e5b4738a8 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -637,6 +637,14 @@ config SYSTEM_SUSPEND
=20
 	  If unsure, say N.
=20
+config CPU_HOTPLUG
+	bool "CPU online/offline support"
+	depends on X86
+	default y
+	help
+	  Enable support for bringing CPUs online and offline at runtime. On
+	  X86 this is required for disabling SMT.
+
 menu "Supported hypercall interfaces"
 	visible if EXPERT
=20
--=20
2.51.2

