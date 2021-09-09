Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4E94044EB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 07:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182607.330243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOCW6-0005aK-VX; Thu, 09 Sep 2021 05:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182607.330243; Thu, 09 Sep 2021 05:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOCW6-0005YD-SX; Thu, 09 Sep 2021 05:22:30 +0000
Received: by outflank-mailman (input) for mailman id 182607;
 Thu, 09 Sep 2021 05:22:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6so6=N7=epam.com=prvs=9886dc581d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOCW5-0005Y7-LW
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 05:22:29 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebe9952d-112d-11ec-b19e-12813bfff9fa;
 Thu, 09 Sep 2021 05:22:28 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1894nBsA001003; 
 Thu, 9 Sep 2021 05:22:25 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0b-0039f301.pphosted.com with ESMTP id 3aybjtr3u6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 05:22:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6323.eurprd03.prod.outlook.com (2603:10a6:20b:159::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Thu, 9 Sep
 2021 05:22:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 05:22:22 +0000
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
X-Inumbo-ID: ebe9952d-112d-11ec-b19e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3b0cn+IQ58ZtPw9WRhT9ASaEC4BGzJbhCWHERtHLjH6oPDFaoRg3vNsD5leiFcHVjBTA3hBfVSqK2T8uDja04YSXqsyNrakAuYOa6w5mY8szEs4aAweFLhJVej7Bo1kFXqnpnz79PdL4DQBWuTbkDwRLbNlRz3QzkNg6cTXYbXnt16uypgVYzZGkK7YDx+nS7Wnx9dFVBb6eFFssECs/W0TBZkJzv9h+xgJTOTICN6hLS8lGXkF3FigKk+yB20x0P70gnOoRlfG9J0bpResa2g+QK0Tv3tJb+dvMSHRgTrPmAOV7yKlI+ZUfjF8DUECl5i/vyETFON7vu7i8CGm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+CwpRiGSJLLP1t+op9L5h6wdjH0oQcj9ympwW45/GcM=;
 b=Fu/zpACr55ERa+RnrV9oq206mNQHrRv1IXYgaIW861ni5QKFUq10UeOkGoP1m2pnPMfmC2TyqOlKtSZiICSa3iFLri+/QU8/MFn4R86SdbXoh8CiC5FRhsIJBtPCgwcMVDDtO608A7y8Ing2y/JYYBAA4kn/HaQsHepknh14Q2zd67QrVpwTc+kE3LhUy9aiNcT8rzN8DMdXrSWV9S9jB5gis+E6ZE4CmSdxOkaeS5gkTwWglhpSQBMt+7Bj+tCW5IPGIYQt2A/pGIsmHUIwBIq+Lst6FM/GpfX5c3SHFdsbfubYv06BR/P7L3DAJFWVCEkOfe8R2w0yA1PvmpVWZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CwpRiGSJLLP1t+op9L5h6wdjH0oQcj9ympwW45/GcM=;
 b=bbVXaonU0AZMeYXY2BVftx+O9W2SoL4DHL4ChUFLGyl8nSzPcNTg64yCxy87QSTg8Tw/PnxPNZWhK1hVzncF00NDFHjKyP0jUCU1PK1vVMu563xT2mx4ChqInOGYrsVqnYjkQkyMPmLRu9WwcjMyPOocwR36iW9Dix9HBdR0Q6zzZVsWRbV+8ywpAccLr4PPaQQQJlfGFlNMqM7vu3qG6pZW47CO4ya9a1nO4OZQqO1s2XZjkDcMptRAkrtrcy3hjXGUTRdG7FbBRDBTFHDp/93ragrbmnOS2Xj8I6bNDzf6CQmtCeIxYJ8Ng6+Krhe8xZmmV98t+Rj7guVyjh2BHg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 6/9] vpci/header: Handle p2m range sets per BAR
Thread-Topic: [PATCH 6/9] vpci/header: Handle p2m range sets per BAR
Thread-Index: AQHXoKxjXfke7B20QEeo6YjlfUMhlquXGvYAgAMgDgCAAAg4gIAA8L+A
Date: Thu, 9 Sep 2021 05:22:21 +0000
Message-ID: <206c7b6c-6c0f-ce5e-6e62-15b46035b036@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-7-andr2000@gmail.com>
 <1fb1223e-005d-dc78-cd34-dc97191b316e@suse.com>
 <ba644629-a251-4865-8a7a-075392b9dffe@epam.com>
 <7e0c9d9b-6087-83ef-f9e8-1e9e6eb2d1e9@suse.com>
