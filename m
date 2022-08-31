Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D01C5A7F99
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 16:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395682.635485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR0-0002j0-Pv; Wed, 31 Aug 2022 14:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395682.635485; Wed, 31 Aug 2022 14:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR0-0002e9-MT; Wed, 31 Aug 2022 14:11:14 +0000
Received: by outflank-mailman (input) for mailman id 395682;
 Wed, 31 Aug 2022 14:11:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jA7u=ZD=epam.com=prvs=1242718080=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oTOQy-0002bw-S4
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 14:11:13 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0fd0947-2936-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 16:11:07 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VBo4GB032537;
 Wed, 31 Aug 2022 14:11:05 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ja427h4rd-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 14:11:05 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6301.eurprd03.prod.outlook.com (2603:10a6:800:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 14:11:00 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f%6]) with mapi id 15.20.5566.019; Wed, 31 Aug 2022
 14:11:00 +0000
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
X-Inumbo-ID: c0fd0947-2936-11ed-82f2-63bd783d45fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXnQyhJf4DX1we0FISOu932jDiOgUD4D1DKvbFxJE7zOlshE4C/kSdnG6StzEu7eql6gFrj/fRz0tWcHD95FLGi7lAIARpP/zY5o4G8/6egZwc5LtYPrnJwyiDphFT4S/eLMgB9aCxEwoEs2VLFOFshITZlfVFLdGsdd1+dt0Y4fRwbC6Kmd42n1A3QRJQSomwnobyiG/DP8vlzVP6ZbIt7C+1KpONgk6l6COy1LHu/qMaXdX4BMwF4oQfSQKDKdtxmz5qMmkhC/gSPhiLvHn1m0al3cVf+qTRtIzv9KNP2FrmzgjDZLxjDCsua9T2R+G5iquQVCMWj2dYXbC+btnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+xdObH6FMWVQ4XGWc2Z5mSrpHg5ctG6VX5xgOC+obg=;
 b=dM6AN/o/6xQ4fhL9r8HF3PvAdbmILG3TFgllrB7qsOc9l4lIe4YTHufHJ0pgGp0unisJjj/b6btjMH16PWXMEeV6+ya4sExpCn7cjlgfFpY9omUM4Z2MDNr3EMS5ZP1K/IAVdDo4u3oeH4dgkdsD1ci1Fgq5DixcFFSc//FIhjhVaNM6i2DAGohrjtCs9K6dUf53dP+TzU2ci8md0bXCHds9rh5pt6liDGIqbqXVT3EUsbbquOLpWMxZArVIK1eHwmnWBhw2b1/r9bpkZZoWY6TQNzzhQ/n8hRt/8QKdchaXhZEwLWEzIeO8C04FJ51/ZgtNem7J9xy9bvljqDlmjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+xdObH6FMWVQ4XGWc2Z5mSrpHg5ctG6VX5xgOC+obg=;
 b=jDavVxJctqIsQT5YdlAtDMK5ww4sz/CXfYEXoTESTanakIRPyLFS8tZbSGqNvNsjysgZIiQ6F0HwmjKwV4GGzU6nqbOZAclSltwsRLMdKVX7sJYw6OaKHGIcD3icpqy+cBevnd2CmwXdtaPaozn0WD+LyINYRiajTGenmTbj2oAcYoTamDafoinG53gsFs8yxcxnO7SyJyqUB/5wPSF7rbjmbybVBzhqyHUaTImo+4OMCtE+doqOGfN8wFkAVYzVYz0VqWvMT2PMoj1+DpPylfjRutFakhSmpAymmDQZ1ze5Xfng7zmDnPr8qd17CvixOc3JnzWOkyMgAVC92p3ALg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [RFC PATCH 06/10] xen: pci: print reference counter when dumping
 pci_devs
Thread-Topic: [RFC PATCH 06/10] xen: pci: print reference counter when dumping
 pci_devs
