Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJfDLVfV1GnuxwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 11:58:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA1B3AC685
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 11:58:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274617.1560708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3Ch-00046j-HP; Tue, 07 Apr 2026 09:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274617.1560708; Tue, 07 Apr 2026 09:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3Ch-00044E-Ct; Tue, 07 Apr 2026 09:58:39 +0000
Received: by outflank-mailman (input) for mailman id 1274617;
 Tue, 07 Apr 2026 09:58:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wA3Cg-00043W-HU
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 09:58:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3Cf-001tW6-TE
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 11:58:37 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d4d542-bab6-0a2a0a5309dd-0a2a450b9d14-38
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 11:58:37 +0200
Received: from [52.101.66.82]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d4d54d-bca8-0a2a450b0019-34654252e045-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 11:58:37 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB8294.eurprd03.prod.outlook.com
 (2603:10a6:102:273::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 09:58:35 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 09:58:35 +0000
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
 b=u9wFUJ23GOx0MtbgJ8hY5zZ5mch4YD2hhaxnxdRkKHti1SOZHmzq/SPCKIRnKou5fn+/nfSrtVJx52Io4K6M4MvRgtKsdhR3ZcQAd66LcxQPvjIaGvqOfKS1N36UpYB3nwvNzWF6Y7dIjrf8avwYmDOJiLWbzShXTKLFSpFsbJy48zS4zme1KohqOoj0/XReWk1T5lpbpGafywghxJg/QcybUR2OZ6OohuiGxG86XVhetXob1yX2dsvHPAh1lbGrwAm/z1FbqCAp8Eja2V8XSx4n0COUupuljwUPdLtg6LK5GWh7KhzrsIzgIcLpP4lPuApOU6ILmrY6dV4joRJufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DM5ctd74HSf9n6McPIthpWnwvO71M4XGIm8bZHpDQj0=;
 b=Bf0U0tlL0JLRZfk7m8XKZkq89WpW3wno+jKf/m4Pa3rjAZ3eahFMoIWLKQMGxfmMWKxgN6vh5SKNW9GiypjKktX3RGjrjmJx4G2BdKIrq7S13gq0t9LsXttba4aN9wEhq47sAxg18hhOE5I2Nf59iNS7/rtJD2keiVzqNGDeerJyxO6MQizRkEKiSJxaDxQZf+xCNskjY7Js+BltauNFGHhREBKBqXSQa8xxYaKebgj/6mJuQM/4XeRloBX2rlboCVdYX1brlRuWpSQzYzu0O8gpxRiVPJ0h2wpVtyv6Loh4ENtLb8851qBnedd3+x5R0tt1wnB4GMt/a+v4aBPciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DM5ctd74HSf9n6McPIthpWnwvO71M4XGIm8bZHpDQj0=;
 b=oIRCEEgXpYvr0vOBRYIIhDsd3t/m5CMZPKyG0l3R7ILTLdt0sOli71y3l9GfphHaeQ3Bh9bFAX7rbohKoIb/JHH+nMy9saNlGBMVIzh/5SAyos1pUcKp0SsrjdtmGsIut7nJsSBsKIN38LS5oJ+sy6nc9D9ePx3uThUhcgi/pZ+1JN3OpothNJqTa3kAPPnewnWANDhzmn42sra7Kfa8RxZwsdmmYgL72qqulfFogSQ4VgR6cPgLzZL+a6ULcslnUpZ0ImyFtqxt/2gemuJd1/m8uDqxHRez26z8oFDuM5SPHlLyZNS8Lg2YfcAlE9deRABd7OMHfG3hH/L+8S6EeQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1] xen/arm: smmuv3: Add support for removing devices
Thread-Topic: [PATCH v1] xen/arm: smmuv3: Add support for removing devices
Thread-Index: AQHcxnUZYHa+CmL3S0yWL3bconIhZw==
Date: Tue, 7 Apr 2026 09:58:34 +0000
Message-ID:
 <a59c2da0d4c72deb42950e9a8e3982fbdee60668.1775555766.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB8294:EE_
