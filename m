Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLpLOOgoy2nLEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2373632A5
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268241.1557633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHC-0002KX-J1; Tue, 31 Mar 2026 01:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268241.1557633; Tue, 31 Mar 2026 01:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHB-00024f-Dk; Tue, 31 Mar 2026 01:52:17 +0000
Received: by outflank-mailman (input) for mailman id 1268241;
 Tue, 31 Mar 2026 01:52:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OH6-0001L0-Sm
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OH6-00Cy7w-8D
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28a5-bab6-0a2a0a5309dd-0a2a4507d1a6-18
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:12 +0200
Received: from [52.101.69.126]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28cb-fd74-0a2a45070019-3465457e723b-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:12 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:10 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:10 +0000
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
 b=myNmealWzdY5mI6h3ftSFJqQr3mMg3XCyKORDutnD5bl7Jmg+V77pOgbnLrQW0GEmltIOXXxmujOCNdz92HcwQ89rQHnfW612toeeZRVbRgBE5KPQ2vqMOXugBdrkIhunL21WvQhxYPjOQ1qdO+DGhaIcN3KFDgSR1h211BBbbvdff+NYH4JYDn/CBIRprp93LGgAi2OuxrnyBuWMD41ei2kq/U799gHYv9ugcVXIt7f5/wFCYEqMJLmuq0/caDxAhMDIblEBQhpTSX/cE1x4R3noxrLVKZudqAWi/3Fy553Pv91ONykhhe7vrz3xyfhBZMk4aAKJAgGeOVn/d29ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7caqtP6kUCQ2bX8Z5xVRfCBcUDpyNyH303mwvuLmP5Q=;
 b=y0Q+lT5pHpI6gRl2oxqmzw6xlVJIMw51IOcXe3LHQqrk65WDNCIpBMAgr+RxajAXYKGhC8/SZ8xlNVLC87sUqqyFL/gP7vFxeRPGIN/PuQnv9MwsHn8EVX+GDzoRdTY61OMx3P1x9hf8ITsbSK7hKwFc71g54+dOVsSjqDsgfk5NioFopkJMpFFeZWo60FgQ0ndZDQ/Oa1ycsaUN/vrtbMR1HmGm1T+PJHaAbvGBJ0XKjOIYmSGxH0gkE4Flt++LJHQhzOHi9RIzsmDTNoExLjRQoJoybacmS/QfMCatURCR6mOwkJPQLq7T8jfeOa052gNVLuTa1I6xMqNb+asqwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7caqtP6kUCQ2bX8Z5xVRfCBcUDpyNyH303mwvuLmP5Q=;
 b=iLnbl93TjtxV1zfRD/Qy52mOHbD4Tt4x0MXjk9h0KjorcsErzNtJfjP7to9W4H3YfbxrEe52naqweSABgdUQ9hbR1cZL/t6r0+wqEnF041CEGCNmAkGis7Eaq+Ndcrp1H0WV6LUQCcSOHZpwJG+PLQgNHnNwIBPUr7qG5lYZaTLyUHK/w1WaHUbSDTv4sYyxgaVGZlRob8Dd/GcRV5SStTRoPoOE3I/ktKSg1GXJxzcsuMMxm6MZwGWR7+S95UQ4jJY0C1IPYnWzqn5wLEwZ0tzNy/fjra4I1ru0v8vwheq7SKeK44v/b4vs7AVKXhAEkt+KWb1d7Vi4I9sG23JKLQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v3 13/23] xen/arm: vsmmuv3: Add "iommus" property node for
 dom0 devices
Thread-Topic: [PATCH v3 13/23] xen/arm: vsmmuv3: Add "iommus" property node
 for dom0 devices
Thread-Index: AQHcwLD8+A6Q7QUy70+CNogGnruNBQ==
Date: Tue, 31 Mar 2026 01:52:10 +0000
Message-ID:
 <7911f13c4fa495fb330eb611e41465f8897fa87f.1774918270.git.milan_djokic@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|GVXPR03MB11035:EE_