Thread-Index: AQHYvUN/kOplNkP+6UuZAhHgLrcI5Q==
Date: Wed, 31 Aug 2022 14:11:00 +0000
Message-ID: <20220831141040.13231-7-volodymyr_babchuk@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.37.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df64cb83-6dce-4dd5-6313-08da8b5aa1fc
x-ms-traffictypediagnostic: VI1PR03MB6301:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PiksFeHyITKAHmW+l2DEzpUlu9y2y4rQS6axx/M5N5hxnvixBNjMo+KbWZ+2UjbcpXi6FsNxd4OfETyMk/JJN8OCvf3jK0g2BqdAgKPASbPavlALnUM2dLePsfk47WTyv0NfHbDzKrbWb2wFDEtD9+xpOBVP8jExKx3gKuZbmNjn/fh5hb7qo+YHNZNL9AuhTFMhrniNWS2ezy6RI4a6/hjWeiJQvtzASMEImaWdTvxoEg6kV2V6fNNNCNGh7FbI2yG9CHwTlsPVRcF7Y1fFthNBLLrij7j2TTjNGoVJfbGogRvMatzVcV8E0Lu9+zI46TjJGTPRp4kdPw3cJKbCXk1CBvI0YaNOSMatNguhhygEj+Xtj+JiI0LWMtiJRG16ezGQWU99O1BGI9Q8htDxZhIff5P0l06kj6iOacaJqoU5Mj6HBaMysrzoEBzS4UWdmurhfH8rrxXyZT9DOj4K2WIRvpHYGbsikWLru9jI0KKZSLCEfIjs93wy+L02MLFQoX3I5QPXR7aAl2jseNvA3EupWa28mNz9RBsGjM7yfb8tV66rr/D+mgBnQu/li35aL82Z6YDlDpBLlW7y/6k4jQ/q2EzZHkEs3+ZYXzzjha+Cy3QXH/mgwdZKuh629c0LjVYx3QcU8MvglsmQ8Rt0sEO4H2/U/zBNFDHQjPCkdHQd2Ae+aClyTMdiw43oG1+PTbjOOZJpxVUAziJiA5qKlbHLBIeE2vv8SX95XqeqY/4BPHrf26L+3jQn4eej8cJuUlPA6wmEadI+jJkUf64xmw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(4326008)(66556008)(76116006)(66946007)(38070700005)(66476007)(8676002)(2906002)(66446008)(64756008)(54906003)(1076003)(186003)(83380400001)(2616005)(5660300002)(91956017)(8936002)(316002)(36756003)(6916009)(4744005)(6486002)(478600001)(71200400001)(86362001)(55236004)(26005)(41300700001)(6512007)(6506007)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?IuH/fWW3kxM8p1glEEhKw38931IhQclU+0Kj3G65X+qCBUisKwrfKQBYsh?=
 =?iso-8859-1?Q?RkL6584p0EYSOZ7TSAFomV3HNYxvC1OVGvqzcgT2aOmxrNY7VIujzSorfy?=
 =?iso-8859-1?Q?uOWtNDB2WGwWz8YMtcsuVBexmtevTe0z2ih3iXxRvOOJXloDDqeQ5anZvg?=
 =?iso-8859-1?Q?s3wFqI3EJqqMydBRTNoWGeqpRDwSNSz8F6tJ4wnsqyvFlM4IMKDNSiIIwP?=
 =?iso-8859-1?Q?incdBgUMstIozA65rHmsiHKARAIJuJCfCfVMIrj3saqKqiL4xMHSH6+oAN?=
 =?iso-8859-1?Q?j+uLvYpIm1/Ye+EP5nwbnp3anPXtBWLtmRC49o5LPY0dI3VhX5IQUDmPdd?=
 =?iso-8859-1?Q?u9ar3WelpdfPnS166EFgz/OmWBdn/vxfzINynr1STIJGBR88r/YbdjXRxk?=
 =?iso-8859-1?Q?J0v4gIwSznvIvWJEEZctC3iB2b6SB7nk6/p05pDdrUPz3VdWlAAbuXv2Ic?=
 =?iso-8859-1?Q?kzVRn/WLYHa20C6yJ6xoh0KhVV/YMgVGridPiVfZv9jdDAAfcGIbMuiRQm?=
 =?iso-8859-1?Q?Prwk0iBm4gfZQVXStHZbqNX2Bn7qTKUPNHI+i3IkO6bbDJtsaPnmJ8duMR?=
 =?iso-8859-1?Q?mglHK9+u9tvheV52lNFJEUJgo3jj0AVNaa/RVy7DesSoWkqd0DKbBZ2H4t?=
 =?iso-8859-1?Q?DFnT4QBD8RYhs34VLnycgYdagW/YlfmPNqFGMxNr8goPL1AcePVnDTboV1?=
 =?iso-8859-1?Q?e1V88pMIyEcrc5hwAbKyhwn86ZB7uYM4AGR9Fex5jHHepsWILNiamaHfMI?=
 =?iso-8859-1?Q?MkeR8qVVCnzd4EEFWI1vBhepB+qtV/6hls1Gr1MsGfMOaZLRb1XN6T2t2L?=
 =?iso-8859-1?Q?iqPjaNhaJDVBOaRBHft91lehzQDsaMrfJbPN+s0TjgJUA6H7j0sJsuQGJk?=
 =?iso-8859-1?Q?nGDT9n4/0LwRba/yWeYRn7jWHyuMjmuROeVngKZ8Aq7geWL79qrc7PA4Nb?=
 =?iso-8859-1?Q?TZgFrGpfIR2JeX/l7XuLr6Psqie1ICrsWzH/HBSFfRis83NJsQlVnzSq28?=
 =?iso-8859-1?Q?OaOyPOZK1FnxP6BaL9VOnFI01p0AiYoWuWDb35SCdXDckur6ZtmCtIhob3?=
 =?iso-8859-1?Q?cdzT0hbpHTdOOtukNLLprnfYKjE+Uh4Gol9+bRmTOMRBmnV2jD4m5gfXtx?=
 =?iso-8859-1?Q?swq7qqJ40DxypkNL4Yxkqv+RtiD5UtMKpYNdIT2PcbdBPQC7pgMQYgo4d3?=
 =?iso-8859-1?Q?caA0TibRZ8Yfk+cgku3272ujup4nGBrMfokanXHNN1vYDy0hJYF2b/t8Qi?=
 =?iso-8859-1?Q?/ZJqs0/U3RIxA+TW7rnoQAPk12V7ZGBiZ+m+SmIpN/LNMFfUbWunTkfF/s?=
 =?iso-8859-1?Q?YeP6hY9UJ23YZuKeXPUHi+ElWtSrHEU0MB4hYAObH3YGjQWRYiAmoApi84?=
 =?iso-8859-1?Q?dcZSlziRdcZs+wJYMi3CzD9qd9OnYL3nR6cRLdV4a/SpzaddKh942WDbWi?=
 =?iso-8859-1?Q?/aS3sjAMmaAl3ysb2mJv5i+jJ3g9yTYkmsDOYBIqOuVF0jg5qI+7nFm3RN?=
 =?iso-8859-1?Q?r8yAid7IiermXsHzFw9a2I48Z4VYeSOliq4vYSQdl6rfAGfKkMyeG3h1km?=
 =?iso-8859-1?Q?8HzcfqcY64kAmr3DHCgz07/3mpcU7cuel2GsvdSHJxXSNaHOYKGfMECtis?=
 =?iso-8859-1?Q?T0urjCn8FeMQzDZ9BCQUZ6bkkIs8b2xJap5IZ/dBzKyO+IqJiUE13vvw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df64cb83-6dce-4dd5-6313-08da8b5aa1fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 14:11:00.7023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dgLiXuwiyeoSdXDyP3Y4VB5oTqp7dnSN8ZQLqPW3CvnTRQ1Zp7/Jr3XBHPHRvg3u4FB9nRiUyf1GkgxbcaBT9RjCRS5m/2/tUXVlQRoGRRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6301
X-Proofpoint-GUID: O2iKEQIqcWqnkjvBNSQL79VFtHSRVH5y
X-Proofpoint-ORIG-GUID: O2iKEQIqcWqnkjvBNSQL79VFtHSRVH5y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_08,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=963 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208310070

This can be handy during new reference counter approach evaluation.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/drivers/passthrough/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index a6c6368769..c8da80b981 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1381,7 +1381,8 @@ static int cf_check _dump_pci_devices(struct pci_seg =
*pseg, void *arg)
         else
 #endif
             printk("%pd", pdev->domain);
-        printk(" - node %-3d", (pdev->node !=3D NUMA_NO_NODE) ? pdev->node=
 : -1);
+        printk(" - node %-3d refcnt %d", (pdev->node !=3D NUMA_NO_NODE) ? =
pdev->node : -1,
+               atomic_read(&pdev->refcnt));
         pdev_dump_msi(pdev);
         printk("\n");
     }
--=20
2.36.1

