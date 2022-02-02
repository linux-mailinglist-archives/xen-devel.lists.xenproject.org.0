Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B434A7274
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 15:00:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264206.457222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGAC-00076l-Kw; Wed, 02 Feb 2022 13:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264206.457222; Wed, 02 Feb 2022 13:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGAC-00074q-Fx; Wed, 02 Feb 2022 13:59:12 +0000
Received: by outflank-mailman (input) for mailman id 264206;
 Wed, 02 Feb 2022 13:59:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFGAA-00074k-Qa
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 13:59:11 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49758a89-8430-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 14:59:09 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212DsA9g019609;
 Wed, 2 Feb 2022 13:59:04 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dyu8br0ku-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 13:59:04 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VE1PR03MB5869.eurprd03.prod.outlook.com (2603:10a6:803:10e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 13:58:57 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 13:58:57 +0000
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
X-Inumbo-ID: 49758a89-8430-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dchvt6cL95V1nsYX64sDT93HuCrsxPUX/Ub/+8seBPJG0VlaCTCn8SHn5oR25fquy78FGBBt/5sdqPPeTre/dPyWjJQSW0KHKXFOWz+2pRAtsGbEc4YFFORoAZ1Zvl9nGP555OFUIHk2df7GI0JBGhRsJOUnO/OCFPPXRtuZbgFvDMHKo9TnDZ5+SIwM4mx2pFFstG9GppwnpJTEzh+5f/Q1PGuCL6sQQvcZxrnGjEPhpSYFfVhGZ/1nVwKsKVb8q04j2Yg+pKHUKAityI8yZjYwNJqa0+sG+zCqlssyv3m6t+vjprDM8CIys7qLnpgbrTDPTJD+0Zc0tPPw8o+n0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEX7bMHqxQ/o97vtOjdKYBDo51tHiWvSXrPEGS91wVM=;
 b=IfRV8PJzBw0W0ZsAu1HYIK0AVe3YtxyomRMyZh3mpvlWpN0fkmaXZPKHnqIt/qyoWIM9KGcUJ6C03HTX68O8AW/DXMiLYM5PL7T6fTMgJqx/y5LHonUH+Apq+ln1Mw6Doq7vi1jvEJCXVg+dP95oj+2IRsmk9gTXdqFAhORgJY8c4Ry+kEAtcbnPq+KM2HRLlIp/EnAJFNaJ5L7OSdO73RDMxo8DipP2G0qu0ArDT7WEf1/9Sz4iO8X9fYMFpgmumZI3kq3KOaNFhsNFK9+Z4RPJSrYt/FwSbZiIQkxtT4uhv2OV0G430AHz2gJqmW0pHs1ZyRvBNl7dXiHxR7FcTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEX7bMHqxQ/o97vtOjdKYBDo51tHiWvSXrPEGS91wVM=;
 b=LIbH3RFFV5I0a8YYrj5A9TeCeQZRbpHoDMuWVmNDRyOlrFrhUZ4Q3k85r4B543EvmeWo14QQLlcbqDrmQn2mkclNnFCd4y8Ye1IANoJe13XSLBXP+A6edREIUG3lKetiPu8K4uqKCW+7qnlTYibggQ0pXqcB24UIHylJ313GJbAoICDcia2dGSpaKU7sYiQDhfYBQQuhRw2aj7JMeWOT/9s5zk+w95lum+qvwjKKTskKfxxFjnqF92DoHSTdXWDfuwPI6aL+0MeEH0IjlRz56J+bhtsRCUn9oKJoEdj9u0PbrtW1nUxtfsx2vTA8IzYxJn1jPbrdqB+eHu9P8Mx1Zg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 12/14] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v5 12/14] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Index: AQHX4ewLsn+7Z5q1aEWJccddnxyCV6xhK2cAgB+KygA=
Date: Wed, 2 Feb 2022 13:58:56 +0000
Message-ID: <41e2189e-b421-e6cb-42d7-6e3ec08e980e@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-13-andr2000@gmail.com>
 <YeAYgOIcBMjMeWU9@Air-de-Roger>