x-ms-office365-filtering-correlation-id: fa981a2f-88d0-4be3-3183-08de8ec81f74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 aAkydTWkxACDNWruRqNre7eCBDKlYz7WENjRaO1/aSfdN+sVN0omvWJekpo9xOo6Iwy/ckaZhdQVUAGifUpq783F7SKCdULsIMgCqgC24gstJCEaaJC3dgPGsOgdUO2OmHmUyCTFMebwpzJiE3C98e0vE6dFQ5y7mVDPlvRgVIc+Xf7eCPoxoCzvu4+ZY4HzzjPAXYyP0eg/YY8M+gZNaHxxDv4EfgxtCtTwZWjKurrl9hQn/y0FoXglckmQrdS7mnSkKTQLBAkE/PjXDqGoVYu+ipSu0ogH5BRPoycrX8xd6mosjO+UL2ajRYRtQbtuJt7t0Sr+0VDk59fSr6JboVBQfsvqN2Mcio3rZMptcsbG0SwbQtLIO9+31dyE60Es4r49AidoUSS+Fbg6D3qzM0cR8mBx+geDLThwnoKXRR5tF8ePmUvVAaLjgvQ85QX8tX2BShrkvIZpKtKsc4AcJzihOnBle+Kdou/ixHEd4MWDv5yhrpT9A54MGmMpJrvC/+tpxqFLBTCUBpOBiBf6A2n0dQ6Rw9pYmhLRdxoqJW4pR0K8bkY5OouU13m6EtSr5DFLn0Rx2zkMvqDLiu+t3BG3LNUHSRzZrwfx09s9R5bKOEfj4LcI1v07Pf90F+LLxEBIamog6PkQAwISNpG83rkB//xWVjAjyOjSH6JrgY21J7FisGapWkKsIrpSeQpSSaNMBqqhBQ/HE8ibsNUVn78uLEct8+7J8xWYoS5txHts0H1ZbWLDyr7LZ20N1jlZPETErsNBBR7OwwMM2aGaUq4aFpy7llbL40KR8SQ7FjM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cWAW/piGozkzgOpznsOEiZXp8l2aDGmDk9EiwCGweX0eOzh1FP5u5tU3YW?=
 =?iso-8859-1?Q?Yty8t8KOIgfvA81CmqLTZlRT76fsa7d5Fx6JJKVB7dXSZh58N6goaEbgMz?=
 =?iso-8859-1?Q?T7sEnlriCNITD63U5d9eVzKI1W4BwrEhI2goFOmBfSl4Zbs2ghaoLmy5gx?=
 =?iso-8859-1?Q?B27DGZq8v3ZtyL81jBfGO0Q7jzmGec89z2n8VsFC7qY/HPPTSW/g0JmO+t?=
 =?iso-8859-1?Q?aIR7o+c9XxFIudn2B8qluc6e9o/rsiTXQATWe08ei2xwt4rRIC0IIf4f26?=
 =?iso-8859-1?Q?TJPm4VZtrw9EARltfc5wewWcEFml4mcccp/zOQWDqBWVkRv/DQRwdNb6fl?=
 =?iso-8859-1?Q?anm0TcBS8AU63e86gtqTaHBno1OniQARL2DepykgWKQ2lB2DmPyPlYrAfx?=
 =?iso-8859-1?Q?RSK8v0Sl7Bg0ZEfjInUISOtEjruGcTmYPhR+rw/II77aXnxXYLPLSiIaO3?=
 =?iso-8859-1?Q?J/DE5OuilmyoeLkGaCBASBIHaxWboog4rXEYLGxbDwjk9Xhj69z0e7xgge?=
 =?iso-8859-1?Q?UVD0WxSb2BWqiJt5Lbj8EMY6naYo4SuxooDbfMPh+tlI48F5E85glKxLcN?=
 =?iso-8859-1?Q?YulQMpm9eiDFlcCWFTI/KqaV4vHqvbX38hkPZ7B7LOCD9YaKeFY+mDolcV?=
 =?iso-8859-1?Q?uxtvhUb5oF/D34mGo54P54Nahpt1zzS3LlL2fDOEhzJon92RjeEIDbECfi?=
 =?iso-8859-1?Q?ZBV/x62B5NzwPwOiw7ZOw9yuxdvj0SLUsPM5lLYxzkIsTVkk0yAbyvOWLf?=
 =?iso-8859-1?Q?29N6yF42J27nL7lalfHxFBDQwR/KHjoTMsmfITcxWsRxEvkEh9QZIZYkI2?=
 =?iso-8859-1?Q?DqmECq/L1UuzFtQOskWV39rwqykOu9Y7DMYn/0V0/Q0ZTgC4575cmy8heO?=
 =?iso-8859-1?Q?dy+Y/6Vi/mIH66L0oWxT+m4Tnry+8DsYzgKfJq5wXa1sksJHuU+hJZWUJ4?=
 =?iso-8859-1?Q?l+ZA50arZAnHpfOKkRYcs+g7Kx9G5conUeFFSmpF+QkizMF/1oGgPtJmjV?=
 =?iso-8859-1?Q?No388PRhNZy86INfHDSq02DOC7RWgXJKxPhI4Xy2xxcnxwrDBJcYhcd49G?=
 =?iso-8859-1?Q?VTW2IcvUodqs77mKzfhxUGipaRcJy0ESrITEGUjcqapXYwX3EIvhG+CAxi?=
 =?iso-8859-1?Q?TClGItvNp7dX4MgOilHwJ/tU+J/Cu44ZmqePzHVKrNzP1gZeyGkDAPwgQj?=
 =?iso-8859-1?Q?NxMnLAKPpf8JfU+y6vFhHH61AceUPCt40jG69llxh/1aQIezRu4VjUiyPE?=
 =?iso-8859-1?Q?xjM2OHrfxZ2fXGJhBuGk9HrtRboLYhq/fj294IUUKg67DbSXZXoSSUHevk?=
 =?iso-8859-1?Q?QyYykyEiCANfA/AZxVV0UbhT16dz40gZwN3BLWInkitSu0XBYrL9C+95o7?=
 =?iso-8859-1?Q?WY2k+FfO90wKjs0fE1OCqOe2ce91dTA419qAj0zSS7b52a6pSaWMsWsEEg?=
 =?iso-8859-1?Q?hN+kudG+OXMbge5AkAs3pZngmpC2Cezpl77iK2h7RQuJpKuXqgEsa2RRqM?=
 =?iso-8859-1?Q?yt9Mt+Q7qV2IK/Hgkd9ECmGkjt/5VERveW2lZuNDHVpnX1LOt5huCH748P?=
 =?iso-8859-1?Q?9y/w0Wj8dskTWW58Bz5+tDbKb9VdVW96nTe0fV3ndBZWdns916UunARht3?=
 =?iso-8859-1?Q?nj/SqeiEP1QcihDykqArHPKlXLpTP/Gvuk4C2w7ZxqFSeDlsKzddTAZ/dd?=
 =?iso-8859-1?Q?MrdF0hlTdaTcO+E15IrgCRw6YYyqYD+v5xTzz1KwpRnnDj5YhoWiLLK7rv?=
 =?iso-8859-1?Q?xIjE4YeMhlLV/CFhrDp6F6LS+h655LgcyclcVv1UQFYiIVoEufaZc+DoDS?=
 =?iso-8859-1?Q?nj97JDY4RLOa2OYc2B5kZp5J7Dts3JE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa981a2f-88d0-4be3-3183-08de8ec81f74
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:10.5097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EsIsLIiV69iA4SH88HBpFPtaTV4KXpG73CMY9i49/VvRt998taSEdTgyKQUibIqarPm9E7UkGfvV1ii4ktqMbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-ef75cf/1774921932-5C989303-53CBB828/0/0
X-purgate-type: clean
X-purgate-size: 1090
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3B2373632A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

"iommus" property will be added for dom0 devices to virtual
IOMMU node to enable the dom0 linux kernel to configure the IOMMU

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/domain_build.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a51563ee3d..30a4f1fd09 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -538,9 +538,12 @@ static int __init write_properties(struct domain *d, s=
truct kernel_info *kinfo,
             continue;
         }
=20
-        if ( iommu_node )
+        /*
+         * Expose IOMMU specific properties to hwdom when vIOMMU is
+         * enabled.
+         */
+        if ( iommu_node && !is_viommu_enabled() )
         {
-            /* Don't expose IOMMU specific properties to hwdom */
             if ( dt_property_name_is_equal(prop, "iommus") )
                 continue;
=20
--=20
2.43.0

