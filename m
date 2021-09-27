Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C352B4194BD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 15:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196852.349751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUqGr-0006xS-Ku; Mon, 27 Sep 2021 13:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196852.349751; Mon, 27 Sep 2021 13:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUqGr-0006uB-HD; Mon, 27 Sep 2021 13:02:13 +0000
Received: by outflank-mailman (input) for mailman id 196852;
 Mon, 27 Sep 2021 13:02:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUqGp-0006u5-TZ
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 13:02:11 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20105d4a-1f93-11ec-bc44-12813bfff9fa;
 Mon, 27 Sep 2021 13:02:10 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RCwPQ5031720; 
 Mon, 27 Sep 2021 13:02:08 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bbapvh96s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 13:02:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4884.eurprd03.prod.outlook.com (2603:10a6:208:fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 27 Sep
 2021 13:02:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 13:02:03 +0000
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
X-Inumbo-ID: 20105d4a-1f93-11ec-bc44-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAnVsz+UNOIb5ef5C2Fwv4Ix6NmaiZgA4ICMDlUIO5iOJeIMJeakkZkGr8ZvzpiX8c67rQ4raIqqitPKDRMOnCQqs8CdTY+9I8xLUiLXBdeKOrI7puOW+IyAgPuLnoEqkdeSkgGCZg+WZQJxALnxGYSgZ4EIBSSBKqzDOejCXr/5pPa3nWISmNtZsZVYkZo2zk4BozKwzRu8gMQ13WTRHXj4jNzn0qn4/N7mFrEZzJuNXb5sJ5W+mZwsx+gmt3EjNa1E3C4wvJcW1o2HpEivkApKGm0qYQA9NT6Sz6cPN2S/72uYYvb81zDKwQ/mlYnWPp7NmO0SDxuYk4PqOxz67A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=BXNqTsz23BP+4qe5sIekQ17PL4tWH7PxtLQ28xGn6Ms=;
 b=PAgziZrtTleVZRW01YoxHC7FFsb7Vha6aoNKad5XCAvGFDQCUOaMvW/bB8/0cm9jFZyHkNfTO0vXLX5L3IW4WBEK9qxSazgYuZkbfcSfqttTg1nIsn5sLdn5b+dkeKl/iIHlZKW+YMKYvGuUzZBjagMKDDHdWbpqENFj0RVw87Yh8adIG67FZJS9BA9L3huA+M+5ARjCSBdXLcLor8QNdonaqkVVL6bd2Nbu9yuNPAfBLofsFGg+y6iHWWNK+32swaxG2xGtWxF1EbkfJI/GOVSNJvSBpBnr8BPOZ04rIqcXUVZRdWajdp+443IKP/ZfKtVfdR3BW9g4WkuLpo028A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXNqTsz23BP+4qe5sIekQ17PL4tWH7PxtLQ28xGn6Ms=;
 b=e1zzFO0sZcNts8mAWFi7E94xgR7Bo0bfIol2Y+QYkRoWQSAQ01WVD3CwmodJ6NlAyv0DwbfSWrRwNI1IJMqMqbFCd8FDIKsFh5wz3Y+qkDDoHsW9EzObORYwn4rM9ZwWjV8LyqkCZfwCvYiP54ZJDVWDBMeo0P5IhqyU+GNmgPid9kH6Ecv6k3hpGQl3K7XQu9HEQ6ATDa1EjJyIIRr52nJHiEm0jGZH2AGoDRb2oZ2kTYPafLvFVFvjhIvUirLXsqVJRE2s0wVOojo7RDK1oAxEecLQzCbI4WExeI7K9cg+U/e4BCisu/eEQXfz+SjA9JjW5GHTLoiHTI/8XoTKaw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        Ian Jackson
	<iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 08/11] libxl: Only map legacy PCI IRQs if they are
 supported
Thread-Topic: [PATCH v2 08/11] libxl: Only map legacy PCI IRQs if they are
 supported
Thread-Index: AQHXsHo1c5aXAigXoEuHbQuK2gbS5Kuz4U+AgAP9dgA=
Date: Mon, 27 Sep 2021 13:02:02 +0000
Message-ID: <85922b59-2bd4-0f16-9109-7c1ca24f52d8@epam.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-9-andr2000@gmail.com>
 <alpine.DEB.2.21.2109241704050.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109241704050.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b123b222-9092-4bd5-6cb2-08d981b70015