x-ms-office365-filtering-correlation-id: 55a5a121-8d89-4dc3-5dc3-08de948c3b97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 RdoUFYMNg057i7PFlk175tjAyVEyYWO3+21tggZNwouTrWcW74NA3SkjljkzJZL1N6N9/iAjVNvO12sIB9fzfO2/9j54+bS4+99mblPccnRaz4ksaUlSteFZKClsIXP9/sXTEA80aBSMicQ6E7SFrSg2g91m0VML++myBueVfmFYHkl3yu9vV6Np4Frhmx3d1EeDgV4cX4tRlGruk26SOiosCSYWv8J/TLI5emKTvO2LUJ0Y+tWV0NBIzDewfZRGpt8vusx0oQaZ2AriV1Rq1/Z5cxO9X4Wa+r1K0bFjbCCKxniPri4I2ZmxU+lX9oMuTu1m+Qp1o9Rg24pwkdmA8//+YdaHndgZugFgLOHAsIUtlronixCocIkoH7CXmPBs1PkIvISI36Na0lKkeav60i7u7+usd8+dub9E13qI+qO3bnWkcgMzRc2g/8rUYc/ytRXhPiRyGU/E3UGIHGHHOH3oM+eqedPt2g0pYnb6vEdiMrYI0mfNDZD5vgyDV1BJnmjElL1Gbru25rZJw1YjzWNWiq5L6QVEsdBHcwd5H7ehxi7/yLxPRfj3Qt1lJgSrcWZgOywPksYiq9kGQ8rEnfBMv88H7Ii7fN8T6bNJ/sIlRNiY9osf8VNUIlQdJSYyFrhDBv3pYgAJF7Qvf4PzWrZIMt407Gx9LCUBGkSna44wDKFiDknXOag1UYZlrtydYxlfZu3UFpUFXYnRnvgxgryQ+zdrTWDvQBkDYONya6HvIYyo5k++tOkw9cXynXdo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cO9Jox+5hfuJzsZWHWuSyyl9kqFLHDP+OikNDSFtvTd5/IhHGhlmLcL6Fl?=
 =?iso-8859-1?Q?bTUez5HCZMzcShPAb4+ZVIu24W9VwX4Z78D9EvggvHPEglLmGGOta4kA+W?=
 =?iso-8859-1?Q?rxVmGWKP+7B5SBXeVZYKMscZkHrYc8HDqAejhBPJlHUqOiDtpDeJwnhncv?=
 =?iso-8859-1?Q?GeHMtjsdfN4GK2tiVeuaIu2B+uJxvXCejSR+z59LnD880HFpr8FZhU1J5H?=
 =?iso-8859-1?Q?XptXkNW4MBSMKRq5QVx+URmSyOsizqsanYIBPMV5m9amf0fiR1a0jcMbJh?=
 =?iso-8859-1?Q?a2GeKmvhhPWVVELZqHCxEhn1/tnjGIscaCY7UFifOlaJFDT1gXl+OTBNbv?=
 =?iso-8859-1?Q?XO5X3ui6sgAs4+2Z0HE2xKGV3QkbhnlrGEP+gJAfEU+4tVMnXDfyj3HTbf?=
 =?iso-8859-1?Q?hTah2268GYcOTvDp3eginadTtPNRiJ/7RgW+g3q6L6tSalALoQZJ79nviu?=
 =?iso-8859-1?Q?DlKZfz+CI6TP44DReO86UJI+NNxnQrBOgojyyJgd9ei4QvfmxNleKq+2MP?=
 =?iso-8859-1?Q?KSIoHIkIHG7d/QQ8yZbZ5fquHEi/yJpSgw5lf+Fyz9PM/YGEoz+mDX7VMh?=
 =?iso-8859-1?Q?lcgP1MWHSPIL+MrE7H0ZSlVqys3CC0sOGeCeCaR9U5AUCybQwGaBvppVaY?=
 =?iso-8859-1?Q?C4lpDWWqanS8uiarKM8whe0p56UmoRxFK0ggZCCjMtChlyqU4DnZYHF0ic?=
 =?iso-8859-1?Q?fUQer/hNc+rx/AMlROj+hbMTbuUkDyEmhWw9O8Lge9TjPreSPeKk2pIj9z?=
 =?iso-8859-1?Q?kj8R05pA1DXyRDa7FZV3papVDprdak0gZeUd3ye48J4AHtaMx4calKaPiD?=
 =?iso-8859-1?Q?RCtXPCz/AC2oLBRR0z7UFgh2Rizthi8L5Nqkd52ps4gUBlMfoa6cDDODvv?=
 =?iso-8859-1?Q?t+aj8FW+oiMrcGgYTJqm4uVn6X3Zfv9ci7aJyT9iI/yliFF5YzzOw0sd4Q?=
 =?iso-8859-1?Q?6tz8aPD4RhfL7UdNqoV2BS6AbKLSiaeBGPp5SItgo3okjQ9LmAUNJsXvAG?=
 =?iso-8859-1?Q?eLsQtOKPQm11cME1U7aNJEQpnicSNJWaEeDpK2e2KA8WoMNY8P9hNvcK+a?=
 =?iso-8859-1?Q?I0n1QxJ96N1i8ouzcCCgYeH8qd9rRBdbzs44/EqDFj9aq6lZukQc3PahTK?=
 =?iso-8859-1?Q?pbMXPa2Rc15gGa1PTs1nOz3p1fLOhbiOXFwhTLg/b+2VA4+3e1XIRIHuCC?=
 =?iso-8859-1?Q?ik6wJQLruig7hoQU8psm2aN0Q08BV3buC2Hvs8PtqF4vmUmVwmHpud+GW9?=
 =?iso-8859-1?Q?H7lIjR8bYvFH1n5tvM7J6LW0IkWK4di1Jy7jKyWPnbZuAPiJ1z7k6FxgC9?=
 =?iso-8859-1?Q?J5K6nu3e2DAwZBc0cw7IUqpkz3f0CT0Iiv+/EAISj1FXDWO1Rwwuz6XPnv?=
 =?iso-8859-1?Q?Xm+i6lOpYVhltEZEmk/yd9fPWCvZKyU0oJ6WHXDVqs7GH5GZ0oMQmPJFqP?=
 =?iso-8859-1?Q?DNyQdvBRJ63RqLZv5SJMI240XYsaEI47tBwRbH8ulW/q95zWrFHI4z316J?=
 =?iso-8859-1?Q?txUoz63fsJ2FiYcsWI2xBXKkzwLVRS8Ex02068nVlDLlz4zuJAD8moZOqy?=
 =?iso-8859-1?Q?Fba+dKrMR6GDRhP7GaA6VJm33RE/pDF/wCceaSZB9Qsn5vmx7rlBMj4+a4?=
 =?iso-8859-1?Q?wI4irlcf0T+BXJWTDAHJE5Sf+w3JeJZwtkA6w59K0JJRo6IgQcjeiX7kav?=
 =?iso-8859-1?Q?RAUNLVMV5pTp3SDLAlyk+uYubmpaXDSexApdLEgHri9RsO56/uPyf3aIvw?=
 =?iso-8859-1?Q?r8n5/TjEDZntdSfvvup8XhC7rJ8JUZ+IKHNB8YTuTP426B7fBi6/IUuaSy?=
 =?iso-8859-1?Q?VoxhkUqoosF1WmFuijP6p64kLfqkdBM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a5a121-8d89-4dc3-5dc3-08de948c3b97
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 09:58:34.8990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +mcOphYUUJ9SPMeZ2aIjglOzRUXo3USqQaOBmAVZQPGXO/eEM8fCIMDX9TAfYIKU71FJyxiggvGvebgS7J9RSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8294
X-purgate-ID: tlsNG-42698a/1775555917-EF5432A1-602F276A/0/0
X-purgate-type: clean
X-purgate-size: 3372
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,patchew.org:url];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3EA1B3AC685
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow for removing devices from SMMUv3. arm_smmu_deassign_dev handles
most of the work by disabling ATS and zeroing STEs. Additionally, unset
the dt_device_is_protected flag and free no longer needed smmu_master.

