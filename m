Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CONJFkKqrmntHQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEFA237977
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249280.1546800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTc-0005EH-0O; Mon, 09 Mar 2026 11:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249280.1546800; Mon, 09 Mar 2026 11:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTb-0005Aq-Pg; Mon, 09 Mar 2026 11:08:43 +0000
Received: by outflank-mailman (input) for mailman id 1249280;
 Mon, 09 Mar 2026 11:08:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAaF=BJ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vzYTZ-0003iR-UA
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 11:08:41 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53a1cd69-1ba8-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 12:08:39 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS2PR03MB9695.eurprd03.prod.outlook.com
 (2603:10a6:20b:60d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 11:08:31 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 11:08:31 +0000
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
X-Inumbo-ID: 53a1cd69-1ba8-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umqdO+OX5PucfeKcvu4wVdnZsYjWf+IqS49sNdKVg+VPg7B90AQayl2p+Hh3hB+Pvxf/ifgBaRrUEeK4R3vcn/WHuByk69QzfUA4phNjmpGDscaC53D8afyoElkTW22zPMnruz29Q4Oe8mc2mAqWVIHGAqeI4vTDBFjojoKtMz08ZuVThlq7oYokrLWvWWqG26k0FSjDjpRnwZSPEmZfsIvEIaaOnTRdC2xPOVB3OncBTRoQ1MYhj0FRhNwdHKH8wQw9f5pesRN+Y/EMk5ZGUiL4e/cWOMPddtdhcHFa5NA8TjKQcRA4UXH2lMzqM01OTx4Kj2w++i97S5pW0siGrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOUp/hM8Mfho1OBtuL27ZRMzjlpOJY9US27a6WY94g4=;
 b=eOF7p8Mp5YP0DvPVx71TGejxYorK5R30noHdTP8m+QukpePE/vJqHekPltSuZ9dSbaLMFq0EknZidAk5pS8vlryI/ZZsaGsnZSL9ddD7RBOAGGBqAXYpiqBW/FoaIhpR3OJv9MmP6M1QuQawXjz/wJQjy7RAlN/UwHb/eNxZQdSdshLM6UR+oeOWwromGi72KJGozZVWuslHBAEg1EPK3YiIAiE3WEFW3HVyVxuIoCgctKauqLRuTWHRd8H7YviL+g3NzXxxgziFrXaEEPEf2YtidNGLeYCABewmJxDgQTQI+TGCXM+x7GB0jeP9R+grd5h+T82BUMp5MnHcxPZdVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOUp/hM8Mfho1OBtuL27ZRMzjlpOJY9US27a6WY94g4=;
 b=UnWdGs2MYb/G8XrKT98/qp1aCJF2wG/fuPc75Rd6vLIy9IsyzBmI2cKQG8STI7VEcYnMKH0jZ6DAMtdWS/lsi4ktg4rrSfKkcxk8TQ3Gixheqqd85cxpYnKb1kBh8t4PnroxWgSgIzGHNfGHtdwMsRxXG8O/7iOZfRdKm8nwWqH1jNlAtI0oc+rfnpcmZI1DVO4NEbTAljTRSnqjPlZsYnK76sAAatnWeDvaVvXhwG0ykI4avvkgnY0PEQkv1w3rQMviTmvbTvqpYGTpAfmRrlEsT2DRiiCx6bLN1KY+B1gH6KOHGIrKvvt9QYsmxSg0jFD9oe2GD41t/42LnfXGcA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v2 5/8] pci/iommu: Check that IOMMU supports removing devices
Thread-Topic: [PATCH v2 5/8] pci/iommu: Check that IOMMU supports removing
 devices
Thread-Index: AQHcr7UOnGwu40XXHUWWV8IGnIja1A==
Date: Mon, 9 Mar 2026 11:08:27 +0000
Message-ID:
 <0ba0f0a8a7db5c762fa59e2eec627199c023f8b9.1772806036.git.mykyta_poturai@epam.com>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1772806036.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS2PR03MB9695:EE_