x-ms-traffictypediagnostic: AM0PR03MB4884:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB48841CF088A0CDAADEC8B1F2E7A79@AM0PR03MB4884.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Cs8UoHQJsMfF81nLnNpSsklvmDFUFSR2OT0ANVlzARFGPgNMLCJgm0SGefUZ3kV7OJWa3FeVClriJ9bCtNJ8+eefxKMEFAdEVu4seZGEf2OekFVzhZVOwyUk/WcK6nQTfx52ui1a/odquP2JBz8siSVrS04r+Pw4THM4wZxslnsJ3daj1wuOdYnjqDAaMIpcj649/aY3gu71VGEiFJTt/2Co6SS+pNFYT9x2hElURl5PNwixnxDcMdBWe8066vokhtPSwaoOjWSFD2I55Mtvp7BgVe1iA/4BX7VrF1yktCwg/47edh7Kl9yPFJS3SpWzKHBmrX5M3QJxGpG9vddZw+cGowIdGm7kU3HwxzOlwt6wPi1nqBi6h3jEBYedrHpJWSfw7JMoxzWOQC/+SOIAep5lvyPuzgacb1qecFeUHE1gT+y9Kk1rZsYv1nPvNWm7kEG3ABPfVhKsCHzMOcxYzsI7h2hv3py/ySKV7/Lidz5ArJV9MyO1ph2NFp8nwfJZQtPpDAOj/jDrGhzTOoF2cYbFv6M0Xurkv6Me6QunoYfrVOqdRLTC281umv1vV8JaavrCIoFpPslwYvsT2QmHNt469HPU/1pF0mR2rvXVARiRQ4n17LBjk0uOj1jBHju41MJDkXZHp0cJO0Mh/Zp1IU6zdhX5w7wvHROOPhW1pJd9YLb1YzDk8i4uVHiNCxVYs8MzZUE01stLb7KJlYoIHnEGnhVaI1HwFoUPslFlaQfGeXB1Th9qWWmIN/WRhd0j
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(64756008)(54906003)(66556008)(38100700002)(2616005)(316002)(66446008)(508600001)(4326008)(66476007)(6486002)(6512007)(186003)(71200400001)(31686004)(76116006)(66946007)(2906002)(8676002)(122000001)(7416002)(83380400001)(86362001)(31696002)(36756003)(91956017)(53546011)(8936002)(55236004)(110136005)(26005)(5660300002)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZW1ZSDJ3K2ZuY3ZhMi85SXYvdzZBanVVY3pMNkVsa1FpcjB3akxnNUdORHk4?=
 =?utf-8?B?eVRQK05oc2ZnMmhTcmlEL1FWV1AwZk4rSTAraHVQWDNuRzlta1dndjhsczhD?=
 =?utf-8?B?WWE0MllKOEsrOHJIeFFkekpBSUhubUpwL1Fucjc4Q1dTRTBYMi9EQnIzMnRa?=
 =?utf-8?B?ZEtBc2FnYXhmbWF6a1BQOTNUQ2lsV1NVQnRtampZeFA5OHlxcVlFOE4xcW5R?=
 =?utf-8?B?R1J0b0F2dzJNUS9Bbm1HWng2TWtjazZ3OFVUbjlnNFZRQm1CbDROTjN4VTBW?=
 =?utf-8?B?T0htMXg2Q0hBMEJtRmZJRmN4UzI4bTcyZWxaQjduWUhqMmZHcit0Mlk3UUJp?=
 =?utf-8?B?K1YvQXlqQnl2UWR1cnQzTXg5R1k5UGJsOGlCMGpkVENOcFpKTFVwU3YrZ0lR?=
 =?utf-8?B?bGE1YWcyQkFaQitXQjQ2ejFaSDNOR2ZvRHJEdUd6bDNSU3lhaDVUY3FxRFlj?=
 =?utf-8?B?N2lsM0FPZWdnd1BFZTl1NnpqdG1rSU9ORHBsUmx0R01ETzNZc1RxVzlXUmhj?=
 =?utf-8?B?a1BWQ0x1U0cwZ29JNHgzZ1hYRkhGMHRNVjFSTGFleUFvMWVMV3FFdGE4Mmd1?=
 =?utf-8?B?Z0NuWjl1YXhoSGZrNC9MSVB0anFVemhUUnhiL2ROSFNyOFN6MW1vNC9ua1Ns?=
 =?utf-8?B?RVN1VGhOVHdudXZIK29WQ1k1YUJGRTVZT2huRWtRbHVqanJ0UVlwMjUvWlNH?=
 =?utf-8?B?d2FjekI3RU5RQUN4UVE4MTc4MkZTUnJ5T2dFS0VXNTFoMzd5ZHE1WUt1ZEFP?=
 =?utf-8?B?emxpVVREZVhCWmRvb2pxRzBqQ1orMFdoQWxIUUsrM0U0S1hxb2NyNFVjeVdz?=
 =?utf-8?B?akZjQXZIdlZtU0pVQk5UM2d3WXZXV25QdmdDS2k3TzdTKzlIb1pDcitVT0JI?=
 =?utf-8?B?OVR4RkNiQytSOUJVNFZUMnFJYTdSZ0tCejZITUFDdVJ6NnVjZE5nM3ZhaHl1?=
 =?utf-8?B?L0NDVGtxZStCY2dFRVF6NUhkTEROVFJRTVpHb292K0VDbkN2YkNWbzV1cjFF?=
 =?utf-8?B?VEFVaXpEQnY2ZVNEYksrbG90Sm16c3RRUmhnbTV6eUxLNEp3U2pzbWVzNXJz?=
 =?utf-8?B?cm1wdExQeHZHeWhQOVlpcGk1RXJ6dEhycTV5TkU4YlF1bmpVZmprZGQzc3hs?=
 =?utf-8?B?aHNpbHpPallFOThNTlE2bnZEMjJXVURnd1A0UWNvZTNDOGdIbjMxRFZaUEVF?=
 =?utf-8?B?WXVQZlErT2pIK3BjUkNFUEhidWZ4V3krMjVOMjdmK0R0NUg0K2xMOTNjc29x?=
 =?utf-8?B?R244VWRTenRTSWpEeENsL2FkL0dUYlI4SkI2K0lDbmhuK3E4M1pBNXNRN3g0?=
 =?utf-8?B?K1k4S3VpclYvU1l1TlA0NGp3WDhqNHRuMGlyaDhDQ2YrdW9XVlh6eThCcS9u?=
 =?utf-8?B?eHNDUUh2TzNXVnNNc2R6eHVicXNSbVBDekd1Ym42aDU4WE1wTkhiVnhFeWE1?=
 =?utf-8?B?NXN0SnpxdlRxK3hkMzZQdWhjK3huTE1IU2hTdWRLQUJNMFJDaWRpVCs4bktF?=
 =?utf-8?B?VUc5bktPS2hHMlhKSlhrMjNTRmttQktHenhwSmlIK09WRCt6L3hnd0lsRmFF?=
 =?utf-8?B?dGZJRE1HdHZnTFFEYTNod1RYREk0UEwwUTMrMzRHWDgzWHVTZmQwQ21wWlMr?=
 =?utf-8?B?SjhKeDRuR2hmME1OTGszcTBNMTdyS0Jyd1dCVVNJYWovZVh1YWliM2hhSTNT?=
 =?utf-8?B?VHc3UnoweHlpaE5jbXVkWmdVT2FKeC9uVC9XeU00c3RWNDdpRlRwelJYTklw?=
 =?utf-8?B?R1FBSnp2byszS1ZmL054UHo0TGZKWkRXOHIyU1ZNQUZhUDBWbUFGVWRJNy9j?=
 =?utf-8?B?WXdVUjFpVm9WMFVQVzU2Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3BFE77BFFF17B4EB31EFBE3638C2AF9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b123b222-9092-4bd5-6cb2-08d981b70015
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 13:02:02.8972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JaNlmLf2xNzey+ggaaCXiKpWSXK/Z/GcpyW8MjL2b9oopij10f0caOaSB4/YUeILVCG4/gx9aESafZ3EWQo/EyLMk6ga4nlXEmBRLv7Jqdpf2XGI3WF3wxRi0u1PXm8Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4884
X-Proofpoint-GUID: NABmYIASCv9XxbngtWeBKWKykyfQBanQ
X-Proofpoint-ORIG-GUID: NABmYIASCv9XxbngtWeBKWKykyfQBanQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_04,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109270090

