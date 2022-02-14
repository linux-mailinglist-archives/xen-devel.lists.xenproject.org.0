Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EA94B4665
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 10:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271337.465743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXmv-0008EY-Uj; Mon, 14 Feb 2022 09:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271337.465743; Mon, 14 Feb 2022 09:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXmv-0008Bi-RY; Mon, 14 Feb 2022 09:36:53 +0000
Received: by outflank-mailman (input) for mailman id 271337;
 Mon, 14 Feb 2022 09:36:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsDI=S5=epam.com=prvs=4044e07e7c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJXmu-0008Ba-8S
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 09:36:52 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2527a57-8d79-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 10:36:50 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21E9Q7ix017561;
 Mon, 14 Feb 2022 09:36:44 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e7mer817j-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:36:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5522.eurprd03.prod.outlook.com (2603:10a6:208:171::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 09:36:40 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 09:36:39 +0000
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
X-Inumbo-ID: a2527a57-8d79-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuvyXHSmFdDS3RZMn8MhWCVqf+3O3SzyvAE+s6B/rQ7tDobEr94EYogM6h9+jHfr6d+RhFs+Yzy+Shx3gW6maPsw9pyqFsuSLMKXq4efUmXqyRkZxbIRP7BxlJpuoy9BhG1SEx/qji1BUGrMXJ38R+2WsENR+L8ti+m9XSYfugBXBgvFhaltVSpk103LKQBWUwgD+YbuexwH4Xi9JDL5W5adKUHi9rDuutWkVOO+OYmfUzHqjQQUpV4odPCBEP2sQv1Itl7aBfn4tm9u7oSYvFvKab+mkJKoWYcuLqTAUVL8bbleVbJc0IHpxSrEF3j1KzRY+WnWvBRCGwDdSpoTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=275EXLjnNOik2YoOQdvWDpRY4pPe4tyftRlYIU+Lsoc=;
 b=JOETXkEjC8m8eQkP8WGdW4n1yOYt+3saOZhcxVYHkvn1Wt1AEHQDJf9GJAefLp81lVfJPE8WwoaapiDpaNIfMkB0KYRLyUefAMdvbVnbFJsWL47QgivmkO+ye3XZ74owMH1D14OWbVKKsiWDWngxsVDWnT38tCw+i7VEogKM5+w2dpcWHkytWm3O+VTnI9RJJkGyCy+Q/EoIuLfAMnP8Hv9v6Ox0HAuMwHs9YoaRWfQ2oFfKpXHLvs2EMBg1pxDOFaxkrxgltSRfJeC7ImjKmSOb+RjJkPJbAjddvfEL5hO9Rxj9tUZwsmEt+TswEfJcfozOPyJtfuAQINzoC2vGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=275EXLjnNOik2YoOQdvWDpRY4pPe4tyftRlYIU+Lsoc=;
 b=Nm1iv+FJJwBaHBtrieA0SG6Qnol3XOaz2eVWWI/lQVIRp6I6MjNeb+Iv4KalfetDXl25m9QTp6QSczxQ6L4Xd6oCceuz0z7AYb0j+OkrsYDthmbGfXqU/MPBvApcKwurgifYKyCWoDiuOa6acw5/RljdXJFF8/3Hha8AWeUCMWHBJTPI0oPHZawKYHC/zwRSxZkoTFwFl0XH4h63/sNKMncVmzDM9dmRKBpm5avcM2buEiyAQloi5mPW0ydkdgTgq7xnY9PzDaI8skOxE5CBgpFwjFxWKOqSfbvXMbvmdzsG9Qw7dd4PIfnHzblAK/zfWZf9eE+EzBvqcrPT7OA0EA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Thread-Topic: [PATCH] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: AQHYHboQT3cBWYI1/EGunE7hOwop6ayM95MAgAD+qQCAAEaDAIAElIcA
Date: Mon, 14 Feb 2022 09:36:39 +0000
Message-ID: <33fb1095-64ed-29ef-ba6b-cbde21d941f8@epam.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
In-Reply-To: <YgZLEMW9US9QjjYG@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 439bc7b0-41b1-4ae5-f9f8-08d9ef9d80b4
x-ms-traffictypediagnostic: AM0PR03MB5522:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB552271E043054CBF0DEAEA67E7339@AM0PR03MB5522.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TWO4GeJTZ/U2PloYYTJLIH6ML0QRwyZVQQ5FjRdJlbeX2IlrNpi4pO6cNwu0vveJHIzdbPc+zId9SmMgngDZ76rc/U2MmMVaE5NXCFOTBO4K3dJKZf0pBYtJpX1Eqd8BAFkm4lkGLKDuGfRxKxrAcc8gCzi9lEjM1y4+Id6P3vqKi4ES44bVF7lTNJRkSvWcs0raMQxScySVe+M1zC/OE0o5jNxET6MT4kao+VT/Cl1jh8b82YZ3voqnsoP3y1cscE/oLt7oCZqqm75gHuP+hwyud7tWB6ihcCjWOr2etD/eYFAj4S3grKCduUlN0zezM/1YsHX/ptSKuV1JElc455nrPQp3lsV0eT9YhzDAs8X2JckDFN9o3JrZFTBMOoa+QJt53CFHrvVpTly4I07XPY6QDpANqLltlBabi7b6+7+Nq3bNu8yIcznd519HNfikJP7U1bHPfHzlqmvNQO0Uer4xMZSVQqnIMr8jVKNDb9VSz5KvTjh/gxEUz28Xng1s35/Yt6NOS1XfpAqo7ii1w2pRy0bOR5/HX+GT+y8ESpqZLrnabkMewBcfLAbRfp2H/mzutV3q4GJI5HfQuaSJFp5qdJQxku+t6/4j3AuEa3JD9PT6aJPqPZB8+q5HdVOA7aKdDYJxtdrfq7V8zvX8JtfSk7iPB9XJpN4vzSwVkDKz3WBNWpch//jbwbxfPrxpxHZx7QXnq18TEchOzJlK6lGg92UOm5afSKSIrCW17mB/qrIu711fWq4tsewLulVaXhKNkhNb4SDRQPkJHSt1ENa+CdNNxF62pDxqe6uzOm5fnepwHkDrpZwv7fHloLb1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(36756003)(107886003)(54906003)(6916009)(2616005)(31686004)(122000001)(2906002)(31696002)(83380400001)(86362001)(316002)(966005)(6486002)(6512007)(91956017)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(8676002)(38100700002)(5660300002)(71200400001)(26005)(186003)(4326008)(38070700005)(55236004)(53546011)(6506007)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T3ZaUTFaQjZuTlJXT3JOZ1RNZjgwMGdSaEQ5eGErTWpBd2V0RW5VOSttckZR?=
 =?utf-8?B?ZHNPNEFhOXltWkJQbHJ2SXRzYWRaSHJZdG1HcHVWdnFDL2pMclhTaElRWUYy?=
 =?utf-8?B?OExJTzlnQXJhZlRIY2ZzOWhlcGRDZkwzcHUzd25LejNHSDA1dStuZEdsTGhW?=
 =?utf-8?B?ZXJFVnFyRTBETHNacTIyMTNaTTM5cXEzWkJPc2tuOVV4M2Vrc3p6N0tnK0ZU?=
 =?utf-8?B?bnBaaFRnM1NnYkNya0x6aDlrbmFHUEVHTHkxU29pVElheW5Ta0tzZzBzYXVh?=
 =?utf-8?B?THZ6QXNscUxoQXNZT1BBYzNjZGJ5M1phSVhOR2l6OXJhY2tFNW9kUGVibHZp?=
 =?utf-8?B?S3RHTGJNWnp5c0UzLzFHdjRNNjQ5eG0vbG9ZQVdESHNWS0pNNmY1djUybGtK?=
 =?utf-8?B?ZkdiM0xKdFhHTDhEZ0VwUW5jZ000T2JGSWFpVHF4OEgvNFpBcmdDUXJWVU5G?=
 =?utf-8?B?WWJpS1ZKYUNzaE1NUFJIWWpMcm5kVXRYa0FFNzl3K2R5Q3M5VFZWdENEM3Fv?=
 =?utf-8?B?YzdaNTlWbGNVK1VHSHpDeXVTeFBVNkY0RFNSeFJvcFgvRHhFSDZLa3lrYjNy?=
 =?utf-8?B?Sng4NE13eEE4bmdGNU9ZRVlKSnFDUFRxQlhvUmdVdTNwc1FZb3QyOVJiSlQv?=
 =?utf-8?B?ZzZnK0FVUjV1TW1PMTIyOWJHUURVS0piQXJjT2NxMUFicVJwUmljTS9UWDJi?=
 =?utf-8?B?NGtNRXBTWkc5dTFHdGpabkw3eHZ6T25TbW5rcjgzM2l2bm9BRVQ0MjhPOVhI?=
 =?utf-8?B?RlU5WGJuZjU2TWxIQklRdVpmMDRHdVRZaExhQ3JLUmtheGptTFd5NjIxNmlx?=
 =?utf-8?B?OE5vMkI2Znc0Z0Q5WEd5QUVpS1F6allBV3pUbkFtc3dzNnUxYVo5eGM3SStD?=
 =?utf-8?B?WGxva0E5eEFPcjZFeEMwRW95VE5hTURMSFY2cEFJRjBFYy93RnVxcm1xNlBH?=
 =?utf-8?B?OHNFMS9ZK0JjZFdUdmxia1ByUlJobitiTFc4UmhRVnZaQU56WE5wNllGWWhG?=
 =?utf-8?B?MzU3MGtFN05MUFk0c0dKM3I5Z3d5SFkxOXNtZWRxaWIrVktObzdOSVJkNUhQ?=
 =?utf-8?B?aUhCR2JVN1l2bEhhMkJTYlhkaFNmV2pjT25LMkFZWDdNcW1veGMvL1M0Snhh?=
 =?utf-8?B?cGdtejUwd3JSWjg4dDNab3FtaENVMzNxcGE5L1lVQmc0U0dralpjTTAvVzJa?=
 =?utf-8?B?YVZ3T3VWSzY3dGpPZ0pnTFh5VjJCTHRwQTZIYmxZdVdOblBvY2IvYzhlek04?=
 =?utf-8?B?YUlXS2J6OVJxb2tOTUVwTEhHSU1OOHhGREFEaHkwWFZGc3g3L2xlSVVpc2R4?=
 =?utf-8?B?UExURUk3WVVma1ZLbXQ3LzRrTW5zQWVsUEtySkQxc3ZvOUI4QzIzRGRKMkxC?=
 =?utf-8?B?Y0dGMVZmSHVxUDErWkJtdmJ0M2pDUHNIQzFvMW9tenFPdTZGdmJiN3E1REVR?=
 =?utf-8?B?UWdhOTBBWnZ0eDVwa0k3Ni9sZDM3VGU5cS95Zkxtb0xvbVY3bjg5cHFDbDBF?=
 =?utf-8?B?MGFFUlJRN0VqUEMrdnZ0cEY0NVhwb2JYUkc2cmZSL0JGNkFvN0dPY3dqczNp?=
 =?utf-8?B?dEdOM3RrQXNGWnFDNS8xN3FmelhIZTlGTnNpNkRyRllZZ2JBMjVWaVRJblJD?=
 =?utf-8?B?QVRJSmg1ZStIelVwNTVUZHpBcUxNcHdDa0t5ZEwyUU40T2N3ZDRJWGxIVnBu?=
 =?utf-8?B?Zmx1WUFUMXo1b3V3Ly95TFYyNFFzL2dsTWlaUU53ekt4U1JlUnJKckNVNlp4?=
 =?utf-8?B?MEpJeHVtYWRzQjBsS2xHZ2FjbGRjQ1V3OWk4bHpVcjd1YlRkNmE1WVV2ZTBm?=
 =?utf-8?B?L0VPQ2s2S2NBdExYeTlPOHhxSGQycXBGVHZPS1poNmFaeGorNjRpaW1MUldm?=
 =?utf-8?B?SGtydkc4RHdlR0IvdENDQ2lyZ3p1UGVOUFBZYUNQeHMyR2t6VmhXNFNMNjRY?=
 =?utf-8?B?TVU5c2NkQVcvejFVa3NHdWFpK2V5Tkl0OWRtMmFlRjZtVEtpSjBkRkZXTE04?=
 =?utf-8?B?d0ppSFptMDVNVjJ1c0lybnltVW1SUTBQYU8rbUJKZkZIL0RwNGg1TGRacFdh?=
 =?utf-8?B?N2RJRUxQWjhyNlA1S3drVHo1OTdCRjRReGd1Sm9WUG8zUk52UnRsaDVqdVJn?=
 =?utf-8?B?TFVxemtSN2RFeEo0YlA4K2NBYkZaQUxsWFk2WEpZN2s1UVlLYjYvdExYdWk1?=
 =?utf-8?B?NndhR0pmMlBtYzFwOFVWWVgvaUNKbzd1dHlwSkZpYkJoTExnSnZKUnFORjZF?=
 =?utf-8?B?UlZCRnZ6aFBuSXh2MVdvb1lDYlAwN1RZaU1FU0xmRW9MUjRSK3JCNEhmM1J6?=
 =?utf-8?B?dlkyeTNJa1o2T3hjbk9KYms3OTI4d1RoMENGK1FKZUU1MGx6cFIzdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8810E1878EF4D44BBBD5C908DB8A5B8A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439bc7b0-41b1-4ae5-f9f8-08d9ef9d80b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 09:36:39.6165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iKsZGjr378gRjKis1cl3jtZYhJnG+SRDCaKMYN1Nq9OHQsVFoGCiM49EAhwxXXoHfPdJhmTwJ0oV+LB3uoZqcY1heLwvj8SX5UglK9JmdixHzsJYYTv96xFLa8MH1V0L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5522
X-Proofpoint-GUID: IsMPRVNszC0SUuCK1npszKdMZ1Qj6V71
X-Proofpoint-ORIG-GUID: IsMPRVNszC0SUuCK1npszKdMZ1Qj6V71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=873
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202140058

DQoNCk9uIDExLjAyLjIyIDEzOjQwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiArDQo+Pj4+
ICAgICAgICBmb3IgKCBpID0gMDsgaSA8IG1zaXgtPm1heF9lbnRyaWVzOyBpKysgKQ0KPj4+PiAg
ICAgICAgew0KPj4+PiAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB2cGNpX21zaXhfZW50cnkgKmVu
dHJ5ID0gJm1zaXgtPmVudHJpZXNbaV07DQo+Pj4gU2luY2UgdGhpcyBmdW5jdGlvbiBpcyBub3cg
Y2FsbGVkIHdpdGggdGhlIHBlci1kb21haW4gcndsb2NrIHJlYWQNCj4+PiBsb2NrZWQgaXQncyBs
aWtlbHkgbm90IGFwcHJvcHJpYXRlIHRvIGNhbGwgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzDQo+
Pj4gd2hpbGUgaG9sZGluZyBzdWNoIGxvY2sgKGNoZWNrIGJlbG93KS4NCj4+IFlvdSBhcmUgcmln
aHQsIGFzIGl0IGlzIHBvc3NpYmxlIHRoYXQ6DQo+Pg0KPj4gcHJvY2Vzc19wZW5kaW5nX3NvZnRp
cnFzIC0+IHZwY2lfcHJvY2Vzc19wZW5kaW5nIC0+IHJlYWRfbG9jaw0KPj4NCj4+IEV2ZW4gbW9y
ZSwgdnBjaV9wcm9jZXNzX3BlbmRpbmcgbWF5IGFsc28NCj4+DQo+PiByZWFkX3VubG9jayAtPiB2
cGNpX3JlbW92ZV9kZXZpY2UgLT4gd3JpdGVfbG9jaw0KPj4NCj4+IGluIGl0cyBlcnJvciBwYXRo
LiBTbywgYW55IGludm9jYXRpb24gb2YgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzDQo+PiBtdXN0
IG5vdCBob2xkIGQtPnZwY2lfcndsb2NrIGF0IGxlYXN0Lg0KPj4NCj4+IEFuZCBhbHNvIHdlIG5l
ZWQgdG8gY2hlY2sgdGhhdCBwZGV2LT52cGNpIHdhcyBub3QgcmVtb3ZlZA0KPj4gaW4gYmV0d2Vl
biBvciAqcmUtY3JlYXRlZCoNCj4+PiBXZSB3aWxsIGxpa2VseSBuZWVkIHRvIHJlLWl0ZXJhdGUg
b3ZlciB0aGUgbGlzdCBvZiBwZGV2cyBhc3NpZ25lZCB0bw0KPj4+IHRoZSBkb21haW4gYW5kIGFz
c2VydCB0aGF0IHRoZSBwZGV2IGlzIHN0aWxsIGFzc2lnbmVkIHRvIHRoZSBzYW1lDQo+Pj4gZG9t
YWluLg0KPj4gU28sIGRvIHlvdSBtZWFuIGEgcGF0dGVybiBsaWtlIHRoZSBiZWxvdyBzaG91bGQg
YmUgdXNlZCBhdCBhbGwNCj4+IHBsYWNlcyB3aGVyZSB3ZSBuZWVkIHRvIGNhbGwgcHJvY2Vzc19w
ZW5kaW5nX3NvZnRpcnFzPw0KPj4NCj4+IHJlYWRfdW5sb2NrDQo+PiBwcm9jZXNzX3BlbmRpbmdf
c29mdGlycXMNCj4+IHJlYWRfbG9jaw0KPj4gcGRldiA9IHBjaV9nZXRfcGRldl9ieV9kb21haW4o
ZCwgc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldmZuKTsNCj4+IGlmICggcGRldiAmJiBwZGV2
LT52cGNpICYmIGlzX3RoZV9zYW1lX3ZwY2kocGRldi0+dnBjaSkgKQ0KPj4gPGNvbnRpbnVlIHBy
b2Nlc3Npbmc+DQo+IFNvbWV0aGluZyBhbG9uZyB0aG9zZSBsaW5lcy4gWW91IGxpa2VseSBuZWVk
IHRvIGNvbnRpbnVlIGl0ZXJhdGUgdXNpbmcNCj4gZm9yX2VhY2hfcGRldi4NCkhvdyBkbyB3ZSB0
ZWxsIGlmIHBkZXYtPnZwY2kgaXMgdGhlIHNhbWU/IEphbiBoYXMgYWxyZWFkeSBicm91Z2h0DQp0
aGlzIHF1ZXN0aW9uIGJlZm9yZSBbMV0gYW5kIEkgd2FzIGFib3V0IHRvIHVzZSBzb21lIElEIGZv
ciB0aGF0IHB1cnBvc2U6DQpwZGV2LT52cGNpLT5pZCA9IGQtPnZwY2lfaWQrKyBhbmQgdGhlbiB3
ZSB1c2UgcGRldi0+dnBjaS0+aWTCoCBmb3IgY2hlY2tzDQoNClRoYW5rIHlvdSwNCk9sZWtzYW5k
cg0KDQpbMV0gaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS94ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcvbXNnMTEzNzkwLmh0bWw=

