Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFHUMeXj12kVUQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 19:37:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D17A3CE37F
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 19:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278058.1563075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAtJr-0000ot-SV; Thu, 09 Apr 2026 17:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278058.1563075; Thu, 09 Apr 2026 17:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAtJr-0000ls-Pp; Thu, 09 Apr 2026 17:37:31 +0000
Received: by outflank-mailman (input) for mailman id 1278058;
 Thu, 09 Apr 2026 17:37:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wAtJq-0000lf-8V
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:37:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAtJp-0028YY-J9
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 19:37:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69d7e3cd-e002-0a2a0a5209dd-0a2a45079ea6-10
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 19:37:29 +0200
Received: from [40.107.159.87]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69d7e3d9-ba2d-0a2a45070019-286b9f57330c-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 19:37:29 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GV1PR03MB9870.eurprd03.prod.outlook.com (2603:10a6:150:3d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 17:37:26 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.20.9745.035; Thu, 9 Apr 2026
 17:37:26 +0000
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
 b=RpP1adUHHeJ7+T5BXsQ6T0UgCNTBp/RIf0bma6Fj+79zOPDTfvHo+EcrbLcLURLsXf3ZCis8a0gcUA1l/3XFpqg0VDfIVwHS8h555trOyIDySrklPxLbkIygwZ65F3nS09zJobzbGhQh2Cm2PolCTBBtGMSpFRSUIi2GjjcoeEleCDJCZOAswM14hEJGjUUtr1E67vY96+Wyuur3K1NFbz1NIEYkD/r3VXl+dB2laNV8Z8Y0r4p0y5Wf/YZqVESPrCNteSLuFlat2b+v/EoS0JK7DEJz6V7sgl5FqRTqc/IXcNLM4ZhoTGE9p2pHzzMEcJfy8eUzUQxzOzou3/BCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oz6kcvmrfWfOFr05VYYyyaBTJCtYUCnt4WDyMt+tzgk=;
 b=iS0OzG7yG97Ehr3qr2c/a2fX/nKvyCqCvqQ6oh33yxQiOzuJyY60muG/sIrRT6n1qIX4QZL6xbrdjKnGSm4cNBrz8Hes0qxYc/Jpf9cVH3vCUmTGwts1Qv3qqDBzakTB+TmKN9U7lFwC+KkYP6UpT8CGmuz1KpGH4+lMjy3L0Ar4EZUo9zMqgvv5Y236Qa9eW1qojvUKrs0kh2pSbN7yjuGwqvJmzRd5sLsbbGUNdh0iogbSLvwBtmJ8U/VzjL8lYOZaaNA7rTbjtwjzHqSnCLS1MzEh7D6oWxmDO5DudL/whKRr6hPbrBXP1rhLus1YaOmthzexWnxHLxNJczy06g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz6kcvmrfWfOFr05VYYyyaBTJCtYUCnt4WDyMt+tzgk=;
 b=Bj1fJCu1Wnc+qHaTDchVjTzQKKX+wwRnvdXTs8nyrsBzaEt15+M2xA5DHDoWVVllonV4XQLdGAkE66LRsCQIY0oJwQvq+TydK2l4NM4xPkglUlAR+gMSBQhEL7Q5G9qwBzs31gISnvAdjK4ARU51M42eI23JeMBW6V9jg9+yFSlNoMsjktsW5wh23qilVSn9lUQGP21yaSdsNACjUTJW/tHGQX76w5LtkYofRXuP/pDgX50K1zhTs3UJsGO0q9gmRibcbTkLx7I0e8/37vuSR7aqxUbD9sYm15LfmsXtTvTzAsBUvHZKH4LeIpICcu3DFG+dbpJnpG+sd3CW61mAJw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] generic/altp2m: address violations of MISRA C Rule 2.1
Thread-Topic: [PATCH] generic/altp2m: address violations of MISRA C Rule 2.1
Thread-Index: AQHcyEeH3FAPJgz8C0q4McY6u5ZElQ==
Date: Thu, 9 Apr 2026 17:37:26 +0000
Message-ID:
 <8b5ca213a097f7b221b06b6173e4621563779a73.1775752149.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|GV1PR03MB9870:EE_
