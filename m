Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910F26BA107
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 21:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509833.786425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcBhN-0002DP-7C; Tue, 14 Mar 2023 20:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509833.786425; Tue, 14 Mar 2023 20:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcBhN-00029k-3h; Tue, 14 Mar 2023 20:56:45 +0000
Received: by outflank-mailman (input) for mailman id 509833;
 Tue, 14 Mar 2023 20:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ugWp=7G=epam.com=prvs=7437a4d9da=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pcBhL-0001PN-1j
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 20:56:43 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b66c9f33-c2aa-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 21:56:38 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EKchDq017378; Tue, 14 Mar 2023 20:56:36 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3pb0520156-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 20:56:36 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PAXPR03MB7967.eurprd03.prod.outlook.com (2603:10a6:102:21a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 20:56:32 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 20:56:32 +0000
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
X-Inumbo-ID: b66c9f33-c2aa-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXcNR+EGVCiTxLHxLV3tWW7NBXi9iMnOsCAGFKzSDxvXZ2gHg2XlA/HvF0xVYiX3fAm8fmsysSLPIdVdBUtnSD1tMV4ZY7EhMRFLxmc7MEWIsdfpcWuTYymOw3fSSohcL/dnz8I1CiWXht/Eqxvb8r3zQ9w+mPNrwWhdcFdawUnsHZvtJzaMs6WJGOB1G8+PCc0bRrLVCqLJG29P6Wc4Rtpqvv5N/bUQhB0p+g2q9EhKYu5RgBYTit/rBXFEEx4aL1iiBFvPl3wkZwRusHUgjTA4PmtxaKHhrWkvpUSao/PFQUIzOwBic4FtkSlZEBuSGkvkXJj1orSiUhkwMvuQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaQsE3qqfsC6jF/uvxz8iK+gfBz0ZgRCtEGe75+aN/A=;
 b=XNLgugBkLKiBe/rSZil8+ySzIuZRqGQ2OqKj+SV/XXbrNK9j3YG2MZ9XHkTsYu7ZUda++RObufDo0xraBDbrodJMnBPVJq60AG84+FabmSGz1emz4CGJQBE5Q91be70Gqgw0t228vMcBKdIl/gXCU7FWkBRFAjY6lwqlcU9HgiOEp4PeRQbxxPsvrQQk2AVOvCirDFXHOHxbu8V4a+rWzbKkxH9AlMf+YcxZnaL1bcCtm4NNcATI08bMB/c3y2U071zfRYSjf6mP0QFWLdJQIVijtQWOL/VL6gXZncytG5y3gTLap8m9E6Gs0Ri61rWVw6JNW48tfKkS927WP2zgLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaQsE3qqfsC6jF/uvxz8iK+gfBz0ZgRCtEGe75+aN/A=;
 b=RKM2GuUBR4KaCTmx0VkWpau4f3IicAaCnasPW8dctsFXNrtMlOBWECb78UhLxWUbRmG2oMEOiTGDy7V5rUqfT5KHuKuFC3WaB6lnY9/deQJwZUaDDZiovJK1dnp4MNUTqtGWEfQM6ZmzpMWUPuF1nVK78bHkH+FtPUKspHAj2xP8BeLy22MWKSqAMnt19J7NXmTJU6IA1Uv1L2xJh3vbaLWY+RbJnoXVPF6fCURJsKPzbDR6z0bbjv25N8VBUuDYEtP3RmHURBLDUByDx6BEdcLu+YwiFVBLMZz1TEhUrThEsqorz3S2caNYWzVJPhb7pw3FNkz6e96OCIAB/LnaXw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v3 6/6] xen: pci: print reference counter when dumping
 pci_devs
Thread-Topic: [PATCH v3 6/6] xen: pci: print reference counter when dumping
 pci_devs