In-Reply-To: <7e0c9d9b-6087-83ef-f9e8-1e9e6eb2d1e9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c14ad79-4399-4da2-41c7-08d97351cd25
x-ms-traffictypediagnostic: AM0PR03MB6323:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6323BADB023AE517F7747D60E7D59@AM0PR03MB6323.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BM8U3GqiPCxeDoYG7dphId1HpHcM0ThNJT8YsQE21gY2agboMVWKbyASP6CfgeY8BFBQ3tePXH7C6TB7CTD5TkxAKLbccTh6adpzMblSEyGXmRleZWXe0e/FteRJXim7whc0kqcF7SfgGN1601yf9CJ8aEMA5xcuNmwbPd4veObc04V87j/Y07R8MqmwCjShHq9dY29lwEQEEIRTf5Ooi9fcZBnZmVn6V09SKfVknOp1KRxZNTS/xTRYsvvPaUUVHZcpSyR6a52TvQC6Gg0kMjmE6I1pRFPbpHpkLHxl9L6TtK6r9wRA/HuhxPbxysY3EpD5gA/xJeo5OQVHgjNjT4iufES9hgr2bdWNCMvUOKi9+wT+OdTi7m1T0iW8p6k3GtKBnX7e9Of1cdafrRCUc1Bwfz4jLinV5iN+rn8BYbZckhOogf4LtFOvTzZYQgNPtCYHA2C7dTRR8UAQjucAMNtBSRRUBBlMKNtvQ3WKbLiVf27EgttC+q7NUnB0gjytgrhZBttFy2ykaafnth3+IkHIc/ows0g4IyLT9zwwh2vUfm3POv4n8ZlvpJxeipdL4Jdn8fcMWkPoEbezhHRTQ4eu9uVCoIhg/L9BKh840fIpaVoiDwfLKukDqmdap9mBHyTbkawkDyD5e1chkIN19OmdwV3Sinas+RkkXaXRozcX7GgvXG5KbvuKwyE+sJ+dNDEEGSUfHYKoTP//f5uugDmZqF+u3jm4xfnsTt7BbxidcvNcApuLbJ73IHGOCt/Z
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(38100700002)(6512007)(4326008)(316002)(110136005)(54906003)(31696002)(83380400001)(26005)(122000001)(38070700005)(186003)(66446008)(76116006)(64756008)(86362001)(53546011)(66476007)(66556008)(6506007)(91956017)(2906002)(36756003)(2616005)(66946007)(31686004)(8936002)(6486002)(71200400001)(5660300002)(8676002)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YTE4YzhxNW03d3lKN3g5UUtaTTUrTUFUcDBrUm0rc2V1UFl5eERPQVdwVzd5?=
 =?utf-8?B?bXVIRm8vK1I1c295UUdHTjNxdDI0Yll4L1huMlpPQ0FpUUtOUC95N3ZYdzRp?=
 =?utf-8?B?SzVjNWtRV1hhajRGdkIwZXpXckZEczFvOGh5Y1VWc2UyalpMVmtodlJIem1r?=
 =?utf-8?B?V0ZFWkNSc3BVOTkvNkFKaW9qZ3lTODdJYzVXazVlNUNpanFVK3ZRdmV5cG50?=
 =?utf-8?B?amxyUG8wZEpTUk1OSUNMVERJd0hIeTJOd2lGakJIK2IzNGhoRTR2dElPcysw?=
 =?utf-8?B?ZHVpM2FwbFdCZDRja0o3cXV4NGtPd2dIQVZ4UDZSMjFPbzdXaG9BbFZkYUI5?=
 =?utf-8?B?S3lSR29mZk14U005dXkrOURuUzlvMXFJTkxiVlRhbTJ3Q2cvYW9KWUVjcm8x?=
 =?utf-8?B?U3AvZDZWeVEwMHJaUjBoazRYWlpOOFl0RlV3QTNjQjZTM2RnTTV6bDRjMXJI?=
 =?utf-8?B?WjlPdUNCQkhtSnRvTEN4dy9KT0JhSVR1U25LWFVYWkowY1ZjY3h0dEx5M2Yw?=
 =?utf-8?B?dW5oM0J2ZUtNSFVhZU94LzJzZXFjc1RGYUJjbS9IQnEzVEduWXprSzNqNitM?=
 =?utf-8?B?bWFIMGdSVTZIQ0Ftd09FNVdtZ1dDSnBPTERPaXIzWGhOOURublVMT3FOd1Qy?=
 =?utf-8?B?NnhQUzZ1YXNiNHVnelkybFVKWUt6NHc0OGxGTjhaTURwNmt6MGJFbExIb1Z3?=
 =?utf-8?B?MFlMajJOKy9QYzVsdEx2QndOQ0NtUVNCQXYwTXJVd0dPSVR5Q1FpUDlEN2p2?=
 =?utf-8?B?R01uR1NOMVdhd3VYbHR4RGNaK2ZjT0VVb3MySUk2YTllNlFheElIcVQrdUpt?=
 =?utf-8?B?ZWd0aFFVTUhrWi9jdzN0enZLS3RTbE5rRE1qeXBOa0gxUlM4SmozTFVyekVl?=
 =?utf-8?B?TUhRZHBGWU04UHBjV0FnNGZYcFpHZEY5NGtvN2w5TmNKK1VndDBCSzNpWVJu?=
 =?utf-8?B?Uk0rQzVhVUlabEIwa24xeXpVclpCUUtmMEwremduVllIRlRua1hFS1FMbk1a?=
 =?utf-8?B?NmhYcStZbzFjM2xaREdQNWc4YklsNFdGcUdkVG5pY2Z5V0RjOUxoeWE3c0tv?=
 =?utf-8?B?NW1QTUtlWVVPN0RFZisya2k3cTNCeDhXUnh2NmpWOTlOampCWERycHZCVnRJ?=
 =?utf-8?B?NExXYzhNbjFCdDlnR0txeUZTK0hTS3VIVVRjZjBjR2NBRmxVTU5VSm1peDRi?=
 =?utf-8?B?RUQzQ3BLMFl1SjNuVDVjb3pFa1NuWjFPS2JzMDNNL1dYbE1wY1ZMMVBKVjNV?=
 =?utf-8?B?ckFDcUkwU3gyRzdZaENVQldXay82SnZ5MnFOSEM2SjlXcTVDcXloNitiTXBt?=
 =?utf-8?B?Rkl3NC8wNHRIdmFzbUI4aStkZDZTd05ranFVcnNhQW5wQ3h2ejZWaEVQd0ZB?=
 =?utf-8?B?SkFiWktqWGlsTWRhVXZRYlZRcFllaVhTbC81cllZV3VJWG1pZjdYWFZKTzBX?=
 =?utf-8?B?aTJkcHBPcnBDQU1TTlRyMFp4ZmxlcHlDYlVIRGltNzZGQVI2Q21XR3V6RERT?=
 =?utf-8?B?YllPT1VGWE50QlhxYW5RaWVlcndSVVdRS1d1OUtSTlNyQ1JOY0xFZlNDbzJJ?=
 =?utf-8?B?TUhhZFNFUEd3cHBEQ20yU1Vjb1BrL2w2MGVRTEdjNG5lS1RwOUtnOGZIUzdE?=
 =?utf-8?B?TUNjR2VieFJGOHFtVWtJNk9qOHFwazFYaWVrSHBEaXdwSWs4c3ZvbzNtbzJP?=
 =?utf-8?B?clR0UGttcEQva1NrSHRJemUzT1V1c0prcmlQd3pNTTBQQVRCSit5NGJuVXZJ?=
 =?utf-8?Q?YLIsgjEH/rhU4wvl3InRY8P6T6i7ghanxc8wwHp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFB3DF1AD81BA844BE0528E9BCE5566D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c14ad79-4399-4da2-41c7-08d97351cd25
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 05:22:21.9896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yKOTKrDmpiaYpVL42LjV1gmPNMF6FpS9a4W+ONIOmUuPxE2kRMgkw13QBggwQWYPTZLal5RqvbNEHdaNREivUWnGh8tNHWriLxMoqx03We3pjnMv5DaD0+HiviVFIJlB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6323
X-Proofpoint-ORIG-GUID: YsPPrfSn1cU-W4GmPEL2V-Dt_sOLGQWs
X-Proofpoint-GUID: YsPPrfSn1cU-W4GmPEL2V-Dt_sOLGQWs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_01,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090032