x-ms-office365-filtering-correlation-id: 567fbb7f-21ca-42d2-d43a-08de965eaa58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|366016|376014|18002099003|38070700021|56012099003;
x-microsoft-antispam-message-info:
 CcfmYISD2JDMW5ZpHTUr3Y4nJTY14zVjHgHKuUWfeD/dNliutls8621plhuBswZAuraxrSzQ75OHimqYW/E0DifbSCY6xkD4ROHEJDTCyn7hh0P0F7Iag3ZR/WiM0Cn83/sdncTxXCoJrjIfp8SP9u+XmQ0AjdNHmHr0gu3odbhvHoGi2LYWRpOhpOl3g+kuDV2N9kg7woqsOz8Pp6TnnUcSn+iByZEPm441S/5VgkkDEve0ypOM2WIMkRrojwjZ5OFrNCx/Q0bYcaXk/0bWY1vfyUabYke28t0gwuYfcevMhbCYqMQmEMBgFsIdvVL8ARld664R2hFCjEVkmiAAXoXbop/NU/RZ0v1UF1c9iVGgKDxGZW1WvFKniTRJT7euVnUUyU3dT0kQuapx7iTWW3TOvluW//yEa6xoG08fU4Ql8pXuySS2seJIG8CaVHbUEqihqONj93ximg4aidEi5JFFuritcBUaCr6IqlY59fwqPkFsN9D77hltrbBPf6PKer+SIaErd3DmmVTPCWnP8aeou0UjjtEDq7LnmbQ5FYw3aU7FrMANGguqgNAArG4Im9/ndshKQho4sjfO80Q+4AOylhqkn2LyqmvaB7S2pZk2ScEeykBwUL7QgVFTKNXDuJtxPNk0540qSPcIjc+1fgz8qPtuvyAqgY5kBLKK1B4Y4cGsCROGAxDeX+HCsmMpZrbIvxzDXgeMEh1SUWQY2vz5HGv4FQcMNkGh77dvBzbK1Xz7pdXg0HKOYhUj5pK4bLgPNhCaLom6OtRedTiowEQnEjyCQl4nqooIixJ69lQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(366016)(376014)(18002099003)(38070700021)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GJcTlKZglnIlnxltSRKyjG+Wr1lvn2Y+EVh5D/YGUH1B5JpVZc0LsRHaMl?=
 =?iso-8859-1?Q?j9NWwYn5UnM/G1k30Lh1Pv+51snDrSGMQMZaAU1FlkFDz+YKsPhLhcJ299?=
 =?iso-8859-1?Q?XtaPJFbLO49Lizifh0bXN4x7EuaYIgj/wXTEdmpS0OGk4OGWP55trw8IcK?=
 =?iso-8859-1?Q?4bVf9PY0RrWPG0V4GN8AaC+RM3XDxOMKdFCXHhRZe/d8HMooX3Wij5x+st?=
 =?iso-8859-1?Q?DO/smyn2uN+fvWseH7IUl2DGo1+FJasr3osQHgRR/WGxc1SedDHLF0TiWv?=
 =?iso-8859-1?Q?MIcoPVlShP0+M97HsLZCs7sFhPX4VY/LFdUWHQhfMfl/C+qXmYzVU4Hx1x?=
 =?iso-8859-1?Q?0ig4/YT5AeY1qaY4RkKRMWsJUwWbUWDuIvmUT07L+uLTgTKa1nCdlIuHYc?=
 =?iso-8859-1?Q?XGES23gpfE0IEwS7lCp34yV/73/v3OGzSMqHCFT5ZOOztxZx8tXtrDPyp2?=
 =?iso-8859-1?Q?+4fchW97JcivgVU2KWFqBxbWwbT+dDrsOHUZjA5x5y51SJ36XzUKjcaVUM?=
 =?iso-8859-1?Q?P6GiC4aMSPqf0BbRbUkAnbL5xZlPA5rxe2Gvg3ZZbBqrtNIkmaKdO/j/PO?=
 =?iso-8859-1?Q?b4IoAQuDKpXHGFn9qC9yp05+jFcUFbT2BKtoMey94wExSfy7t60Wj/ekHb?=
 =?iso-8859-1?Q?LztAJEXMSML1wzJN1EnAPo5fzyxsd2WMOHxF96MKOonbkYUyAOaxceim1V?=
 =?iso-8859-1?Q?7f00Cq6cF5telJFSJvMcwSLZZ+N8YDal9Q5IkeAzKIQW4XD2xe5PdHXZzd?=
 =?iso-8859-1?Q?qZr4sqe6jwHXMKRsL9No037AVa5lOFCJ/ogjcCPWRgwr0m8dqJx6PXMACW?=
 =?iso-8859-1?Q?bboGmsZdLIBuTwB/S+MNKdNcGwlRD1vPqlZGn1Xaq1LmiTj5PxNiXxNhG2?=
 =?iso-8859-1?Q?TCG8a6W9lTJJdevpuvsWj+xXanEXCP5Mzr5I3WrWm2RpIsx2W4chvusm47?=
 =?iso-8859-1?Q?/1yooFkZj+cDQXyreY21zCIE8z+Kc16dmiuDLcNt4lNl+/y992nWmwdMIb?=
 =?iso-8859-1?Q?nMN96uKbZtciMg+IHKvYa+Ig/e07lZpWwAn5+n4E0FPSKqer2I1ny4GGc3?=
 =?iso-8859-1?Q?P+79Yy+Lnqp86bei8o70fbfpRZK/WKEHytMX/12VqzL4hK4Ct/wS6LtMnr?=
 =?iso-8859-1?Q?4yx/pyVEQ6dH9aYyEyODZiNO2SE7fewSOcjO/MA6g4dlI52MY8kszLzhhi?=
 =?iso-8859-1?Q?+2ABlGu244l0LHqW20HZ/g351U10a4qWaJlkNdr+K3smLeW3J8YS57sijC?=
 =?iso-8859-1?Q?31rvbnLt1agVs49yukt9v7tJCVSJoZVBDv79zEU3/8SKdxQCStKi0Y9AdY?=
 =?iso-8859-1?Q?y6fsKbZ5zyrQD5OAx3xvJ8SzcdkUYWGbODQTZsoxian8JRy0oiuHzeZ4it?=
 =?iso-8859-1?Q?mfOegEqkuJXFWZDH+foy0sGS6QWXydMVCXQNi7CDAa1E2YgAJr1uALfLZ1?=
 =?iso-8859-1?Q?eR/oqCGJ1TJ7jh6iEHUIXC6JE40r2+sdxmYkPZBPpbqjwaUSx620FxCzHa?=
 =?iso-8859-1?Q?OS6+EuijIyur7G8PyETVDLN/LeDR0Tx9cWshOdnmC3Ilnp2B8bACin23yg?=
 =?iso-8859-1?Q?6DjooACkxzZ/HMGUUVHCd1y1bW/+CFnajkOEJe4nNZ4ZCSN8WiJl2MTe9h?=
 =?iso-8859-1?Q?KvbFx5Gj7lu69QL6iHCtUSS6tilHrfcmyFIK0u5CWOikgfZWJCM8+hSiHA?=
 =?iso-8859-1?Q?Sdt5VK9v57ClGbHpsufde2kCCEsZ7Dld2SLg0mG3Y7jdcUcDBx/ZFwqGYs?=
 =?iso-8859-1?Q?913ypqISuohV7hUazuGyr3rGQwgJQnH/I5JRFhqKv8VTUnQG6NVXflbR3X?=
 =?iso-8859-1?Q?IY0MptLL9t6/W8tT/mBJlegoHLFULns=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567fbb7f-21ca-42d2-d43a-08de965eaa58
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 17:37:26.1830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TZewXxeanjGyaPwdGeDAcR5rQPincpu661NkQO0a6e+qVJ8ykl5AZ+WYSBF4hdh+cX8db0MnlTDo2ss96xj2DLLXJzZLBV2a+JB7kSsakfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB9870
X-purgate-ID: tlsNG-ef75cf/1775756249-1394141E-B454E631/0/0
X-purgate-type: clean
X-purgate-size: 1520
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2D17A3CE37F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MISRA C Rule 2.1 states: "A project shall not contain unreachable code".

