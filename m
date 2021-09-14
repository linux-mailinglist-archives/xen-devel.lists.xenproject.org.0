Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A51540AFFD
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 15:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186760.335523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ8vn-0003ZL-Cq; Tue, 14 Sep 2021 13:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186760.335523; Tue, 14 Sep 2021 13:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ8vn-0003Vv-7c; Tue, 14 Sep 2021 13:57:03 +0000
Received: by outflank-mailman (input) for mailman id 186760;
 Tue, 14 Sep 2021 13:57:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pQww=OE=epam.com=prvs=98919bdb76=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mQ8nN-0007XF-S7
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 13:48:22 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f259fc8-bb5d-42f2-b1bf-0603caf6fecb;
 Tue, 14 Sep 2021 13:47:56 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18ECrhTg015245; 
 Tue, 14 Sep 2021 13:47:53 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b2sbn8vcj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 13:47:53 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3715.eurprd03.prod.outlook.com (2603:10a6:208:43::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 13:47:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 13:47:46 +0000
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
X-Inumbo-ID: 1f259fc8-bb5d-42f2-b1bf-0603caf6fecb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HC1XQFKpSH9tYWMISbPCt1iGPDtED/RS6Q1TBwq3Z78PGSEyheYDu0kj/JjlEzIrrrLWWjusDNtxozqJF7R7sVwLDUCNTf5on28KBL/PwLYfgZgrilWNL3/7j7XmI780q6N2YW6Q2fqPoDVrvlugJKgkgIal4YBi4gzMaD5iXPWYcHJO0y2awhVLLi0tH7k8/IwQvMc1MgZ9ou4/B2yF/QW+PogYvqn4cfosP8NN//wiis3QicKh80jbMrsjnIjXOfT3oFXqpj2haOL83jnzW3TUvddTQf2HSlAEqlaVQ/nVkf3F80PEKsRW2cEeLVvy2i2mztTMSN+GVgztgY+p3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OlQJl4qkgARb6YazDMBXh0b5AfvGQIxurXlJnPkf7M0=;
 b=FVls4KvVt5nCbOIFo6nuSI1JDcCW/OmqcZ1pdb/8nND77oIg4kVUVsPB4utYV2ScN5N2lwkN5nQNnSLoPVkGhCTPPIPN+37CkQYngQ4987xDkBhIor9Vb3O7CcJrI05kEk/xJiPdz/6oniJogNsCp1h0S12zfNUnF+TT+FSaxVisPUoW8YcQezwDLxoRwFUNegtO2XKzyudQbxeXwjoJUDewqlti+jDEh8qGQEU49ZD8t5ljGkbE34mlZx0FkOt06wtg1zxxyvc9iza1Ioxf20jpBmhFv5RNA4NqrVKqTZ7NdIWeR4NiKXEjMvHDxAd834EPq2FMpcol9A1cMjUt7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlQJl4qkgARb6YazDMBXh0b5AfvGQIxurXlJnPkf7M0=;
 b=0GXfrMqW/Y8eR3rrKEzj4VIhbz504WCs+Jh0taemdWQZi9S4zH3di2HNTibBHhhC26rYJSlqimEl+GoIxto+8HHCvNVtMKpVQ/OJFTYsf7iUvZsghXT8etGTcJIcG4hk70cmaOaSkZWufw9AxNsPHKm/SyPV1a6tKFAmGgMSkNANNtcIVO6KmOfiIBj23BRXpp3vpUyJ5zisGoy9jYykKTxsnLw9fxVqDIkLmhXJ03gdqsUNEUAlXgVFZYuD3lM/JdBpkGkFjbkQwkf9UvpaMxoW6/14fpVVQB1JoK3pbsVqjh0++RcLr4o+fS09Q/B3AolpNcYD5Mvg7cSiKrLO8Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: 
 AQHXoJ6eIuPEzuAZLUmx1GA90MGEBKucAxCAgAEt4ACAABanAIAAAwIAgAABgYCAAAHPAIAAAcgAgAABzYCABkt1gA==
Date: Tue, 14 Sep 2021 13:47:46 +0000
Message-ID: <a4343670-2d9a-cec2-f093-aa3b0a5e0657@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-10-andr2000@gmail.com>
 <247bd41c-98e6-f898-8216-e36b22158636@xen.org>
 <8db7ab42-d361-5b20-c648-7af9d0cdaad9@epam.com>
 <d7ecd474-fe0a-2bca-717e-cb82c89358ea@xen.org>
 <ad8ef71c-a834-daff-7ad8-b7c3f718a3e2@epam.com>
 <6810eefb-b6d0-9557-7bdd-80ac381e467b@xen.org>
 <7263f268-7f90-e561-4679-f78185c88cd8@epam.com>
 <0eb861db-eaf4-0919-4f54-64f448f1cdfe@xen.org>
 <52da7955-ead7-f404-6e51-7d1ee7bc3142@epam.com>
In-Reply-To: <52da7955-ead7-f404-6e51-7d1ee7bc3142@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbbfd751-a326-4b07-0e7e-08d977863be0
x-ms-traffictypediagnostic: AM0PR03MB3715:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB37159DBD13BA4EC5718E48B5E7DA9@AM0PR03MB3715.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jdxEoQif0vZzQ42w1kkKgWQpUavAOx4eCT+K/33FEo/RllGt4TcU0ePiXNNSJHlEypSEXfjNEOHdWjjozNPfrnXT9T5/0XRn/tsHaP/pyDxew0aSvDnzGL8KYv27HX+WdkgjcncHj4v4lzBNAwmx1o2ZzXkFByAhE/s+ELBE4Emy5q+20XEZHNiQzqdufW31YqcGVgi/WpaZAhKG5ACMqCNUJPtVf06/zMibnKWvsZ4mA2MhYom3DXGrNAjlGjtW7TsknJVfd8T1X4IavNv94dH5rOyLySlt/cKeB1pqngluOsRkv4wtAAqKCoPxHtc82f5YB1K5op1qp28aFj8uDsxBe+KfuicozEX4VEFvsXhwygpWuBDkkrPF3oEq4UxHFiZo77VtO2xh6unZGwY1Xz7/eOj5TLFgX5vv2/DS+LY5nTfEHYLn9YBnlJD7TArTlN8gM7dWek9h21/l5upmOiOTQkubOAbSb9x7hgboJAflmKWR/cx+yCLNaEOLGRWnvLjQ6D6f4G5hgR9FhKfmLNihfwmXeJeDcmQFRJPG4NIXfKYXGqKIwBDdT444dZA3HRr1eP3WzapZUQiuEqt8mY55XKuWER8QzJ5nBhK6IRqTi/wOUuQI4xr76pTt+f7a1ASYybslxWwdZcmPp4BAQcQQaXpaQMqGlSIlT+eBIla1usf/gbgOxUU1Xuw+HspHZqPMaPWBF+8TxA+bQHqCCq7wAFE4P+lQ1RZtZlJlg1lWtjQe7cF7gxlmzVjeP+jd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(110136005)(5660300002)(54906003)(6512007)(4326008)(316002)(2906002)(186003)(2616005)(31686004)(38070700005)(478600001)(83380400001)(36756003)(122000001)(8676002)(76116006)(66476007)(8936002)(66556008)(66446008)(64756008)(71200400001)(6486002)(66946007)(86362001)(31696002)(26005)(91956017)(55236004)(38100700002)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R0srMlB1MGRpTjNRMGdOait4Q2JPSmVnNzZWYmxqTmpxV2ZhcGpZTWdtVFpp?=
 =?utf-8?B?TmpEL0pId3EreHcvTzBuYVlMT3IvdTV6MnF6SGxYOUdPbEJudHJ2aE5BZkJt?=
 =?utf-8?B?emFBcVA3eFhPVDQ1NlhmeFlWdE9PeFE1YUNEZkdueEZLZVhzVW0zb2ZkUFk2?=
 =?utf-8?B?ZjQ3cjhKNHh2aWkySG5Ic3VwamNiMDRzSHU0OWtyTXlJSG5rY0tJK0dNYWJT?=
 =?utf-8?B?Rm5nTExPcHFMQnp0cUpUMXVvU1hwRE9tcXd6dHRWakxtTVhId09yUnRCS3Ux?=
 =?utf-8?B?K1R1cmRPbDN6UkMwSGF4V0Q0QkhpbS9qQnc1YTFUV2VpQy92S1c0TkV5QkQ3?=
 =?utf-8?B?M1hpS3ZhM2JBOHZWaEVmbkMrWElMRHl4Y0JyTm42T1piODJBbXg4SldVNGZU?=
 =?utf-8?B?aS8xOEt5U0I4ZDJsY0VJaFp2N0FMU2tpMnhwTlE1ZE9kMWJ3azJrc3d6Ylp3?=
 =?utf-8?B?VWRYVzZqV1pVYll3eHZ6S1NXQmRpNHhiSGc2ZGhUT3dlczB1dEYvY1N0OEM2?=
 =?utf-8?B?cURJSnRtTW56aEhCd0twS0FwUG5PUWZVY2xqejNsd3BqMDFkN255Ulp6Qjc1?=
 =?utf-8?B?bDh5SENyclpiOWt4K2w3ZUtVSlpxYXFSR043cmYxLzBQazdoamRyQnd0dVdz?=
 =?utf-8?B?MDhPenZGYmNDWnNhMmVBMFZGajNjbkZNTGdvOEJDVVpFRFlPWnNZeGhQSGsy?=
 =?utf-8?B?T05acEVaYTNRQUtnR0N5cUZBeFZFVnFkK2h3a2x0YUIvczJScEM1MlRFL2lY?=
 =?utf-8?B?ZWpPWW40SXVzL0VtU0JyRUxQSlk5TXhlc3NUTi9LNUJUNDBTaGdKamZZdHh5?=
 =?utf-8?B?SjZEaUkxVktEd252cVVscHo5RGZ1d3ZzUlJndm03ZFp1aHJ3eDFpY0tCTWFs?=
 =?utf-8?B?bkJmc3FNWlgzSEZsdlF5ZlFlUkZzR3U3VjhSS1cxNlpzc2w4ZWxPWitzOC9S?=
 =?utf-8?B?ejNWdGU5K085WVpXRlhDZndveWJKUmMyV2VQTklxa2dGbTVaRjh2Rmw3NGJW?=
 =?utf-8?B?QkpTUmhpWTVQT1NIcExKZzJRSUg0TFhlUEdLZmhkQnFST1pVSXUvZFNQUThR?=
 =?utf-8?B?ZW8xUTY3VlQwNDdPN050SzlzYkRHM0FFcm5lckt2dExDS1VzbzVvQ05SOWhz?=
 =?utf-8?B?dGU4VXYyL3U0VVpBT0hwWnRVaTUycHV3QURNUGRvYlZHZjZYMGt3eEtveUl1?=
 =?utf-8?B?d25Ib2l6STk3Sm1ia1h5Q3ZlZ28vTXZpNWlOWHNEcnd6Um12djIwdTgrU3RR?=
 =?utf-8?B?aXJPZnNPc1k0K0xCazlJancyZ3FZTzlZNHZSdHF3SUp6eHY1UzZLd25xOXJ1?=
 =?utf-8?B?V1lRcG1vQUw1eUZ4Wi9JcGFiM3UwRC9SSWk3R3RLRVNsMU1YRGpQbXJ4RGtD?=
 =?utf-8?B?VWx0UldjbUlhMmI0UVEwNlRsUGkySnV4YVZIQjB3VU05N0kyYXROcUN1ekZR?=
 =?utf-8?B?K1h2N2NEZHBJVXhiTk40V0p2VURRSzZMdm1SSHNBRnBPekhheXBTaU13c3Vx?=
 =?utf-8?B?UlNDazFnSEVNbmJhcGRBNmJzWXpxS01qdStpL1ZHbjV0aGh6eUdFV1dpOGdK?=
 =?utf-8?B?clhaQWY4SUVUM2xCQXRkd05xMEY2N0xYaXlOTTJXSFhxeVV4QWpmREIzOG5h?=
 =?utf-8?B?L0sxaDJHTHh1ekhHOHZqRHNKZERmb3lGV3JTVDZ3Z2dGVXBhVE84ckJVQ0Ny?=
 =?utf-8?B?dU9DN0pYc2JaTDlWdHR6YStKbjNSZjduSVkvTUFjUStNRUVONElBRlpBbVJJ?=
 =?utf-8?B?U1VIdGFpWkp3RUwrSi9Wa2ZqcFE0SzR4cks2Sk91QUZQUHlzM0V3OXJEd2RM?=
 =?utf-8?B?ZlBLRE5qTXBIbmpDVmEwZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C67697F451F1824AB8EB18EE6F3A578D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbfd751-a326-4b07-0e7e-08d977863be0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2021 13:47:46.2024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gjH7mrJgDW03tToE5WOsW4u+mV+a6srzEKV5/84p0QovFBmvnlqmZEHsXDsh3raEuoBViqor6+KzUPrt0GBppGJFdksdNAW6mnt15MJHajpwI+YiVs6uFiq4vxaBW9St
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3715
X-Proofpoint-ORIG-GUID: -I5pmvBhh9NKO4VMjLOMUCPacGLE65HU
X-Proofpoint-GUID: -I5pmvBhh9NKO4VMjLOMUCPacGLE65HU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-14_03,2021-09-14_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 adultscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109140086

DQo+PiBXaGF0IHlvdSB3YW50IHRvIGtub3cgaWYgaG93IG1hbnkgdGltZXMgcmVnaXN0ZXJfbW1p
b19oYW5kbGVyKCkgd2lsbCBiZSBjYWxsZWQgZnJvbSBkb21haW5fdnBjaV9pbml0KCkuDQo+Pg0K
Pj4gWW91IGludHJvZHVjZWQgYSBmdW5jdGlvbiBwY2lfaG9zdF9pdGVyYXRlX2JyaWRnZXMoKSB0
aGF0IHdpbGwgd2FsayBvdmVyIHRoZSBicmlkZ2VzIGFuZCB0aGVuIGNhbGwgdGhlIGNhbGxiYWNr
IHZwY2lfc2V0dXBfbW1pb19oYW5kbGVyKCkuIFNvIHlvdSBjb3VsZCBpbnRyb2R1Y2UgYSBuZXcg
Y2FsbGJhY2sgdGhhdCB3aWxsIHJldHVybiAxIGlmIGJyaWRnZS0+b3BzLT5yZWdpc3Rlcl9tbWlv
X2hhbmRsZXIgaXMgbm90IE5VTEwgb3IgMC4NCj4NCj4gT2ssIGNsZWFyLiBTb21ldGhpbmcgbGlr
ZToNCj4NCj4gwqDCoMKgIGlmICggKHJjID0gZG9tYWluX3ZnaWNfcmVnaXN0ZXIoZCwgJmNvdW50
KSkgIT0gMCApDQo+IMKgwqDCoMKgwqDCoMKgIGdvdG8gZmFpbDsNCj4NCj4gwqDCoMKgICpmaW5k
IG91dCBob3cgbWFueSBicmlkZ2VzIGFuZCB1cGRhdGUgY291bnQqDQo+DQo+DQo+IMKgwqDCoCBp
ZiAoIChyYyA9IGRvbWFpbl9pb19pbml0KGQsIGNvdW50ICsgTUFYX0lPX0hBTkRMRVIpKSAhPSAw
ICkNCj4gwqDCoMKgwqDCoMKgwqAgZ290byBmYWlsOw0KPg0KSSBoYXZlIHRoZSBmb2xsb3dpbmcg
Y29kZSBub3c6DQoNCmludCBkb21haW5fdnBjaV9nZXRfbnVtX21taW9faGFuZGxlcnMoc3RydWN0
IGRvbWFpbiAqZCkNCnsNCiDCoMKgwqAgaW50IGNvdW50Ow0KDQogwqDCoMKgIGlmICggaXNfaGFy
ZHdhcmVfZG9tYWluKGQpICkNCiDCoMKgwqDCoMKgwqDCoCAvKiBGb3IgZWFjaCBQQ0kgaG9zdCBi
cmlkZ2UncyBjb25maWd1cmF0aW9uIHNwYWNlLiAqLw0KIMKgwqDCoMKgwqDCoMKgIGNvdW50ICs9
IHBjaV9ob3N0X2dldF9udW1fYnJpZGdlcygpOw0KIMKgwqDCoCBlbHNlDQogwqDCoMKgwqDCoMKg
wqAgLyoNCiDCoMKgwqDCoMKgwqDCoMKgICogVlBDSV9NU0lYX01FTV9OVU0gaGFuZGxlcnMgZm9y
IE1TSS1YIHRhYmxlcyBwZXIgZWFjaCBQQ0kgZGV2aWNlDQogwqDCoMKgwqDCoMKgwqDCoCAqIGJl
aW5nIHBhc3NlZCB0aHJvdWdoLiBNYXhpbXVtIG51bWJlciBvZiBzdXBwb3J0ZWQgZGV2aWNlcw0K
IMKgwqDCoMKgwqDCoMKgwqAgKiBpcyAzMiBhcyB2aXJ0dWFsIGJ1cyB0b3BvbG9neSBlbXVsYXRl
cyB0aGUgZGV2aWNlcyBhcyBlbWJlZGRlZA0KIMKgwqDCoMKgwqDCoMKgwqAgKiBlbmRwb2ludHMu
DQogwqDCoMKgwqDCoMKgwqDCoCAqICsxIGZvciBhIHNpbmdsZSBlbXVsYXRlZCBob3N0IGJyaWRn
ZSdzIGNvbmZpZ3VyYXRpb24gc3BhY2UuICovDQogwqDCoMKgwqDCoMKgwqAgY291bnQgPSBWUENJ
X01TSVhfTUVNX05VTSAqIDMyICsgMTsNCiDCoMKgwqAgcmV0dXJuIGNvdW50Ow0KfQ0KDQpQbGVh
c2Ugbm90ZSB0aGF0IHdlIGNhbm5vdCB0ZWxsIGhvdyBtYW55IFBDSWUgZGV2aWNlcyBhcmUgZ29p
bmcgdG8gYmUgcGFzc2VkIHRocm91Z2gNCg0KU28sIHdvcnN0IGNhc2UgZm9yIERvbVUgaXMgZ29p
bmcgdG8gYmUgNjUgdG8gd2hhdCB3ZSBhbHJlYWR5IGhhdmUuLi4NCg0KVGhpcyBzb3VuZHMgc2Nh
cnkgYSBiaXQgYXMgbW9zdCBwcm9iYWJseSB3ZSB3b24ndCBwYXNzIHRocm91Z2ggMzIgZGV2aWNl
cyBtb3N0IG9mIHRoZQ0KDQp0aW1lLCBidXQgd2lsbCBtYWtlIGQtPmFyY2gudm1taW8uaGFuZGxl
cnMgYWxtb3N0IDQgdGltZXMgYmlnZ2VyIHRoZW4gaXQgaXMgbm93Lg0KDQpUaGlzIG1heSBoYXZl
IGluZmx1ZW5jZSBvbiB0aGUgTU1JTyBoYW5kbGVycyBwZXJmb3JtYW5jZS4uLg0KDQpUaGFua3Ms
DQoNCk9sZWtzYW5kcg0K