x-ms-office365-filtering-correlation-id: c684ad2a-66bb-428c-6f87-08de7dcc32c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 AXXT3QIz7oRpjcsqQ0pFqIoWteZ+eX+KlnT4L3c9V9fNfJDJTfPg0OzSIlE474qZDJmN8pD2SQFYUS5pm4hWJze3YtSmOD1+URh4sffyoRu8Qd7qPSxBnCTbsir6S6rZhrW7Fy6F3/Fh2kzWi93DM11xR+M3myXHq0gGP0UMPjT/vT+WCiPzCrYf8GfuSTGFvzUx7poM9xe+s27mTDwzYYJl2hcQCqXvJfCIwCiCSVSebq00ryyhlDsw1Bnv3wtwV5KOmG8F6WdxIAvQlqBM3lVF6jjsmsgY6xs/2RBK1/0NdsGisdycRaUxuKKgdB9QKcRkJxnHcaIhE7jap6oEm4gQikg9NCZPsIqQTAQnlD9ZREbRMpTqQ4nr3KqJyyh6f9Z0gZoyFTluM400LFzzmQGyeccFKny3MJdeVcuVOld+qHzh1fa18axj3XpvsBBeraAsDMqXVe6UT9nEHD3ZnrlOnBX1rQtSq6qdIRDoU4ov46GQIqrPznHuOVtBLqDrfpoAFzXTX9dimpwgZ8gPxTf0whyWl+vCLdM7vDOY4Yf+gHtEQddob6s98VJsnEB1Kt6X5lzDatbqxF3oVQh9E6pkG3pZ94tnRlQCUxwl71+Qr5+tU7kb01DgFvnO2UW1jup4lpGIqJXhJMy0642sEyWG25Mo6uJXHuzuBAStdxljgyb+u1mcRC9mro7vnIPG3ceCLRX0Aepw4KMK/OkWeMvomCI09sbY4+FswT4cwTYZtIoxP+L4lIxuIo0gBTRtLkt91yxo9/3W4p/f6FU7Joi22+l7sQcvqT9wYDMpz4U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Dr6A+9qrm8mFQwM5XB1Bx6nlB82GevkgQrkrChnnCWS7+0eoTKsO8VU/m0?=
 =?iso-8859-1?Q?FkdOlQ6kak+0NtS8++f18eVE3n4J4ow++SizF68QMn/9Yol2EL1YB2PPlF?=
 =?iso-8859-1?Q?TKyJpxttvTgophvM1zfwH/p66UoHLvsAV74mVP0WZ7Mw0Os2aztrNhZwqr?=
 =?iso-8859-1?Q?4YbmpWin3tbufTKrCN44IMcvpftth4/dxsC3J7EtmJVknVPt6pRzO1RFsr?=
 =?iso-8859-1?Q?BScS33HKxBOc1GK7zBuTP4iroIoLpREuM4mlSbRvbn8NV9w8tYK5tIaEw1?=
 =?iso-8859-1?Q?Sq4ko0XAfcVN9k4oYxHgHJ5Wv0ZXgZhivB3k0O66J33PZ6vHl+sFjDKvNp?=
 =?iso-8859-1?Q?eOiENj8jBbsUqOAhrGL/Uf5I94y5H7r+FoYNMb/vYLx1dXA2GXeVhj08H+?=
 =?iso-8859-1?Q?VqXR6F1Lz6hBmE48JVl1q3TOg6R2cMnFywcPhJhe1s/LdZmSdtn5vpdqXR?=
 =?iso-8859-1?Q?ni0odqy/OQAKTXhDLDtStUFBHtnE2BTa7Of877rgFPV1WFOp6JgXobDYUZ?=
 =?iso-8859-1?Q?J3mA006yd6re13VXcLdYTRhaQqtMMt27ryrPh+1WWy/Vpf06+yYYCUoP8W?=
 =?iso-8859-1?Q?ok5s5KePTnDU/gEbLGscLpUuD/5vH7H1udJVtmP8OULORV5IWhPnDkx0H7?=
 =?iso-8859-1?Q?xMrguCz5VrFtgmK2UHiF5/EK6vzBba1R0SsXgT4JLGRTcKtLzwUA1cg8mC?=
 =?iso-8859-1?Q?585PZ8aXzMvo8Ylq/MsnHyNxpASS3wP4+Mbl4bQETyS0uZ5MEaHSu5O4df?=
 =?iso-8859-1?Q?0U5TWH8t65g8g395bTRGxKbFWFGxrg1vxtvUd3D7bzzyPdWmjMvWdNqmq1?=
 =?iso-8859-1?Q?xGCEODTCSKzC62ekYOGgoTR9oEj3vauBxIyz5SyyEZPzH1qYoInMMLA3GX?=
 =?iso-8859-1?Q?sdCh+DINZ045OAZcCjJojJDItqIDwG7G6h1vFWfCiIfTSQi+43jSnNO6Va?=
 =?iso-8859-1?Q?w04bSDBB5LP69UgL7ytEiTUfEve/Mzby9hndB61viCiuyTAq5SPXAz9UxY?=
 =?iso-8859-1?Q?3WaxAIIBjpqosF7KxK9b4KqXcDCdYdDQ03vhcEYDOztooA3e2o+TJ446rA?=
 =?iso-8859-1?Q?fiGWh/yg5xfFlxo2yDozP6m7/c0FGbPXmh3YXpwk6f+KEkqFv9uVYHJi+S?=
 =?iso-8859-1?Q?8FFnHbrrK4bSRM/FnhojxY4CXr/tck/Q+PXplrLbVXAt/kTozwJArnNEi+?=
 =?iso-8859-1?Q?bbNFrI70a+pFXOvDXX8K4RBgrnSkFmbxTo/Jj1YnD1Smy3ODGK8/gOWLBe?=
 =?iso-8859-1?Q?AocqidWjgX2zL411v/Hl5lc3D1+YPZoe14m7WCzbzFWEOeH7DHHaENn3of?=
 =?iso-8859-1?Q?1js+Nph0+rvzkXZTHapoo9f1xlfoW8fpo/G157F5S2KLi24sh8rnYIHoY9?=
 =?iso-8859-1?Q?MTDTl5kaZdHrgpYtCuLQSMm3rfKFymLqUDMtSNWS4pg4XpWCagoze2X52Q?=
 =?iso-8859-1?Q?cKk8g86WgOrEpk0Rn57ntTCM4U6szcMiGQP3U6x4fda+wmDVwbHkBu946I?=
 =?iso-8859-1?Q?zLHkKm7MAJQxYfHFFP4TE7uW7hEA9tZsXCk9s0i0/Zyy9/A/tsQbPWnQV7?=
 =?iso-8859-1?Q?BfYQB0xZBDHjwX7B8xBZSSraxSEJilkvig0zuEfccYLqBNqd9z9x6z3dEz?=
 =?iso-8859-1?Q?aoVHERTU0lKzBAP+0ZOmlEouhYURkINfUOvFUaHB7C6TyItoZ7cA7fq6jT?=
 =?iso-8859-1?Q?3IPPNzW+aKLhHZgYkranl64LfH5VecrQb2qldbsN3nh8wH8fToqpPQYtTm?=
 =?iso-8859-1?Q?oYWO863cxr7rQNnzySlkbC7p50kRy4StN8KVTpXGgqSSdwTbUGSDdaKoiq?=
 =?iso-8859-1?Q?HZIpJjBQwL77H1vOJ8o5Dg0TV9lXrFQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c684ad2a-66bb-428c-6f87-08de7dcc32c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 11:08:27.4268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JnvUHuIWekIYrnFJeUMcgMYD6aJ4ohgGw9zI3gNqMsz0vwo9XvhikNeGn28edFsBLOhfV8cGoLb81UPrD2FGMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9695
X-Rspamd-Queue-Id: 0CEFA237977
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

before trying to remove them.
Some IOMMU platforms, such as SMMU-V3 and IPMMU-VMSA don't support
removing devices. Trying to call remove_device will result in a crash.
So check that platform_ops have remove_device set before calling it.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* new patch
---
 xen/drivers/passthrough/pci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 464bb0fee4..704eb6e19f 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1545,6 +1545,12 @@ static int iommu_remove_device(struct pci_dev *pdev)
     if ( !is_iommu_enabled(pdev->domain) )
         return 0;
=20
+    if ( !hd->platform_ops->remove_device )
+    {
+        printk(XENLOG_ERR "IOMMU: remove_device not supported by platform\=
n");
+        return -EOPNOTSUPP;
+    }
+
     for ( devfn =3D pdev->devfn ; pdev->phantom_stride; )
     {
         int rc;
--=20
2.51.2

