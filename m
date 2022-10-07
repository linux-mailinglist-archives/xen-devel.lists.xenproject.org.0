Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902C95F76E7
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417689.662477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfH-0007DR-AO; Fri, 07 Oct 2022 10:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417689.662477; Fri, 07 Oct 2022 10:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfG-000727-HQ; Fri, 07 Oct 2022 10:33:10 +0000
Received: by outflank-mailman (input) for mailman id 417689;
 Fri, 07 Oct 2022 10:33:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkf9-0004P4-Hb
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:33:03 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b3e59be-462b-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 12:33:02 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297AP2K1008629;
 Fri, 7 Oct 2022 10:32:59 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3k208bupyg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:59 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by DBBPR03MB6716.eurprd03.prod.outlook.com (2603:10a6:10:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Fri, 7 Oct
 2022 10:32:53 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:53 +0000
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
X-Inumbo-ID: 6b3e59be-462b-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7eF3Ld0NgKbxkqyA393PPvl4rNXvZmR4Wc34k1/1SQqA5QZ9Sm0SnwZ89FibjqL5AJX9gW0qckPrk9qRNxZ8U/srUkt7EzSUlB9XhmTNH/U165i1A337H5cPZeKKI66hnDfaQNUDc3ZkyN8oTserNnLvURyGy//t1/YPlRNIKip/wc6GGIX9NDmJQGEVXITzKpf0g0PUJ29bCezjyypxrHn/2CmtqzjrkTatC2DmTYjQPXmgBkv6XSisSwIgm7jYDVDp2qLw2vuG6USDnn1Ndb+rwWPgUhB10OiDGEYaeqyjJaJ+dzVns8VyTdkT2QsG9ncJ5qY26Iy51phRpu6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QenTrU/w9T19tqKdM68BwBw1XM+QqDHCATxtF1s1i9Y=;
 b=WZhmAXvD6c3Pb0PB0PFK6MExeL+dn9yRn++BWuZYCs1LmcsupTyNx+uKCcqpK+jP3xJXX6/TPCpBLY4LDBRgkfF96Mft1pJQpTtLR8d/bDjR8oeaeUHN65WFFj0ts8T8sayYexKlioqhErrjCnpiHgykHsgJLkaW21PLFkL5sOMHN3ioHQSr3dLVIfT1aNCwN1XkkvU0HJ5M3j9CFGNRPgT+tuEoCcGcla8Mmx/96T5EMmTSGkYy/oOjwOH8lUKxGxdw2v8clkEEMLIHJEVllMl/OVdOgmVrFg67VsSxnPEZizDiIP7Kg/on/WvCkBquG3/yoj5pt3sFKtMWbhRXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QenTrU/w9T19tqKdM68BwBw1XM+QqDHCATxtF1s1i9Y=;
 b=NMVs8loIopNhdnBumKMSODAmFRsQidHT4XKj+DzM/cqlyAwIRameroK9NUnDzAdonBX+jMiYc7/AvYXYR9r68/FAU4rT0gBKa+UaANMovL9bCKqWqHwkz5sSknwTWMuNSe44g7K3QpkNYik7sDffWnmTXTpeBlWsq96A22TtusmtI6IzEOAcx04jhJXCEkdlcqZFgHh2izpx7tmerOA6v46c6a9Phhm5XObpDe+msH43AIVCvRlbVA9IEXJ8vH/YLjYSj67lsds2PecZzmXT6/jBsuLqF8kT1FMUcXuhM1LYj9JchcenM3VKjQY2VGoEdGb3X3xKvlRHSZ18IW0geA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mirela Simonovic <mirela.simonovic@aggios.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Subject: [PATCH 15/19] xen/arm: Resume Dom0 after Xen resumes
Thread-Topic: [PATCH 15/19] xen/arm: Resume Dom0 after Xen resumes
Thread-Index: AQHY2jgmyrQmtGIhpEijBSu3iT5A5w==
Date: Fri, 7 Oct 2022 10:32:50 +0000
Message-ID: 
 <500232faa5a520d5cda582de3ae7cf7735190a55.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|DBBPR03MB6716:EE_
x-ms-office365-filtering-correlation-id: 9b2567a8-cf60-4676-a972-08daa84f4ad2
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4DzNZSx92Qooy+5zqPvJkyyhIXsaWfZzironQsByzLZF0umzKX5FT4txJwJQuEZKImsxCwgQtshCQj0gk87UKAKib2Jci69G7CPp+w5L5tY7b2ie6G7U1aeoAC2T0I2a7ayv2IDQuJTRSWYKEoLukH4Nn/+H9FE+dUabuXMOl9L1sTuRw/Qo2UNmG77/DUqUqwwoQ/8DxPm1/HixSidM3NvVeRIKrBtFtrQ7q+tkzAVlCpb9Lk8ZqrhCDlO89E7wSj/04eCDWCggcmvnlBhyHhOYR+CbfCxVhTIuP75rE0IbjbxV7MJFXA8dBuJf6HJzqgu+RtZxrzuWO7zF8/KSCjJSjzNWmRZBssDNLPK0TRMAMDHjx6tOAetmqTPQuEPe9vnCv9Awdher/Jhm6xlKugWxeJO8Hf76R1ki4DTpW4RC1CPraPl+p3+JrfGOi84qU8gOcCpJhtOzmS4bxFf2GBEPNPCDYGelmvU0wY/LEKM3be7Bh2AmJJJoVQbAOSVLWkyC8sg8hIg44ZfyWZvLDUcIDSz2CqT59AccdonN/mZ6H6r5RUuxsNnRMUZxkq47wqg42xCA4Qfh6yb4JiI3HHzwqSm1vJ9k9T0FV5V66o9oLU8hyJ3lDPNaF8F2uYe+KppfsP4R3EaBmoeA1bxNiZpSb8cIAu56vvCn0+Ow0/NxardHkgYhOlb/CeAxSn7uReoHSln3Uk0ilyxXb/UpbL4wf5Lf8VWwEum1T+LTixKjA9RXyoOP8EeycrCp1EzaxdsIXzQsG7T9bH1xLnw2lQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(2616005)(186003)(83380400001)(38100700002)(38070700005)(4744005)(122000001)(41300700001)(2906002)(5660300002)(8936002)(55236004)(6486002)(26005)(71200400001)(6506007)(316002)(478600001)(8676002)(54906003)(76116006)(91956017)(4326008)(64756008)(66446008)(66476007)(66946007)(66556008)(6916009)(6512007)(36756003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?kzHyXZtW/Icrc85ffh2qf1iVA9MnEfXoxhBmFErvevfDgiHd9lTr172BRB?=
 =?iso-8859-1?Q?uefu9jDhVUgfodiSTojY+NqzfbfEYdUjRYcFyfVZv/3txUoKFYvsp9syaW?=
 =?iso-8859-1?Q?BpH40Hd79RSVz7QqCXylHNsbUCM4tPXyZFQ6fnNSHhZhaSIrfbWVrqNK9H?=
 =?iso-8859-1?Q?8cdSXN+SjKc+bG8Lhi++u9xMBO/95UeRtTjDAVjYL7BW3iP4sP3+UikObr?=
 =?iso-8859-1?Q?1R/Uo67Ziz3uH9hzNyJYPoYguEyFPXZp0ounD+AZXydJ+zBGhr0BvKeW99?=
 =?iso-8859-1?Q?m+ItQ21FO/cNTy0NQ7h+ljfFYVi7KFEeJLJ0L5ad5+nyxfr263UNNYo7gb?=
 =?iso-8859-1?Q?HTwyhqW2RZzz8Z1N3ZPsAShI2mmixyejHLupIENoVaO6mt56Rg+khJxxVn?=
 =?iso-8859-1?Q?aH3nb/YRd+IRmwcfuwYhymrRtML33nHcs2CAH3eyPJaYrxW3ygKFZgn019?=
 =?iso-8859-1?Q?hfBe61mGZNMnKgCl3o3FegjukGTHC3CSl70ot3FSycabVWL+Xh+X8OP+uZ?=
 =?iso-8859-1?Q?NVZ3E5U+k7RKpuqCeEZqRma7tu084iu4++8za69Zci1hJVPrw2L3vOIh2l?=
 =?iso-8859-1?Q?BiKf5MvabgDlUCyhMmPutQypUBjHGkxqT/ldi5t69iFDmL4Go3xTPNiEzs?=
 =?iso-8859-1?Q?c24+DUHYApWqc/z8QqKUAgsJz6rBl7Gh/4fFHKn4IdV5xHc0FCQbjqPQ30?=
 =?iso-8859-1?Q?GdiFnIYLyPd+zFQGmllCb5HgI/uFCn2kITJIAsRRVTZPBo5NVN+THPLvCd?=
 =?iso-8859-1?Q?fs1h9Zo977acmPvxEtIiGDZwoNdNTTQkfePhnYhR5p97vBXu4/jTW0mZId?=
 =?iso-8859-1?Q?hWbQuP5zU5JREcdR1DU7PHTmkQJxNgJ/psqzU3Q1cDZYMjFb9pSwHnKknu?=
 =?iso-8859-1?Q?7s3VzuPLV4bJ/iULQP9Gk1EY1m4AGx/xl+nE3R1A7R690eaKALwxbZby7N?=
 =?iso-8859-1?Q?i9nDHCFkPL1gmt17s7E6H1B7c8ho05god71c+oJiCTr2ISI5TIpGZkLoxa?=
 =?iso-8859-1?Q?d87DtYpUjMcbyRd3Wk6wrwnVK6HOEKJzxzxSevj89cefIGuoiy/hEvLolD?=
 =?iso-8859-1?Q?REfUBQryPd4QY2xNXTBcPTQi3tzMiUiIg+hNpiWxitjjoZ5sN6oeSwjov0?=
 =?iso-8859-1?Q?F+xAcC5fnfHKcCHMoKxB7T70Qt95BKZclHPrrCuA4EbjxHTOFLduaqxvM9?=
 =?iso-8859-1?Q?pFAeR/0QvgrmIUIBPH9cwa8BemhP2B5ScdHYc1uR6q36KsWrQNMjoQIm8e?=
 =?iso-8859-1?Q?8J111DQKxOWhnLEtoA75SN2aU9vSFHIYrHYHKISeOGc2ry02P2iMgdvzvI?=
 =?iso-8859-1?Q?IXYFEnqq7ZJenugyMZnmTGoQ/sDe7xxpV5ZKpYTtxuKxpoGzwkA8pmOFiM?=
 =?iso-8859-1?Q?mDbwXtTDrryt1N52dyHvbh36lR2pn+cOqIG/9VTbxw8imYIK/h3D36R/DJ?=
 =?iso-8859-1?Q?2nx94wzR7ZlHiaWNHy1lUzd/hd/WrAI34m43VRQit3p+ULg6zGC6+F/zK+?=
 =?iso-8859-1?Q?poiMA3Bcq5x+CpBM0cSzdBRK6dxbsletew3WQsAEWdOTsg6c0Z4VKZkn9H?=
 =?iso-8859-1?Q?m5DMcEduBeLseT+GwzuNed/yOIuWFUp5pi8jXzjxJ3m4n8nAtzZuH85gQ4?=
 =?iso-8859-1?Q?0cHORSj/zHeFlkuTYBRCpMk9Sgzb83v91tO0BV1aD1Zt3FvVEZXqKJKA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2567a8-cf60-4676-a972-08daa84f4ad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:50.5989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jr9+kJnEJj09+oOLSOdsrXdLnsRMA0dgfwCJesglnugZVNclpTExRr29WEnHllRJvyRTTPYDn/U+I8zjD0DduQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6716
X-Proofpoint-GUID: CrRIqK3XYkYeRBG8CLsP4qoJCbaWZxB1
X-Proofpoint-ORIG-GUID: CrRIqK3XYkYeRBG8CLsP4qoJCbaWZxB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=393 adultscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

The resume of Dom0 should always follow Xen's resume. This is
done by unblocking the first vCPU of Dom0.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
---
 xen/arch/arm/suspend.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index 13d1aba658..4a690eac3b 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -206,6 +206,9 @@ resume_nonboot_cpus:
     system_state =3D SYS_STATE_active;
     dsb(sy);
=20
+    /* Wake-up hardware domain (should always resume after Xen) */
+    vcpu_unblock(hardware_domain->vcpu[0]);
+
     return status;
 }
=20
--=20
2.37.1

