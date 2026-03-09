Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOd4GT2qrmntHQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD490237957
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249275.1546755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTR-0003wg-7n; Mon, 09 Mar 2026 11:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249275.1546755; Mon, 09 Mar 2026 11:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTR-0003vb-3h; Mon, 09 Mar 2026 11:08:33 +0000
Received: by outflank-mailman (input) for mailman id 1249275;
 Mon, 09 Mar 2026 11:08:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAaF=BJ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vzYTP-0003iR-PJ
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 11:08:31 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e289918-1ba8-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 12:08:30 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAVPR03MB9775.eurprd03.prod.outlook.com
 (2603:10a6:102:312::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 11:08:26 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 11:08:26 +0000
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
X-Inumbo-ID: 4e289918-1ba8-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNbYhsNNWLbxrbWO51Gle1Q32feoW3QMwvwGSzY4ZE3h9tzq/4VQ/hQ6P0CAaeo7FNUCMZxe90yHkdUEJ8BmFqvE7TU6ykvjZHk/oq/xCt4p+xt+5ujVUprBLsZjKPWLaKoPVgg1a3G9tWAnWCWwr78QXjDxzrWZQP7sHzQDG9bhsQ880QDjib5h7iH+9nFm+fawj3Vp2maj++bVwroZoa338/aXWqkvBOaBHlaHR2H5Nya2Vg9NIzIT1DD2tItmvtYwvG+kubHtYcs9FlFH0HZnDEm7m8vh6X9mMG2jtlodGDUBvsHe9I9mY+/Ax4+xoOcBU+x08xnPsrnU/vBASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKjBrBlYi81AwmoCTlVxMi0XuRHMmtnX6O2MuhzGwS8=;
 b=CtrNWDAgLUeFETsHbrhOK+MpnXKGofqk55o0mP0E7FSglvzz1pGwT3sgdDBc7m993EF188CpbPU9QCodFl50aq+AC0GMoTnDlIWxPhzIRzhWCa2siMdeMy1Tg2dlZqNxnnwgWgJEVFvlpYLGaEUgQKx9hTvkERHur0ki0EkLXZOs14MUNRQNKseOMiDlHzoeNzPBgor4qOXoCvQEFX2td2jT+D6/MHYKx7ArRboiDpyrlA/stGuUrf5EsQG7keqfyxOuof5UdnYuWz3TzsmKpoxXgN5LnjS6C6CuYeEUR5jGR8/FbsO4Ph4mbrNMf+qMNNeg6ff5Q25eTBqKT84C4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKjBrBlYi81AwmoCTlVxMi0XuRHMmtnX6O2MuhzGwS8=;
 b=PTQEALWTxsHQoSAEnSmETyyHSgbGoD2+WgLhN6eApJn8vaIihQbvFeGj6ybODIGd01UrSVMFGN9sDsSW+ffq8JqDP84uYq3Z6zv4fEa9wc44KkRgcAtc18k587U/y0L7UclriuLM9BNOkbSHcH1CPSKunezzAlOXyPmCNbZk6GTaAB6bco56o6PQGK6PUuGKaMa/G5iKH72A4RCtjHEl1TAwUZTxNRoRw1el9cVGlfZwSfNXmukJfvI6v3GKCh+TxXeE6p7Wsm1CazHuMGRXPumDmlU0QDCebCyudufJC8koPBdTaKFx/2VPwmCid9CxCTwf7nMc02U6lMiRYe5kgw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 1/8] vpci: rename and export vpci_modify_bars
Thread-Topic: [PATCH v2 1/8] vpci: rename and export vpci_modify_bars
Thread-Index: AQHcr7UN7Q/q9Zlc+0i/1HMfYtl+WQ==
Date: Mon, 9 Mar 2026 11:08:25 +0000
Message-ID:
 <f4d48063a4091cf851eab7ad9bf53364df8d1568.1772806036.git.mykyta_poturai@epam.com>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1772806036.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAVPR03MB9775:EE_