Tested on QEMU with SRIOV series[1] by repeatedly enabling/disabling
VFs.

[1]: https://patchew.org/Xen/cover.1772806036.git.mykyta._5Fpoturai@epam.co=
m/

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 59 +++++++++++++++++++++++++++
 xen/include/xen/device_tree.h         |  5 +++
 2 files changed, 64 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index bf153227db..b5b834a7b7 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1493,6 +1493,64 @@ static int arm_smmu_assign_dev(struct domain *d, u8 =
devfn, struct device *dev,
 static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
 				 struct device *dev);
=20
+static int arm_smmu_remove_device(u8 devfn, struct device *dev)
+{
+	int ret =3D 0;
+	struct arm_smmu_master *master;
+	struct iommu_fwspec *fwspec;
+
+	fwspec =3D dev_iommu_fwspec_get(dev);
+	if ( !fwspec )
+		return -ENODEV;
+
+	master =3D dev_iommu_priv_get(dev);
+	if ( !master )
+		return -ENODEV;
+
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev =3D dev_to_pci(dev);
+
+		if ( pdev->domain )
+		{
+			ret =3D arm_smmu_deassign_dev(pdev->domain, devfn, dev);
+			if ( ret )
+				printk(XENLOG_WARNING "Failed to deassign device %pp from SMMU\n",
+					&pdev->sbdf);
+		}
+	}
+#endif
+
+	if ( !dev_is_pci(dev) )
+	{
+		if ( !dt_device_is_protected(dev_to_dt(dev)) )
+		{
+			dev_err(dev, "Not added to SMMUv3\n");
+			ret =3D -ENODEV;
+			goto out_free;
+		}
+
+		if ( master->domain && master->domain->d )
+		{
+			ret =3D arm_smmu_deassign_dev(master->domain->d, 0, dev);
+			if ( ret )
+				dev_warn(dev, "Failed to deassign device from SMMU\n");
+		}
+		dt_device_unset_protected(dev_to_dt(dev));
+	}
+
+	arm_smmu_disable_pasid(master);
+
+	dev_info(dev, "Removed master device (SMMUv3 %s StreamIds %u)\n",
+		 dev_name(fwspec->iommu_dev), fwspec->num_ids);
+
+out_free:
+	xfree(master);
+	dev_iommu_priv_set(dev, NULL);
+	return ret;
+}
+
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
 	int i, ret;
@@ -2867,6 +2925,7 @@ static const struct iommu_ops arm_smmu_iommu_ops =3D =
{
 	.unmap_page		=3D arm_iommu_unmap_page,
 	.dt_xlate		=3D arm_smmu_dt_xlate,
 	.add_device		=3D arm_smmu_add_device,
+	.remove_device		=3D arm_smmu_remove_device,
 };
=20
 static __init int arm_smmu_dt_init(struct dt_device_node *dev,
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 06d7643622..1f9608cdcd 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -305,6 +305,11 @@ static inline void dt_device_set_protected(struct dt_d=
evice_node *device)
     device->is_protected =3D true;
 }
=20
+static inline void dt_device_unset_protected(struct dt_device_node *device=
)
+{
+    device->is_protected =3D false;
+}
+
 static inline bool dt_device_is_protected(const struct dt_device_node *dev=
ice)
 {
     return device->is_protected;
--=20
2.51.2