In-Reply-To: <YeAYgOIcBMjMeWU9@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f93ea099-3caa-4298-5180-08d9e6542828
x-ms-traffictypediagnostic: VE1PR03MB5869:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VE1PR03MB58693A1383670DDC18933444E7279@VE1PR03MB5869.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DTd7CmcjuGhfwuoBcpaU5/KMKSC83uTQ91+ZJejT+6RoEBNeQYAuWRgVgmSIqLsZst0y84rSDg+OVOf6oUSFzr+FtWf4MV7f/ofPQzELdl4Fq2ft5aoCmoXx1mm5bDdfrE5W59euaeVjLVLbtlgB8b2OTdS2gZGiNZXNSKKVlsHHM4RB/qczJgb2fXcY7+O0UVkTKHkDjmrMKKtY3XV0JS7S81XurPOxkiZl1Wm/n2oPoruuUBd8SB/Qh6LExJXthIchx5MtDsnzjUwLwIgVfie7n3cjz3m/NlD0AvYD2UTpOK8BvonhTHo9oE9sUdROcIh3ya/5Y2HV5/G81LoKa/OTjfNmzYG9itHP9sWdfnRKURw3w13s9G4gJ8FlbNNNAVYKSECRqSNYYjdP6z5VVpcgWwIc/DclkkmBl2W8U0W+TH5bW/edWAdxfgp2rtlZllRbeuSqc6KHN6SvL5pNZmW/m4HfubDkXPmFcIUGf/WiusD0EnPDTD2hnEv0eILrXo2VoBa8ZxeMCB/JQC+gquPCDGcRhhX1+5LviIvSW7/GHp/xonZL0YkVTRJVh8t4TDsdLa1XpWKJEqiZ9v1VNCrZUNKmmNPnMJFManr2WjpkAT/5DvLdq0mk6PEJJ9BtcPqYwbeYnw6hVdZytEfcFIBjpnotOZQhcxY7pT5meuhYGPc70pkO3ZWuuEEbACFehdvVBU8izdtj+jB/m0BpyjAj/SoDNA51UW7kaXVYZEwClfb9CAjTGtDDciCA5V2fnksnxw07vESlo4I86rvCVg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7416002)(71200400001)(26005)(186003)(122000001)(38100700002)(83380400001)(5660300002)(6506007)(31686004)(36756003)(2906002)(53546011)(86362001)(8676002)(4326008)(8936002)(2616005)(54906003)(66446008)(6916009)(66476007)(31696002)(66556008)(76116006)(64756008)(66946007)(6512007)(91956017)(316002)(508600001)(107886003)(38070700005)(6486002)(45980500001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ci9OazgyYmR6Y3psYTkwSGhObFkrSUtyc0NWKzZ1bnhUcSt5OStTMlExZEEy?=
 =?utf-8?B?bTZLdTQyWVJQMXFKSHgwVnhQVnY2dGJkaDQwTzFXdVJhUVc4a2k0bnpaaUlN?=
 =?utf-8?B?VjZ3MVBCaVJiUk9OWVZNdUhFS08yY3FJL0ZQMXlHM2hVSHhmZ1ZqekN2M1Nx?=
 =?utf-8?B?Q3FqdHdudkNsQmFiYXFGdkVBMmxzZ2NTWWtwZ2hTOHVuejRJa0ZxTDM1RkYx?=
 =?utf-8?B?OTNQSkM1ZENqYzg4ZVRrU0RIVHFreVlpRGprcWIrZjBvTHBVbXRoL1VzUXVj?=
 =?utf-8?B?TmJCYml2WjRDNm5qd0luYVhOVm8rRjc2Yk9wZkxQQU9BcWMwRkJDREFkaXBM?=
 =?utf-8?B?Y1RCUWNnZEc1MkJoZFNhU1QwYlBwNHpZMnVDR21JblB6a0VabXg2L1pMa2tY?=
 =?utf-8?B?YWRHV3Era1kyaEtDMm1DQjJCc2todURvT2MreUs2ZXhYZFZjSTJmcU92ekdo?=
 =?utf-8?B?azIxSWF2alB3Y0FlQTR6a0hiTVc1WCt4ZkJvSm5CMmthclRQSXYvNmF1US9N?=
 =?utf-8?B?S3o1U1dRQ3Z0UkJNZDVwOE92dEtxaTlWVlpyMkorMGw4aDE1VTVuSzlQenJW?=
 =?utf-8?B?emNrNm40L25JZVE5YTdyODJRWGJuVHhRMXJNakF4Um8vckdhbFA0RVNVQ0pa?=
 =?utf-8?B?M0d4QnFSRXVuc2NXbjAvK1dTTk5oY2NVUDRnT1ludkszcmNkQmlac2VVMUdn?=
 =?utf-8?B?ZmFBcm14ZnprdWhVTlNrOExnbGJrWXR1Rk5UeW5BQzdCT0s0c3RBaks3aTlw?=
 =?utf-8?B?aU1XZDArUWhTSFhPNGN3RW5yck5QOFN1a0FSR3BEaFpsRnNJYWdTVTlmamtt?=
 =?utf-8?B?bk41Zis1U050b3puQWlydGdGTnNlalk3TXppNVZnMFdzUTl1TnNESnJkdUhx?=
 =?utf-8?B?ekozbnE1eFpZQVVkMWdZOWIySXBnQk94TUl3aFZsVWl0VEJZQ2hyb3NBK1o2?=
 =?utf-8?B?WTZyMlJIQVZUOENvUDhWWGRKQnBvcnIyam4vMG11bDNxVlJSQlo5MCtKekhl?=
 =?utf-8?B?MGtkWXd6VVNTRVFBQ3pXNjB3NTNhQmpNYkorTU8yL1BhMEp4SmRUR0ppZm54?=
 =?utf-8?B?cHRJYnZZL1hndk5tSHkxL3kvTzJtejl0S0YvRmdUOU5KRERKWXJtc1JvM1E0?=
 =?utf-8?B?akJTQVFYL3lFZTFOc1pCaGk1RDYwTWZSeFhtZkZSSEs1MlBUUk9VMXFDOXBL?=
 =?utf-8?B?bXk1RFd5Zy9lWFhyTjV4ZWxJcGpjWEZRMG9ncGd0NmJQMkYyNkdTS3BobnA2?=
 =?utf-8?B?c2R2NndERXI1azlFRlQ5VHBDYUZ0SU1PM3Z4WXZYUW5IK1BBZnRSdkpmN083?=
 =?utf-8?B?cSs2THVlMHlpOENHNkNzYkZxUzRnakhRQ2RsZEVaR0R6aEtNL2E3eGFkRmZo?=
 =?utf-8?B?eVFjS21LQk5VY3JmeHFHQWJ1NXJVQ3N1bi8yYnBHQUUzdmJVc1Q4eG1xTmlJ?=
 =?utf-8?B?akE2WHBpVWd4VVg5anhrY2xLM3hKclFOMjViWEhycXduZ1FVbTUzVmlhZ0pU?=
 =?utf-8?B?V29zdzg0QkJUcnkzdTNteFkrNmMyVlkvTDVUUlEyYndOS29ETDZES284UFVF?=
 =?utf-8?B?SlpxNHlHVWVXODliRCtEdml2VVhWQ1dLR1NaUGtsSEFSaHBqTjhpbUtDRmVS?=
 =?utf-8?B?NHViYjZsWnVvWU1VMVBaZCt4dEhZUngwbG9LZG9DeXZ6OGtFU3M4bTJhSitj?=
 =?utf-8?B?RVJDMW5nby9jcmtQdWJCOEt2bXFpRUtEc3hjRnNEdGtwNGxlNWpaOWFJQUpi?=
 =?utf-8?B?Q3o4L1ZhYk8wVCs3OUdyejV4UmNYVUczeDg1bFYyQ1NLeFdDTVhXMnkrVGNa?=
 =?utf-8?B?NUVlUWhNZGk0T2tYVW5wYzNGUVhGS1FPVXpvTitodWdwbXJ2TWdXZ2NRejFr?=
 =?utf-8?B?NlVZemM2OFo0Q0ZFMzdxQnJWeE5semN5V1N1c2E5Y1hKaHJFRllrMkQ2SU5v?=
 =?utf-8?B?S3ZYcGlhU2VqeUlJcWtVVHRmL0tETU10aVpQbnM1ak56R1lNWFR6YTVjdHYy?=
 =?utf-8?B?Y3laNkM4NW8zMnBoM1NQeTdnMnZqVVZWOGhza0I4VXk5ZGJ5a1JtOC9nMWxX?=
 =?utf-8?B?UUZ0NlVtUjUybWorSk1mWkR2b00yaHJlbDYrMFpUeUozM2FQcThnZDA2eUt5?=
 =?utf-8?B?aVRXczVVelNPS09nMXB4R2lhNjZCdmZtTEdMbkVPS3c5U3YrTnhrOUVBU3hn?=
 =?utf-8?B?ckNRWTVMTnU2MFJQWU8wVnhMSndaek1sWjBJenE0ejJraWJqNmVQUitXUkNu?=
 =?utf-8?B?eDhRYms4K2pUcmRXKytBOUJwSnBZYzlGYWZvc3JDdGp1NXRtRmNVelVHSnZr?=
 =?utf-8?B?c3RtV3llYUg1RWYyWXBkYkJId25sV0NtYXdGY096TFQzcTBFS2NhZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <672BD0FDBC46C5408D5ECEFB5D911FFC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93ea099-3caa-4298-5180-08d9e6542828
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 13:58:56.8915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gw0/DVZm96XKWWk6E2V4lBnSJo05yyMeYgRCewMTqlnThzTx6Ic0HrWpTKJYp8OIB4haimTCoGpygZU8HVcE13LG2k76pFO8R8Fhe7U7RTgITsakiTuvQHeESuD3kadb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5869
X-Proofpoint-GUID: ocGucHB67hxXHIqAw46WcMdh1fks12ei
X-Proofpoint-ORIG-GUID: ocGucHB67hxXHIqAw46WcMdh1fks12ei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_06,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=986 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020077

SGksIFJvZ2VyIQ0KDQpPbiAxMy4wMS4yMiAxNDoxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBOb3YgMjUsIDIwMjEgYXQgMDE6MDI6NDlQTSArMDIwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gVGhlcmUgYXJlIHRocmVlICBv
cmlnaW5hdG9ycyBmb3IgdGhlIFBDSSBjb25maWd1cmF0aW9uIHNwYWNlIGFjY2VzczoNCj4+IDEu
IFRoZSBkb21haW4gdGhhdCBvd25zIHBoeXNpY2FsIGhvc3QgYnJpZGdlOiBNTUlPIGhhbmRsZXJz
IGFyZQ0KPj4gdGhlcmUgc28gd2UgY2FuIHVwZGF0ZSB2UENJIHJlZ2lzdGVyIGhhbmRsZXJzIHdp
dGggdGhlIHZhbHVlcw0KPj4gd3JpdHRlbiBieSB0aGUgaGFyZHdhcmUgZG9tYWluLCBlLmcuIHBo
eXNpY2FsIHZpZXcgb2YgdGhlIHJlZ2lzdGVycw0KPj4gdnMgZ3Vlc3QncyB2aWV3IG9uIHRoZSBj
b25maWd1cmF0aW9uIHNwYWNlLg0KPj4gMi4gR3Vlc3QgYWNjZXNzIHRvIHRoZSBwYXNzZWQgdGhy
b3VnaCBQQ0kgZGV2aWNlczogd2UgbmVlZCB0byBwcm9wZXJseQ0KPj4gbWFwIHZpcnR1YWwgYnVz
IHRvcG9sb2d5IHRvIHRoZSBwaHlzaWNhbCBvbmUsIGUuZy4gcGFzcyB0aGUgY29uZmlndXJhdGlv
bg0KPj4gc3BhY2UgYWNjZXNzIHRvIHRoZSBjb3JyZXNwb25kaW5nIHBoeXNpY2FsIGRldmljZXMu
DQo+PiAzLiBFbXVsYXRlZCBob3N0IFBDSSBicmlkZ2UgYWNjZXNzLiBJdCBkb2Vzbid0IGV4aXN0
IGluIHRoZSBwaHlzaWNhbA0KPj4gdG9wb2xvZ3ksIGUuZy4gaXQgY2FuJ3QgYmUgbWFwcGVkIHRv
IHNvbWUgcGh5c2ljYWwgaG9zdCBicmlkZ2UuDQo+PiBTbywgYWxsIGFjY2VzcyB0byB0aGUgaG9z
dCBicmlkZ2UgaXRzZWxmIG5lZWRzIHRvIGJlIHRyYXBwZWQgYW5kDQo+PiBlbXVsYXRlZC4NCj4g
SSdtIGtpbmQgb2YgbG9zdCBpbiB0aGlzIGNvbW1pdCBtZXNzYWdlLiBZb3UgYXJlIGp1c3QgYWRk
aW5nIGENCj4gdHJhbnNsYXRlIGZ1bmN0aW9uIGluIG9yZGVyIGZvciBkb21VcyB0byB0cmFuc2xh
dGUgZnJvbSB2aXJ0dWFsIFNCREYNCj4gdG8gdGhlIHBoeXNpY2FsIFNCREYgb2YgdGhlIGRldmlj
ZS4gSSByZWFsaXplIHlvdSBkbyB0aGF0IGJhc2VkIG9uDQo+IHdoZXRoZXIgJ2JyaWRnZScgaXMg
c2V0IG9yIG5vdCwgc28gSSBhc3N1bWUgdGhpcyBpcyBqdXN0IGEgd2F5IHRvDQo+IHNpZ25hbCB3
aGV0aGVyIHRoZSBkb21haW4gaXMgYSBoYXJkd2FyZSBkb21haW4gb3Igbm90LiBJZToNCj4gISFi
cmlkZ2UgPT0gaXNfaGFyZHdhcmVfZG9tYWluKHYtPmRvbWFpbikuDQpTaW1wbHkgcHV0OiB5ZXMN
Cj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJf
YW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+IC0tLQ0KPj4gU2luY2UgdjQ6DQo+PiAtIGluZGVu
dGF0aW9uIGZpeGVzDQo+PiAtIGNvbnN0aWZ5IHN0cnVjdCBkb21haW4NCj4+IC0gdXBkYXRlZCBj
b21taXQgbWVzc2FnZQ0KPj4gLSB1cGRhdGVzIHRvIHRoZSBuZXcgbG9ja2luZyBzY2hlbWUgKHBk
ZXYtPnZwY2lfbG9jaykNCj4+IFNpbmNlIHYzOg0KPj4gLSByZXZpc2l0IGxvY2tpbmcNCj4+IC0g
bW92ZSBjb2RlIHRvIHZwY2kuYw0KPj4gU2luY2UgdjI6DQo+PiAgIC0gcGFzcyBzdHJ1Y3QgZG9t
YWluIGluc3RlYWQgb2Ygc3RydWN0IHZjcHUNCj4+ICAgLSBjb25zdGlmeSBhcmd1bWVudHMgd2hl
cmUgcG9zc2libGUNCj4+ICAgLSBnYXRlIHJlbGV2YW50IGNvZGUgd2l0aCBDT05GSUdfSEFTX1ZQ
Q0lfR1VFU1RfU1VQUE9SVA0KPj4gTmV3IGluIHYyDQo+PiAtLS0NCj4+ICAgeGVuL2FyY2gvYXJt
L3ZwY2kuYyAgICAgfCAxOCArKysrKysrKysrKysrKysrKysNCj4+ICAgeGVuL2RyaXZlcnMvdnBj
aS92cGNpLmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgeGVuL2luY2x1
ZGUveGVuL3ZwY2kuaCAgfCAgMSArDQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9u
cygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdnBjaS5jIGIveGVuL2FyY2gv
YXJtL3ZwY2kuYw0KPj4gaW5kZXggOGU4MDFmMjc1ODc5Li4zZDEzNGY0MmQwN2UgMTAwNjQ0DQo+
PiAtLS0gYS94ZW4vYXJjaC9hcm0vdnBjaS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdnBjaS5j
DQo+PiBAQCAtNDEsNiArNDEsMTUgQEAgc3RhdGljIGludCB2cGNpX21taW9fcmVhZChzdHJ1Y3Qg
dmNwdSAqdiwgbW1pb19pbmZvX3QgKmluZm8sDQo+PiAgICAgICAvKiBkYXRhIGlzIG5lZWRlZCB0
byBwcmV2ZW50IGEgcG9pbnRlciBjYXN0IG9uIDMyYml0ICovDQo+PiAgICAgICB1bnNpZ25lZCBs
b25nIGRhdGE7DQo+PiAgIA0KPj4gKyNpZmRlZiBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9S
VA0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBGb3IgdGhlIHBhc3NlZCB0aHJvdWdoIGRldmljZXMg
d2UgbmVlZCB0byBtYXAgdGhlaXIgdmlydHVhbCBTQkRGDQo+PiArICAgICAqIHRvIHRoZSBwaHlz
aWNhbCBQQ0kgZGV2aWNlIGJlaW5nIHBhc3NlZCB0aHJvdWdoLg0KPj4gKyAgICAgKi8NCj4+ICsg
ICAgaWYgKCAhYnJpZGdlICYmICF2cGNpX3RyYW5zbGF0ZV92aXJ0dWFsX2RldmljZSh2LT5kb21h
aW4sICZzYmRmKSApDQo+PiArICAgICAgICByZXR1cm4gMTsNCj4gSSdtIHVuc3VyZSB3aGF0IHJl
dHVybmluZyAxIGltcGxpZXMgZm9yIEFybSBoZXJlLCBidXQgeW91IGxpa2VseSBuZWVkDQo+IHRv
IHNldCAnKnIgPSB+MHVsOycuDQpHb29kIGNhdGNoLCB3aWxsIGFkZA0KPg0KPj4gKyNlbmRpZg0K
Pj4gKw0KPj4gICAgICAgaWYgKCB2cGNpX2VjYW1fcmVhZChzYmRmLCBFQ0FNX1JFR19PRkZTRVQo
aW5mby0+Z3BhKSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgMVUgPDwgaW5mby0+ZGFi
dC5zaXplLCAmZGF0YSkgKQ0KPj4gICAgICAgew0KPj4gQEAgLTU5LDYgKzY4LDE1IEBAIHN0YXRp
YyBpbnQgdnBjaV9tbWlvX3dyaXRlKHN0cnVjdCB2Y3B1ICp2LCBtbWlvX2luZm9fdCAqaW5mbywN
Cj4+ICAgICAgIHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSA9IHA7DQo+PiAgICAgICBw
Y2lfc2JkZl90IHNiZGYgPSB2cGNpX3NiZGZfZnJvbV9ncGEoYnJpZGdlLCBpbmZvLT5ncGEpOw0K
Pj4gICANCj4+ICsjaWZkZWYgQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+ICsgICAg
LyoNCj4+ICsgICAgICogRm9yIHRoZSBwYXNzZWQgdGhyb3VnaCBkZXZpY2VzIHdlIG5lZWQgdG8g
bWFwIHRoZWlyIHZpcnR1YWwgU0JERg0KPj4gKyAgICAgKiB0byB0aGUgcGh5c2ljYWwgUENJIGRl
dmljZSBiZWluZyBwYXNzZWQgdGhyb3VnaC4NCj4+ICsgICAgICovDQo+PiArICAgIGlmICggIWJy
aWRnZSAmJiAhdnBjaV90cmFuc2xhdGVfdmlydHVhbF9kZXZpY2Uodi0+ZG9tYWluLCAmc2JkZikg
KQ0KPj4gKyAgICAgICAgcmV0dXJuIDE7DQo+PiArI2VuZGlmDQo+PiArDQo+PiAgICAgICByZXR1
cm4gdnBjaV9lY2FtX3dyaXRlKHNiZGYsIEVDQU1fUkVHX09GRlNFVChpbmZvLT5ncGEpLA0KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxVSA8PCBpbmZvLT5kYWJ0LnNpemUsIHIpOw0K
Pj4gICB9DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgYi94ZW4vZHJp
dmVycy92cGNpL3ZwY2kuYw0KPj4gaW5kZXggYzJmYjRkNGRiMjMzLi5iZGM4YzYzZjczZmEgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gKysrIGIveGVuL2RyaXZl
cnMvdnBjaS92cGNpLmMNCj4+IEBAIC0xOTUsNiArMTk1LDMzIEBAIHN0YXRpYyB2b2lkIHZwY2lf
cmVtb3ZlX3ZpcnR1YWxfZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsDQo+PiAgICAgICBwZGV2LT52
cGNpLT5ndWVzdF9zYmRmLnNiZGYgPSB+MDsNCj4+ICAgfQ0KPj4gICANCj4+ICsvKg0KPj4gKyAq
IEZpbmQgdGhlIHBoeXNpY2FsIGRldmljZSB3aGljaCBpcyBtYXBwZWQgdG8gdGhlIHZpcnR1YWwg
ZGV2aWNlDQo+PiArICogYW5kIHRyYW5zbGF0ZSB2aXJ0dWFsIFNCREYgdG8gdGhlIHBoeXNpY2Fs
IG9uZS4NCj4+ICsgKi8NCj4+ICtib29sIHZwY2lfdHJhbnNsYXRlX3ZpcnR1YWxfZGV2aWNlKGNv
bnN0IHN0cnVjdCBkb21haW4gKmQsIHBjaV9zYmRmX3QgKnNiZGYpDQo+PiArew0KPj4gKyAgICBz
dHJ1Y3QgcGNpX2RldiAqcGRldjsNCj4+ICsNCj4gSSB3b3VsZCBhZGQ6DQo+DQo+IEFTU0VSVCgh
aXNfaGFyZHdhcmVfZG9tYWluKGQpKTsNCj4NCj4gVG8gbWFrZSBzdXJlIHRoaXMgaXMgbm90IHVz
ZWQgZm9yIHRoZSBoYXJkd2FyZSBkb21haW4uDQpXaWxsIGFkZA0KPg0KPj4gKyAgICBmb3JfZWFj
aF9wZGV2KCBkLCBwZGV2ICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgYm9vbCBmb3VuZDsNCj4+
ICsNCj4+ICsgICAgICAgIHNwaW5fbG9jaygmcGRldi0+dnBjaV9sb2NrKTsNCj4+ICsgICAgICAg
IGZvdW5kID0gcGRldi0+dnBjaSAmJiAocGRldi0+dnBjaS0+Z3Vlc3Rfc2JkZi5zYmRmID09IHNi
ZGYtPnNiZGYpOw0KPj4gKyAgICAgICAgc3Bpbl91bmxvY2soJnBkZXYtPnZwY2lfbG9jayk7DQo+
PiArDQo+PiArICAgICAgICBpZiAoIGZvdW5kICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAg
ICAgICAvKiBSZXBsYWNlIGd1ZXN0IFNCREYgd2l0aCB0aGUgcGh5c2ljYWwgb25lLiAqLw0KPj4g
KyAgICAgICAgICAgICpzYmRmID0gcGRldi0+c2JkZjsNCj4+ICsgICAgICAgICAgICByZXR1cm4g
dHJ1ZTsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gZmFs
c2U7DQo+PiArfQ0KPj4gKw0KPj4gICAvKiBOb3RpZnkgdlBDSSB0aGF0IGRldmljZSBpcyBhc3Np
Z25lZCB0byBndWVzdC4gKi8NCj4+ICAgaW50IHZwY2lfYXNzaWduX2RldmljZShzdHJ1Y3QgZG9t
YWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgew0KPj4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3hlbi92cGNpLmggYi94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+PiBpbmRleCBl
NTI1OGJkN2NlOTAuLjIxZDc2OTI5MzkxZiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hl
bi92cGNpLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+IEBAIC0yODAsNiAr
MjgwLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHZwY2lfY2FuY2VsX3BlbmRpbmdfbG9ja2VkKHN0
cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAvKiBOb3RpZnkgdlBDSSB0aGF0IGRldmljZSBpcyBh
c3NpZ25lZC9kZS1hc3NpZ25lZCB0by9mcm9tIGd1ZXN0LiAqLw0KPj4gICBpbnQgdnBjaV9hc3Np
Z25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+ICAg
aW50IHZwY2lfZGVhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwY2lfZGV2
ICpwZGV2KTsNCj4+ICtib29sIHZwY2lfdHJhbnNsYXRlX3ZpcnR1YWxfZGV2aWNlKGNvbnN0IHN0
cnVjdCBkb21haW4gKmQsIHBjaV9zYmRmX3QgKnNiZGYpOw0KPj4gICAjZWxzZQ0KPj4gICBzdGF0
aWMgaW5saW5lIGludCB2cGNpX2Fzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0
IHBjaV9kZXYgKnBkZXYpDQo+PiAgIHsNCj4gSWYgeW91IGFkZCBhIGR1bW15IHZwY2lfdHJhbnNs
YXRlX3ZpcnR1YWxfZGV2aWNlIGhlbHBlciB0aGF0IHJldHVybnMNCj4gZmFsc2UgdW5jb25kaXRp
b25hbGx5IGhlcmUgeW91IGNvdWxkIGRyb3AgdGhlICNpZmRlZnMgaW4gYXJtL3ZwY2kuYw0KPiBB
RkFJQ1QuDQpXaWxsIHRyeSB0byBkbyBzbw0KPg0KPiBUaGFua3MsIFJvZ2VyLg0KVGhhbmsgeW91
LA0KT2xla3NhbmRy