DQpPbiAwOC4wOS4yMSAxODowMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA4LjA5LjIwMjEg
MTY6MzEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDYuMDkuMjEgMTc6
NDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAzLjA5LjIwMjEgMTI6MDgsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+DQo+Pj4+IEluc3RlYWQg
b2YgaGFuZGxpbmcgYSBzaW5nbGUgcmFuZ2Ugc2V0LCB0aGF0IGNvbnRhaW5zIGFsbCB0aGUgbWVt
b3J5DQo+Pj4+IHJlZ2lvbnMgb2YgYWxsIHRoZSBCQVJzIGFuZCBST00sIGhhdmUgdGhlbSBwZXIg
QkFSLg0KPj4+IFdpdGhvdXQgbG9va2luZyBhdCBob3cgeW91IGNhcnJ5IG91dCB0aGlzIGNoYW5n
ZSAtIHRoaXMgbG9vayB3cm9uZyAoYXMNCj4+PiBpbjogd2FzdGVmdWwpIHRvIG1lLiBEZXNwaXRl
IC4uLg0KPj4+DQo+Pj4+IFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gb2YgbWFraW5nIG5vbi1pZGVu
dGl0eSBtYXBwaW5ncyBpbiBwMm0gZm9yIHRoZQ0KPj4+PiBNTUlPcy9ST00uDQo+Pj4gLi4uIHRo
ZSBuZWVkIGZvciB0aGlzLCBldmVyeSBpbmRpdmlkdWFsIEJBUiBpcyBzdGlsbCBjb250aWd1b3Vz
IGluIGJvdGgNCj4+PiBob3N0IGFuZCBndWVzdCBhZGRyZXNzIHNwYWNlcywgc28gY2FuIGJlIHJl
cHJlc2VudGVkIGFzIGEgc2luZ2xlDQo+Pj4gKHN0YXJ0LGVuZCkgdHVwbGUgKG9yIGEgcGFpciB0
aGVyZW9mLCB0byBhY2NvdW50IGZvciBib3RoIGhvc3QgYW5kIGd1ZXN0DQo+Pj4gdmFsdWVzKS4g
Tm8gbmVlZCB0byB1c2UgYSByYW5nZXNldCBmb3IgdGhpcy4NCj4+IEZpcnN0IG9mIGFsbCB0aGlz
IGNoYW5nZSBpcyBpbiBwcmVwYXJhdGlvbiBmb3Igbm9uLWlkZW50aXR5IG1hcHBpbmdzLA0KPiBJ
J20gYWZyYWlkIEkgY29udGludWUgdG8gbm90IHNlZSBob3cgdGhpcyBtYXR0ZXJzIGluIHRoZSBk
aXNjdXNzaW9uIGF0DQo+IGhhbmQuIEknbSBmdWxseSBhd2FyZSB0aGF0IHRoaXMgaXMgdGhlIGdv
YWwuDQo+DQo+PiBlLmcuIGN1cnJlbnRseSB3ZSBjb2xsZWN0IGFsbCB0aGUgbWVtb3J5IHJhbmdl
cyB3aGljaCByZXF1aXJlIG1hcHBpbmdzDQo+PiBpbnRvIGEgc2luZ2xlIHJhbmdlIHNldCwgdGhl
biB3ZSBjdXQgb2ZmIE1TSS1YIHJlZ2lvbnMgYW5kIHRoZW4gdXNlIHJhbmdlIHNldA0KPj4gZnVu
Y3Rpb25hbGl0eSB0byBjYWxsIGEgY2FsbGJhY2sgZm9yIGV2ZXJ5IG1lbW9yeSByYW5nZSBsZWZ0
IGFmdGVyIE1TSS1YLg0KPj4gVGhpcyB3b3JrcyBwZXJmZWN0bHkgZmluZSBmb3IgMToxIG1hcHBp
bmdzLCBlLmcuIHdoYXQgd2UgaGF2ZSBhcyB0aGUgcmFuZ2UNCj4+IHNldCdzIHN0YXJ0aW5nIGFk
ZHJlc3MgaXMgd2hhdCB3ZSB3YW50IHRvIGJlIG1hcHBlZC91bm1hcHBlZC4NCj4+IFdoeSByYW5n
ZSBzZXRzPyBCZWNhdXNlIHRoZXkgYWxsb3cgcGFydGlhbCBtYXBwaW5ncywgZS5nLiB5b3UgY2Fu
IG1hcCBwYXJ0IG9mDQo+PiB0aGUgcmFuZ2UgYW5kIHJldHVybiBiYWNrIGFuZCBjb250aW51ZSBm
cm9tIHdoZXJlIHlvdSBzdG9wcGVkLiBBbmQgaWYgSQ0KPj4gdW5kZXJzdGFuZCB0aGF0IGNvcnJl
Y3RseSB0aGF0IHdhcyB0aGUgaW5pdGlhbCBpbnRlbnRpb24gb2YgaW50cm9kdWNpbmcgcmFuZ2Ug
c2V0cyBoZXJlLg0KPj4NCj4+IEZvciBub24taWRlbnRpdHkgbWFwcGluZ3MgdGhpcyBiZWNvbWVz
IG5vdCB0aGF0IGVhc3kuIEVhY2ggaW5kaXZpZHVhbCBCQVIgbWF5IGJlDQo+PiBtYXBwZWQgZGlm
ZmVyZW50bHkgYWNjb3JkaW5nIHRvIHdoYXQgZ3Vlc3QgT1MgaGFzIHByb2dyYW1tZWQgYXMgYmFy
LT5ndWVzdF9hZGRyDQo+PiAoZ3Vlc3QgdmlldyBvZiB0aGUgQkFSIHN0YXJ0KS4NCj4gSSBkb24n
dCBzZWUgaG93IHRoZSByYW5nZXNldCBoZWxwcyBoZXJlLiBZb3UgaGF2ZSBhIGd1ZXN0IGFuZCBh
IGhvc3QgcGFpcg0KPiBvZiB2YWx1ZXMgZm9yIGV2ZXJ5IEJBUi4gUGFnZXMgd2l0aCBlLmcuIHRo
ZSBNU0ktWCB0YWJsZSBtYXkgbm90IGJlIG1hcHBlZA0KPiB0byB0aGVpciBob3N0IGNvdW50ZXJw
YXJ0IGFkZHJlc3MsIHllcywgYnV0IHlvdSBuZWVkIHRvIHNwZWNpYWwgY2FzZXMNCj4gdGhlc2Ug
YW55d2F5OiBBY2Nlc3NlcyB0byB0aGVtIG5lZWQgdG8gYmUgaGFuZGxlZC4gSGVuY2UgSSdtIGhh
dmluZyBhIGhhcmQNCj4gdGltZSBzZWVpbmcgaG93IGEgcGVyLUJBUiByYW5nZXNldCAod2hpY2gg
d2lsbCBjb3ZlciBhdCBtb3N0IHRocmVlIGRpc3RpbmN0DQo+IHJhbmdlcyBhZmFpY3QsIHdoaWNo
IGlzIHdheSB0b28gbGl0dGxlIGZvciB0aGlzIGtpbmQgb2YgZGF0YSBvcmdhbml6YXRpb24NCj4g
aW1vKSBjYW4gZ2FpbiB5b3UgYWxsIHRoaXMgbXVjaC4NCj4NCj4gT3ZlcmFsbCB0aGUgNiBCQVJz
IG9mIGEgZGV2aWNlIHdpbGwgY292ZXIgdXAgdG8gOCBub24tYWRqYWNlbnQgcmFuZ2VzLiBJT1cN
Cj4gdGhlIG1ham9yaXR5ICg0IG9yIG1vcmUpIG9mIHRoZSByYW5nZXNldHMgd2lsbCBpbmRlZWQg
bWVyZWx5IHJlcHJlc2VudCBhDQo+IHBsYWluIChzdGFydCxlbmQpIHBhaXIgKG9yIGJlIGVudGly
ZWx5IGVtcHR5KS4NCkZpcnN0IG9mIGFsbCwgbGV0IG1lIGV4cGxhaW4gd2h5IEkgZGVjaWRlZCB0
byBtb3ZlIHRvIHBlci1CQVINCnJhbmdlIHNldHMuDQpCZWZvcmUgdGhpcyBjaGFuZ2UgYWxsIHRo
ZSBNTUlPIHJlZ2lvbnMgYW5kIE1TSS1YIGhvbGVzIHdlcmUNCmFjY291bnRlZCBieSBhIHNpbmds
ZSByYW5nZSBzZXQsIGUuZy4gd2UgZ28gb3ZlciBhbGwgQkFScyBhbmQNCmFkZCBNTUlPcyBhbmQg
dGhlbiBzdWJ0cmFjdCBNU0ktWCBmcm9tIHRoZXJlLiBXaGVuIGl0IGNvbWVzIHRvDQptYXBwaW5n
L3VubWFwcGluZyB3ZSBoYXZlIGFuIGFzc3VtdGlvbiB0aGF0IHRoZSBzdGFydGluZyBhZGRyZXNz
IG9mDQplYWNoIGVsZW1lbnQgaW4gdGhlIHJhbmdlIHNldCBpcyBlcXVhbCB0byBtYXAvdW5tYXAg
YWRkcmVzcywgZS5nLg0Kd2UgaGF2ZSBpZGVudGl0eSBtYXBwaW5nLiBQbGVhc2Ugbm90ZSwgdGhh
dCB0aGUgcmFuZ2Ugc2V0IGFjY2VwdHMNCmEgc2luZ2xlIHByaXZhdGUgZGF0YSBwYXJhbWV0ZXIg
d2hpY2ggaXMgZW5vdWdoIHRvIGhvbGQgYWxsDQpyZXF1aXJlZCBkYXRhIGFib3V0IHRoZSBwZGV2
IGluIGNvbW1vbiwgYnV0IHRoZXJlIGlzIG5vIHdheSB0byBwcm92aWRlDQphbnkgcGVyLUJBUiBk
YXRhLg0KDQpOb3csIHRoYXQgd2Ugd2FudCBub24taWRlbnRpdHkgbWFwcGluZ3MsIHdlIGNhbiBu
byBsb25nZXIgYXNzdW1lDQp0aGF0IHN0YXJ0aW5nIGFkZHJlc3MgPT0gbWFwcGluZyBhZGRyZXNz
IGFuZCB3ZSBuZWVkIHRvIHByb3ZpZGUNCmFkZGl0aW9uYWwgaW5mb3JtYXRpb24gb24gaG93IHRv
IG1hcCBhbmQgd2hpY2ggaXMgbm93IHBlci1CQVIuDQpUaGlzIGlzIHdoeSBJIGRlY2lkZWQgdG8g
dXNlIHBlci1CQVIgcmFuZ2Ugc2V0cy4NCg0KT25lIG9mIHRoZSBzb2x1dGlvbnMgbWF5IGJlIHRo
YXQgd2UgZm9ybSBhbiBhZGRpdGlvbmFsIGxpc3Qgb2YNCnN0cnVjdHVyZXMgaW4gYSBmb3JtIChJ
IG9tbWl0IHNvbWUgb2YgdGhlIGZpZWxkcyk6DQpzdHJ1Y3Qgbm9uX2lkZW50aXR5IHsNCiDCoMKg
wqAgdW5zaWduZWQgbG9uZyBzdGFydF9tZm47DQogwqDCoMKgIHVuc2lnbmVkIGxvbmcgc3RhcnRf
Z2ZuOw0KIMKgwqDCoCB1bnNpZ25lZCBsb25nIHNpemU7DQp9Ow0KU28gdGhpcyB3YXkgd2hlbiB0
aGUgcmFuZ2Ugc2V0IGdldHMgcHJvY2Vzc2VkIHdlIGdvIG92ZXIgdGhlIGxpc3QNCmFuZCBmaW5k
IG91dCB0aGUgY29ycmVzcG9uZGluZyBsaXN0J3MgZWxlbWVudCB3aGljaCBkZXNjcmliZXMgdGhl
DQpyYW5nZSBzZXQgZW50cnkgYmVpbmcgcHJvY2Vzc2VkIChzLCBlLCBkYXRhKToNCg0Kc3RhdGlj
IGludCBtYXBfcmFuZ2UodW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHZvaWQgKmRh
dGEsDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBs
b25nICpjKQ0Kew0KW3NuaXBdDQogwqDCoMKgIGdvIG92ZXIgdGhlIGxpc3QgZWxlbWVudHMNCiDC
oMKgwqAgwqDCoMKgIGlmICggbGlzdC0+c3RhcnRfbWZuID09IHMgKQ0KIMKgwqDCoCDCoMKgwqAg
wqDCoMKgIGZvdW5kLCBjYW4gdXNlIGxpc3QtPnN0YXJ0X2dmbiBmb3IgbWFwcGluZw0KW3NuaXBd
DQp9DQpUaGlzIGhhcyBzb21lIGNvbXBsaWNhdGlvbnMgYXMgbWFwX3JhbmdlIG1heSBiZSBjYWxs
ZWQgbXVsdGlwbGUgdGltZXMNCmZvciB0aGUgc2FtZSByYW5nZTogaWYge3VubWFwfG1hcH1fbW1p
b19yZWdpb25zIHdhcyBub3QgYWJsZSB0byBjb21wbGV0ZQ0KdGhlIG9wZXJhdGlvbiBpdCByZXR1
cm5zIHRoZSBudW1iZXIgb2YgcGFnZXMgaXQgd2FzIGFibGUgdG8gcHJvY2VzczoNCiDCoMKgwqDC
oMKgwqDCoCByYyA9IG1hcC0+bWFwID8gbWFwX21taW9fcmVnaW9ucyhtYXAtPmQsIHN0YXJ0X2dm
biwNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplLCBfbWZuKHMpKQ0KIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6IHVubWFwX21taW9fcmVnaW9ucyhtYXAt
PmQsIHN0YXJ0X2dmbiwNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZSwgX21mbihz
KSk7DQpJbiB0aGlzIGNhc2Ugd2UgbmVlZCB0byB1cGRhdGUgdGhlIGxpc3QgaXRlbToNCiDCoMKg
wqAgbGlzdC0+c3RhcnRfbWZuICs9IHJjOw0KIMKgwqDCoCBsaXN0LT5zdGFydF9nZm4gKz0gcmM7
DQogwqDCoMKgIGxpc3QtPnNpemUgLT0gcmM7DQphbmQgaWYgYWxsIHRoZSBwYWdlcyBvZiB0aGUg
cmFuZ2Ugd2VyZSBwcm9jZXNzZWQgZGVsZXRlIHRoZSBsaXN0IGVudHJ5Lg0KDQpXaXRoIHJlc3Bl
Y3Qgb2YgY3JlYXRpbmcgdGhlIGxpc3QgZXZlcnl0aGluZyBhbHNvIG5vdCBzbyBjb21wbGljYXRl
ZDoNCndoaWxlIHByb2Nlc3NpbmcgZWFjaCBCQVIgY3JlYXRlIGEgbGlzdCBlbnRyeSBhbmQgZmls
bCBpdCB3aXRoIG1mbiwgZ2ZuDQphbmQgc2l6ZS4gVGhlbiwgaWYgTVNJLVggcmVnaW9uIGlzIHBy
ZXNlbnQgd2l0aGluIHRoaXMgQkFSLCBicmVhayB0aGUNCmxpc3QgaXRlbSBpbnRvIG11bHRpcGxl
IG9uZXMgd2l0aCByZXNwZWN0IHRvIHRoZSBob2xlcywgZm9yIGV4YW1wbGU6DQoNCk1NSU8gMCBs
aXN0IGl0ZW0NCk1TSS1YIGhvbGUgMA0KTU1JTyAxIGxpc3QgaXRlbQ0KTVNJLVggaG9sZSAxDQoN
CkhlcmUgaW5zdGVhZCBvZiBhIHNpbmdsZSBCQVIgZGVzY3JpcHRpb24gd2Ugbm93IGhhdmUgMiBs
aXN0IGVsZW1lbnRzDQpkZXNjcmliaW5nIHRoZSBCQVIgd2l0aG91dCBNU0ktWCByZWdpb25zLg0K
DQpBbGwgdGhlIGFib3ZlIHN0aWxsIHJlbGllcyBvbiBhIHNpbmdsZSByYW5nZSBzZXQgcGVyIHBk
ZXYgYXMgaXQgaXMgaW4gdGhlDQpvcmlnaW5hbCBjb2RlLiBXZSBjYW4gZ28gdGhpcyByb3V0ZSBp
ZiB3ZSBhZ3JlZSB0aGlzIGlzIG1vcmUgYWNjZXB0YWJsZQ0KdGhhbiB0aGUgcmFuZ2Ugc2V0cyBw
ZXIgQkFSDQo+DQo+PiBUaHVzIHdlIG5lZWQgdG8gY29sbGVjdCBhbGwgdGhvc2Ugbm9uLWlkZW50
aXR5IG1hcHBpbmdzDQo+PiBwZXIgQkFSIG5vdyAoc28gd2UgaGF2ZSBhIG1hcHBpbmcgImd1ZXN0
IHZpZXciIDogInBoeXNpY2FsIEJBUiIgYW5kIGFnYWluIGN1dCBvZmYNCj4+IE1TSS1YIHJlZ2lv
bnMgYXMgYmVmb3JlLsKgIFNvLCB5ZXMsIGl0IG1heSBiZSBhIGJpdCB3YXN0ZWZ1bCB0byB1c2Ug
bWFueSByYW5nZSBzZXRzLA0KPj4gYnV0IG1ha2VzIHZQQ0kgbGlmZSBtdWNoLW11Y2ggZWFzaWVy
Lg0KPiBXaGljaCBJJ20geWV0IHRvIGJlIGNvbnZpbmNlZCBvZi4gVGhlbiBhZ2FpbiBJJ20gbm90
IHRoZSBtYWludGFpbmVyIG9mDQo+IHRoaXMgY29kZSwgc28gaWYgeW91IGNhbiBjb252aW5jZSBS
b2dlciB5b3UnbGwgYmUgYWxsIGdvb2QuDQoNClBlci1CQVIgcmFuZ2Ugc2V0cyBsb29rIG1vcmUg
Y2xlYXIgdG8gbWUgYW5kIGFkZCByZWxhdGl2ZWx5IGxlc3MgY29kZSB3aGljaA0KDQpzZWVtcyB0
byBiZSBnb29kLg0KDQo+DQo+PiBUaHVzLCBJIHRoaW5rIHRoYXQgZXZlbiBwZXItQkFSIHJhbmdl
IHNldHMgYXJlDQo+PiBnb29kIHRvIGdvIGFzIHRoZXkgaGF2ZSBtb3JlIHByb3MgdGhhbiBjb25z
LiBJTU8NCj4+IEV2ZW4gaWYgd2UgZ28gd2l0aCAiY2FuIGJlIHJlcHJlc2VudGVkIGFzIGEgc2lu
Z2xlIChzdGFydCxlbmQpIHR1cGxlIiBpdCBkb2Vzbid0IGFuc3dlcg0KPj4gdGhlIHF1ZXN0aW9u
IHdoYXQgbmVlZHMgdG8gYmUgZG9uZSBpZiBhIHJhbmdlIGdldHMgcGFydGlhbGx5IG1hcHBlZC91
bm1hcHBlZC4NCj4gVGhpcyBxdWVzdGlvbiBhbHNvIGlzbid0IGFuc3dlcmVkIHdoZW4geW91IHVz
ZSByYW5nZXNldHMuDQpib29sIHZwY2lfcHJvY2Vzc19wZW5kaW5nKHN0cnVjdCB2Y3B1ICp2KQ0K
ew0KDQpbc25pcF0NCg0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmMgPSByYW5nZXNldF9jb25z
dW1lX3JhbmdlcyhiYXItPm1lbSwgbWFwX3JhbmdlLCAmZGF0YSk7DQoNCiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmICggcmMgPT0gLUVSRVNUQVJUICkNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIHRydWU7DQoNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQoNCk9sZWtz
YW5kcg0K