x-ms-office365-filtering-correlation-id: 59e1b0c8-4252-4867-d6f1-08de7dcc3007
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 O7Ti40F72MuPHn/AiK/Uqkd3Z4k2+q1D2Qr6ZtRkmezp/ADgjLgmWoLiiTkSeRmV5hZfilh2lc3Tu9zDsG6w+sQgDGzMSUQTUVkH4F+DHhXCtolo/R53R1UA4ttqzSG2koUzrx2H+41YXU9kpNOs9cmV5nrKXo5zTQY6wcOb5gysccuwnjR7DL4wRMVgBWT6V/2VHxZIcLlSzuWu6sqKQdTyAhTHK3x9B/AqhGErHHHCRKo3RMLYzpIYh7yt86bmwvOGmbprJPJz0vieiwwS+R7vxKfiLuId9TvgQijk0z/I+GorL30YK8lOPn6kaXXLItMfciBSHYwHK3XFxxY/WkiKG09KHj1p0wZMTeMSHKh5WLTTe4caqR8DQJh6HJOpVhzc5u9vyue67UW+aAmDTGnEAdP4KMS7OQN/YmH3LSaycUeQZg8ESdDiymsE9mIKsfK1XfAWBWJdD+L5T0uUGFLFTvcI1sf2hA4NrX4MIi3i5S4N6L2gDcWbOdL3XPetuHI4MBL1dESOEX9S24t+aTpgsSXi/1FlgwFmDEzKHWb3R1x3QdBpd9GtWqU/+2U1IUDmnsf0vh5zpEn03HdENqc6FVS10Mp172Eg1S0zV+Q5f2PC4OFVaupwiTb0SspPkI34ZXMlyu65m/oXptbBLQ6DzhxH2aAXM4R/V+1NdH4Li2PEWdjSA94JGc8Mehrj55bWrUzhUxUnfXSv204QoIUKUyWMJX4uk7AeB4Oh6dLKwKlzwqIPVuBRI+ZxkuUYNTRPlyp8w3ar8l4f5HpJE8w1fBPPGGM1jV3ihxf6FMI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?T10TfFxg+Q6Beh2pyBHMUu0F7TExdPD3nIAZ/L7Dundx4p71bZ6VQqJqPg?=
 =?iso-8859-1?Q?eZ33+iO4wH05/d2SQP5aW0U9D4arpYgrPj7AjYcqtNMXSL6gibqkgB6PwM?=
 =?iso-8859-1?Q?/VFXuA+UKxoifPozxKl9CF29wB0vBznYueAhUar03v5m/OXO7Um7OcwHFx?=
 =?iso-8859-1?Q?XkCR8m5/xSfiOuFRYzRP0nAHM+1cButtZvyBtK+ATCjY2qEH4VXhZTcWOm?=
 =?iso-8859-1?Q?5rkt5sfrOM3L0WG6tSBw+9frEkIQFZMQ4aeaPAdkJYAZNMiJ83MFW0lgh3?=
 =?iso-8859-1?Q?BRrf6qooSsSG3JJ9tY/Vxh2kaxJz6DiS1npGkZOtl4Mab1K+bcKbmfZYbN?=
 =?iso-8859-1?Q?2dfKulaDEW0xsqCeN7I/cOFQcJGsuOZOELc7QCI6bI4WBWyKUaKnh6DEv8?=
 =?iso-8859-1?Q?3UBs77T4UtCe+G4JzUmE2T7XE07kUThv1oaWm8SrEfVDojMKcCoo7S3uUf?=
 =?iso-8859-1?Q?zXYSU0klr3eqFlssheVKvpnREYGUlWLrUQuNxOSybMiuLn3Y5KdV4nK+3f?=
 =?iso-8859-1?Q?Dfg1PYI4wcf5kOu2AY1mL44e8/6MyAfw83/RvjzhVRyCYOOb1KgIhMGhEX?=
 =?iso-8859-1?Q?Q+Mcvs8W1u2d5mx3YxtItdhJIGnjoPqvGzlVeAKHIaAb5UQcc4qBm8aY3K?=
 =?iso-8859-1?Q?4UXFZaFKToJO6Rq/TIbU9EYHWQifUgBrmA3Y9Kz8zqnIYfHGg9SJIZlbOh?=
 =?iso-8859-1?Q?iHMLEXkCjeBXi78/g91NgjSVICSfMw3okQUOwFVv21vs5834kKuJUpzlWd?=
 =?iso-8859-1?Q?nfM5DaGXoXf55mMkBaPA3nao1Vxb85Ye/PAJe891VTfpXuqB8mZcZc8dgw?=
 =?iso-8859-1?Q?vfqx8t9mBIp/fV70/SeRMichumv7P3nlNPrKgJmgWf6GXIAXB5WA7Gc8C4?=
 =?iso-8859-1?Q?nOLMUaoULiTSr8os9s1iLS2gWY2/CJ2iK/Ti+Miq4B01/AlcPsY5SxcTsg?=
 =?iso-8859-1?Q?+nfggLf+UlVvJdi/oS5A8l7ygHCjMkJivNLPIGpPDLbh9Ydym3xFOOc4HQ?=
 =?iso-8859-1?Q?qW5kV+zF7LoKbuJ6DvEZTSpoQNJz7Gk8ypE0lk0oxMvabURYpK0jKo3KLz?=
 =?iso-8859-1?Q?JKhieJgFBbRPpL6UD04B/NK2YDNBYlxeheAq7SWvEdhxSyBIzCkyjkzP3U?=
 =?iso-8859-1?Q?+NI2CjVwMgpwY0eXF/8QshL6kA9FcIj5xh13nsiLHZz6+0EIYrlehaXjw9?=
 =?iso-8859-1?Q?BjQh6KTxFTRxfQuNA6dqLh6S9pYmpfnCdL8IERKEJYZ/2CuUeAi2CW3Bz5?=
 =?iso-8859-1?Q?sCywEehndIuTSmQ3oaYE3DQoEH0LLyAmJIVJoSfklt0UeRcLkLyJIc/uZ2?=
 =?iso-8859-1?Q?t+0x85Ll4GHPO+KXrCRLMXpbEy0MyICbO02B8wo/BPebqnsrjT9+SUQ7ck?=
 =?iso-8859-1?Q?oGbPlPgYAZUgmgZvfGP872fn8tu3sP3EZKRslAZ2qsiQvvjgNBHTrG6tfZ?=
 =?iso-8859-1?Q?x5Z81CAB82oluGkaicsUn9QIQs1brVk0d0bWBwF5PCzsrl6r+dsGBQTH0K?=
 =?iso-8859-1?Q?0AWbFb4CCkktJG0wbbkMGIKQXGIq0iE3E4rYhhL5rZzM+Z5TQ5HabD+U9Q?=
 =?iso-8859-1?Q?3FMgTQZ75+hBo1hfcixrJDcfnjHghIq/hkkRnHUdKltpg8tq9/gsiuVrSb?=
 =?iso-8859-1?Q?3zCj9hg7WeXUE3JEu4S8OeCAf61VW2Zng+8dXxhMjRW4yEpR24w4PpEVqz?=
 =?iso-8859-1?Q?3bxmLrYvMXrrsQCWVjVR7wbCwM/fYfW6dzqcabCh2aIHlHtrWZHeJH3Nmn?=
 =?iso-8859-1?Q?x+W9eL/wjIkE+1UwsqMaDcbA81EsLP5VIhUi/RQ1MiXOpjwZh5vmznSP7a?=
 =?iso-8859-1?Q?56RvvFOjWnpA5FVxX9uU0qSmxyDHhhg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e1b0c8-4252-4867-d6f1-08de7dcc3007
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 11:08:25.6964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BlPLie3bHHeOvHSRF4kOKH2ewat4OjMOV360X4SbCOCZfotcK/B+OAkQAAp0oykHdizm0DietFKYV2+dQ6IJPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9775
X-Rspamd-Queue-Id: CD490237957
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:Mykyta_Poturai@epam.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Export functions required for SR-IOV support.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