In certain build configurations, the function 'altp2m_vcpu_idx()' is define=
d
as an inline function that contains the 'BUG()' macro. This resulted in a
violation because the 'BUG()' macro makes the function non-returning.

To ensure compliance with MISRA C Rule 2.1, this patch removes the inline
function implementation and its BUG()-based unreachable code. It is replace=
d
with an unconditional function declaration for 'altp2m_vcpu_idx()'. It reli=
es
on the compiler's Dead Code Elimination (DCE) to remove the unused function
in builds where it is not needed.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2441424553
---
 xen/include/asm-generic/altp2m.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/include/asm-generic/altp2m.h b/xen/include/asm-generic/alt=
p2m.h
index 39865a842a..df6b9a9c01 100644
--- a/xen/include/asm-generic/altp2m.h
+++ b/xen/include/asm-generic/altp2m.h
@@ -15,12 +15,7 @@ static inline bool altp2m_active(const struct domain *d)
 }
=20
 /* Alternate p2m VCPU */
-static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
-{
-    /* Not implemented on GENERIC, should not be reached. */
-    BUG();
-    return 0;
-}
+uint16_t altp2m_vcpu_idx(const struct vcpu *v);
=20
 #endif /* __ASM_GENERIC_ALTP2M_H */
=20
--=20
2.43.0