DQpPbiAyNS4wOS4yMSAwMzowNiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBUaHUs
IDIzIFNlcCAyMDIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4N
Cj4+DQo+PiBBcm0ncyBQQ0kgcGFzc3Rocm91Z2ggaW1wbGVtZW50YXRpb24gZG9lc24ndCBzdXBw
b3J0IGxlZ2FjeSBpbnRlcnJ1cHRzLA0KPj4gYnV0IE1TSS9NU0ktWC4gVGhpcyBjYW4gYmUgdGhl
IGNhc2UgZm9yIG90aGVyIHBsYXRmb3JtcyB0b28uDQo+PiBGb3IgdGhhdCByZWFzb24gaW50cm9k
dWNlIGEgbmV3IENPTkZJR19QQ0lfU1VQUF9MRUdBQ1lfSVJRIGFuZCBhZGQNCj4+IGl0IHRvIHRo
ZSBDRkxBR1MgYW5kIGNvbXBpbGUgdGhlIHJlbGV2YW50IGNvZGUgaW4gdGhlIHRvb2xzdGFjayBv
bmx5IGlmDQo+PiBhcHBsaWNhYmxlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+IENjOiBJ
YW4gSmFja3NvbiA8aXdqQHhlbnByb2plY3Qub3JnPg0KPj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4NCj4+DQo+PiAtLS0NCj4+IFNpbmNlIHYxOg0KPj4gICAtIE1pbmltaXpl
ZCAjaWRlZmVyeSBieSBpbnRyb2R1Y2luZyBwY2lfc3VwcF9sZWdhY3lfaXJxIGZ1bmN0aW9uDQo+
PiAgICAgZm9yIHJlbGV2YW50IGNoZWNrcw0KPj4gLS0tDQo+PiAgIHRvb2xzL2xpYnMvbGlnaHQv
TWFrZWZpbGUgICAgfCAgNCArKysrDQo+PiAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMg
fCAxMyArKysrKysrKysrKysrDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygr
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L01ha2VmaWxlIGIvdG9vbHMv
bGlicy9saWdodC9NYWtlZmlsZQ0KPj4gaW5kZXggN2Q4YzUxZDQ5MjQyLi5iZDNmNmJlMmExODMg
MTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L01ha2VmaWxlDQo+PiArKysgYi90b29s
cy9saWJzL2xpZ2h0L01ha2VmaWxlDQo+PiBAQCAtNDYsNiArNDYsMTAgQEAgQ0ZMQUdTICs9IC1X
bm8tZm9ybWF0LXplcm8tbGVuZ3RoIC1XbWlzc2luZy1kZWNsYXJhdGlvbnMgXA0KPj4gICAJLVdu
by1kZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnQgLVdmb3JtYXQtbm9ubGl0ZXJhbA0KPj4gICBD
RkxBR1MgKz0gLUkuDQo+PiAgIA0KPj4gK2lmZXEgKCQoQ09ORklHX1g4NikseSkNCj4+ICtDRkxB
R1MgKz0gLURDT05GSUdfUENJX1NVUFBfTEVHQUNZX0lSUQ0KPj4gK2VuZGlmDQo+IFRoaXMgcGF0
Y2ggaXMgYSBsb3QgYmV0dGVyIHRoYW4gdGhlIHByZXZpb3VzIHZlcnNpb24sIHRoYW5rcyENCj4N
Cj4gSSB0aGluayB0aGUgdXNhZ2Ugb2YgcGNpX3N1cHBfbGVnYWN5X2lycSBiZWxvdyBpcyBnb29k
IGFuZCB3ZSBjYW4ndCBkbw0KPiBiZXR0ZXIgdGhhbiB0aGF0Lg0KPg0KPiBJIHdvbmRlciBpZiB0
aGVyZSBpcyBhIGJldHRlciB3YXkgdGhhbiB0aGUgYWJvdmUgdG8gZXhwb3J0DQo+IENPTkZJR19Q
Q0lfU1VQUF9MRUdBQ1lfSVJRLiBTdWdnZXN0aW9ucz8NCg0KSSBzZWUgbm90aGluZyBiYWQgZG9p
bmcgaXQgdGhpcyB3YXksIG1heWJlIElhbiBvciBKdWVyZ2VuIGNhbiB0ZWxsDQoNCmlmIHRoaXMg
aXMgYWNjZXB0YWJsZT8NCg0KPg0KPg0KPj4gICBTUkNTLSQoQ09ORklHX1g4NikgKz0gbGlieGxf
Y3B1aWQuYw0KPj4gICBTUkNTLSQoQ09ORklHX1g4NikgKz0gbGlieGxfeDg2LmMNCj4+ICAgU1JD
Uy0kKENPTkZJR19YODYpICs9IGxpYnhsX3Bzci5jDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
cy9saWdodC9saWJ4bF9wY2kuYyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+IGlu
ZGV4IDU5ZjM2ODZmYzg1ZS4uNGMyZDdhZWVmYmIyIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvbGli
cy9saWdodC9saWJ4bF9wY2kuYw0KPj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2ku
Yw0KPj4gQEAgLTEzNjQsNiArMTM2NCwxNSBAQCBzdGF0aWMgdm9pZCBwY2lfYWRkX3RpbWVvdXQo
bGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZXZfdGltZSAqZXYsDQo+PiAgICAgICBwY2lfYWRkX2Rt
X2RvbmUoZWdjLCBwYXMsIHJjKTsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgYm9vbCBwY2lf
c3VwcF9sZWdhY3lfaXJxKHZvaWQpDQo+PiArew0KPj4gKyNpZmRlZiBDT05GSUdfUENJX1NVUFBf
TEVHQUNZX0lSUQ0KPj4gKyAgICByZXR1cm4gdHJ1ZTsNCj4+ICsjZWxzZQ0KPj4gKyAgICByZXR1
cm4gZmFsc2U7DQo+PiArI2VuZGlmDQo+PiArfQ0KPj4gKw0KPj4gICBzdGF0aWMgdm9pZCBwY2lf
YWRkX2RtX2RvbmUobGlieGxfX2VnYyAqZWdjLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGNpX2FkZF9zdGF0ZSAqcGFzLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50IHJjKQ0KPj4gQEAgLTE0MzQsNiArMTQ0Myw4IEBAIHN0YXRpYyB2b2lkIHBjaV9hZGRf
ZG1fZG9uZShsaWJ4bF9fZWdjICplZ2MsDQo+PiAgICAgICAgICAgfQ0KPj4gICAgICAgfQ0KPj4g
ICAgICAgZmNsb3NlKGYpOw0KPj4gKyAgICBpZiAoIXBjaV9zdXBwX2xlZ2FjeV9pcnEoKSkNCj4+
ICsgICAgICAgIGdvdG8gb3V0X25vX2lycTsNCj4+ICAgICAgIHN5c2ZzX3BhdGggPSBHQ1NQUklO
VEYoU1lTRlNfUENJX0RFViIvIlBDSV9CREYiL2lycSIsIHBjaS0+ZG9tYWluLA0KPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaS0+YnVzLCBwY2ktPmRldiwgcGNpLT5mdW5j
KTsNCj4+ICAgICAgIGYgPSBmb3BlbihzeXNmc19wYXRoLCAiciIpOw0KPj4gQEAgLTE5ODMsNiAr
MTk5NCw4IEBAIHN0YXRpYyB2b2lkIGRvX3BjaV9yZW1vdmUobGlieGxfX2VnYyAqZWdjLCBwY2lf
cmVtb3ZlX3N0YXRlICpwcnMpDQo+PiAgICAgICAgICAgfQ0KPj4gICAgICAgICAgIGZjbG9zZShm
KTsNCj4+ICAgc2tpcDE6DQo+PiArICAgICAgICBpZiAoIXBjaV9zdXBwX2xlZ2FjeV9pcnEoKSkN
Cj4+ICsgICAgICAgICAgICBnb3RvIHNraXBfaXJxOw0KPj4gICAgICAgICAgIHN5c2ZzX3BhdGgg
PSBHQ1NQUklOVEYoU1lTRlNfUENJX0RFViIvIlBDSV9CREYiL2lycSIsIHBjaS0+ZG9tYWluLA0K
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpLT5idXMsIHBjaS0+ZGV2LCBw
Y2ktPmZ1bmMpOw0KPj4gICAgICAgICAgIGYgPSBmb3BlbihzeXNmc19wYXRoLCAiciIpOw0KPj4g
LS0gDQo+PiAyLjI1LjENCj4+