---
v1->v2
* Collect RBs
---
 xen/drivers/vpci/header.c | 16 +++++++++-------
 xen/include/xen/vpci.h    |  3 +++
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 739a5f610e..5202518e83 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -304,7 +304,7 @@ static void defer_map(const struct pci_dev *pdev, uint1=
6_t cmd, bool rom_only)
     raise_softirq(SCHEDULE_SOFTIRQ);
 }
=20
-static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_=
only)
+int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_on=
ly)
 {
     struct vpci_header *header =3D &pdev->vpci->header;
     struct pci_dev *tmp;
@@ -545,7 +545,7 @@ static void cf_check cmd_write(
          * memory decoding bit has not been changed, so leave everything a=
s-is,
          * hoping the guest will realize and try again.
          */
-        modify_bars(pdev, cmd, false);
+        vpci_modify_bars(pdev, cmd, false);
     else
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
@@ -713,13 +713,15 @@ static void cf_check rom_write(
      * Pass PCI_COMMAND_MEMORY or 0 to signal a map/unmap request, note th=
at
      * this fabricated command is never going to be written to the registe=
r.
      */
-    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true=
) )
+    else if ( vpci_modify_bars(pdev,
+                               new_enabled ? PCI_COMMAND_MEMORY : 0,
+                               true) )
         /*
          * No memory has been added or removed from the p2m (because the a=
ctual
          * p2m changes are deferred in defer_map) and the ROM enable bit h=
as
          * not been changed, so leave everything as-is, hoping the guest w=
ill
          * realize and try again. It's important to not update rom->addr i=
n the
-         * unmap case if modify_bars has failed, or future attempts would
+         * unmap case if vpci_modify_bars has failed, or future attempts w=
ould
          * attempt to unmap the wrong address.
          */
         return;
@@ -933,8 +935,8 @@ int vpci_init_header(struct pci_dev *pdev)
     /*
      * For DomUs, clear PCI_COMMAND_{MASTER,MEMORY,IO} and other
      * DomU-controllable bits in PCI_COMMAND. Devices assigned to DomUs wi=
ll
-     * start with memory decoding disabled, and modify_bars() will not be =
called
-     * at the end of this function.
+     * start with memory decoding disabled, and vpci_modify_bars() will no=
t be
+     * called at the end of this function.
      */
     if ( !is_hwdom )
         cmd &=3D ~(PCI_COMMAND_VGA_PALETTE | PCI_COMMAND_INVALIDATE |
@@ -1059,7 +1061,7 @@ int vpci_init_header(struct pci_dev *pdev)
             goto fail;
     }
=20
-    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
+    return (cmd & PCI_COMMAND_MEMORY) ? vpci_modify_bars(pdev, cmd, false)=
 : 0;
=20
  fail:
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index d6310104ea..a98ddbb32e 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -295,6 +295,9 @@ bool vpci_ecam_write(pci_sbdf_t sbdf, unsigned int reg,=
 unsigned int len,
 bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
                     unsigned long *data);
=20
+/* Map/unmap the BARs of a vPCI device. */
+int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_on=
ly);
+
 #endif /* __XEN__ */
=20
 #else /* !CONFIG_HAS_VPCI */
--=20
2.51.2