Thread-Index: AQHZVrdzYEuAtB/tbEeKWg2MuafMXg==
Date: Tue, 14 Mar 2023 20:56:30 +0000
Message-ID: <20230314205612.3703668-7-volodymyr_babchuk@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.39.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PAXPR03MB7967:EE_
x-ms-office365-filtering-correlation-id: bdf92573-0bb1-4c9e-09cd-08db24ce9742
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 H1FlXHmivC1+lPC5K/TiE4jnUSlMzpsQQAPnjF3Q2qZO944+yUQObHIFwh4mY69e8NBl9YU1V2BiqSp+1oC9TTx1KfsTIk0UmilzhK4TmmUFq39NsgeUPe366bUlWYH240QCvfIQGML8QGz10PFrGN0mPQw4HnVq7ozns7wSRuOba8Va21om9L9fhgcaC7FMa5NSjotCQ2FB4i2v5dGEGeDGfhcIXJXwrXN08huAJtUx7aW087wcS61soithNfBNcOpp7KtwBC6V6asSe0nfF3+kkFFX/FCQ8VrGlirO5xBAbZBXKvH4AiDVon5FgCrmI6AzJwnPx2HPa96BZMVevBV6oawTCKMZse8C5BB2tTEEL2d/88vqTUXdqv+T9qYcFgA5MoisrUTuM9NDBvvumRTPpSiFMe6RwlObIppgxa9h1Lo58RZtPSDr+5LIMPtUkf14q7+OiSehm/ShhpWpm3lRqTnGMubm5nN9yRTEfmJloyWJaA6zr0O861CaoBP6RKMoPysl8y3IQd/b5nJnXe9xj+b1ZYWVrtJ/b7uflO3s+lRcf6XCZ0KHVqP0jB+Hz5/fB9TtZeGbFyVbS7Ucxm3IRZBBXHJ+e2PQpyvE2lXY9MgA5wWHGvcZ1q0FFyHmi+1NGim1CjdxqNb7qIf0Ux5nO2ySiU6nV0gck0cIAEib/coRhOB11ZkRKeHemPuicblAdI9f+4IA9WbNYqWLlw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199018)(54906003)(316002)(86362001)(36756003)(38070700005)(38100700002)(478600001)(122000001)(55236004)(83380400001)(6512007)(6506007)(2616005)(1076003)(186003)(26005)(5660300002)(6486002)(91956017)(41300700001)(6916009)(71200400001)(76116006)(64756008)(8936002)(8676002)(2906002)(66556008)(66476007)(66946007)(4744005)(66446008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?F7QZ+3S9n0ddrUPmQ8dlpS+6uBtXXhNtixliviL1WoZyJXQDTe6C6avVsP?=
 =?iso-8859-1?Q?ubOcKWPG0+9lDAQRWFIScJXtP2Roa1hiFUPjNy8gsyYRAFOW7No9jiRi7l?=
 =?iso-8859-1?Q?iuZLG2pnNvCGTE9R8dnAssi8AxkyugMZ/FLtVlOo6ixb7wX6H81e8BsSqa?=
 =?iso-8859-1?Q?6NJbNGgrk+NZ3he7CKzd/3eTqD6PtR5CL0IJr4MUQrABCFviPc6zVeZ3wX?=
 =?iso-8859-1?Q?oFZln7TmJ8ttXZssg9jlZMtDUrx16vM9dt2T4fg5CSRuaGcYmLyJlWWjwo?=
 =?iso-8859-1?Q?DEhdcAkb5NqoJmEfMhvRZtpaE1hoWTMUe86xvrvH42Br1VteNoIepVohoA?=
 =?iso-8859-1?Q?9sUjHHBDYuYa3MVYDSd+A59F3fvRxQZ583/V9XWktsgm4KfUa7ArOnHecR?=
 =?iso-8859-1?Q?1UFCgKBl51HZFfDcGcdq6Ds0VUc445RcU+7fGB+te4YprwEUcJ1kRrhxBh?=
 =?iso-8859-1?Q?0E2/HykbW2M/mXF1RAVRwKSxlTdfgVjxhElnj5gfEZ3uh4VAz2uNRgDj1e?=
 =?iso-8859-1?Q?izoW8GF8FmbbHHjPTuPbFxLi//FYLY1MrgzgMduIccdpeLcVrSRlQsgBoo?=
 =?iso-8859-1?Q?0jhuBUfiRH7xX50QebBAQkZBWYMUyIWLlHHDCsaD9u48V+Yvp4F/Ic9yae?=
 =?iso-8859-1?Q?6AM4jWHTTM0TjVeVINj+2hTUtG3gBL9kGdA7ui6qGHyKL7qcjhCriNBrW7?=
 =?iso-8859-1?Q?f31ipgZPhZyxGajpNMa1DV/q4vxFTZ6REFSsiEpojo53r30OJzHpjm8gNH?=
 =?iso-8859-1?Q?p4ingQkEsHQo9jGy87pG5+7GuNsL3NMdNzUW4wk1J5LL95bQF4QM4slMG9?=
 =?iso-8859-1?Q?P4YwgVwLPEPd3tO0laCQtawawM1psGc71mKSGIn7xMOYwE+rjbgru31DK2?=
 =?iso-8859-1?Q?iDplojMwscFV73Y252MFIaezK8DJYUByyr9tyX6D1Iwjd+NwpIaTBSUnbk?=
 =?iso-8859-1?Q?xP6cNr2TgvuqBqurO50dHd7+gH9K6DeF+C4una+sfuQHJJdhUp8Qt4THRw?=
 =?iso-8859-1?Q?HyHk9pGsu91t1GRhxYBwaTshqMsUSRx8fAUGaneYfuq894RA7tPNMT9nvy?=
 =?iso-8859-1?Q?RqCSy5zTaqBtLxSYWlaeDMX6jn8VguUxogQfpI1mFJGmD2vhl+AK0ZB6OE?=
 =?iso-8859-1?Q?+OSD7qiRHG82UyBs13aePR4tRtIZrzXjkQvtsrNU9KvLHkoleDa7ScG5Ym?=
 =?iso-8859-1?Q?sEASO8oB+Jb7pvb1UURQEhvCzNfIOzCU4lRPm2M4L48Bow8XlHmIpvkx3c?=
 =?iso-8859-1?Q?N6UvpXwIGXTcZ+O4xJ9TFLAti/gtfb0uPBjKYs6P9ctoOkmtDOs/p1euf0?=
 =?iso-8859-1?Q?FZQXGrefOHXwm7mJ1vRQskDpckCWj9Uyz2vf0MU2wpzSt/zoCai1Fnp60S?=
 =?iso-8859-1?Q?dR1FgfLyRcGfl5JrWDkHkPfEKjfH0x3U0BiqMpnBCW+yEspP6kIR66+arv?=
 =?iso-8859-1?Q?+zfWGUwUn5Cb4Om1vr1DuhJ24fAPhiepu5nSXnFEMo7JYw/fvMnRo20yYz?=
 =?iso-8859-1?Q?b2DJyLAnFpHuRTU2DWVpENz1smaM8qCi5g/cryoTD6pD/UV8jZpgHRd7XW?=
 =?iso-8859-1?Q?p30nIWmZ64C/NAX6AAzT0F4UA8qtJcEKRbsK/qAu+/P8BRVoOqlF0Z6IC6?=
 =?iso-8859-1?Q?Zhd/GMUnSsU9SrWy1CmgcSUrkFdVBRiTpPdmZiIpIIGBK/1Mvs3QEjjQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf92573-0bb1-4c9e-09cd-08db24ce9742
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 20:56:30.9483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AmuJHa2iLKwhJfDQ8eTCQv4E37gl8XIXhJnroxY3RgpJcPMGMevjXScIg7Trou3jW4FPZYPe7YMIBpy6NnliqxO/4bSQMgmkI9jKk22Z7ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7967
X-Proofpoint-ORIG-GUID: YnO7ExG08MaqGkmHHP97gzjEuEfTlmQh
X-Proofpoint-GUID: YnO7ExG08MaqGkmHHP97gzjEuEfTlmQh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_14,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=823
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140168

This can be handy during new reference counter approach evaluation.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

v3:
 - Moved from another patch series
---
 xen/drivers/passthrough/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index b32382aca0..1eb79e7d01 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1275,7 +1275,8 @@ static int cf_check _dump_pci_devices(struct pci_seg =
*pseg, void *arg)
         else
 #endif
             printk("%pd", pdev->domain);
-        printk(" - node %-3d", (pdev->node !=3D NUMA_NO_NODE) ? pdev->node=
 : -1);
+        printk(" - node %-3d refcnt %d", (pdev->node !=3D NUMA_NO_NODE) ? =
pdev->node : -1,
+               refcnt_read(&pdev->refcnt));
         pdev_dump_msi(pdev);
         printk("\n");
     }
--=20
2.39.2

