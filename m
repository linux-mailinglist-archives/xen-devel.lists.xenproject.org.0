Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBC4415A9A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 11:10:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193544.344742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKk6-0008Ir-LM; Thu, 23 Sep 2021 09:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193544.344742; Thu, 23 Sep 2021 09:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKk6-0008G7-Hc; Thu, 23 Sep 2021 09:10:10 +0000
Received: by outflank-mailman (input) for mailman id 193544;
 Thu, 23 Sep 2021 09:10:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/6DS=ON=epam.com=prvs=9900839950=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mTKk5-0008G1-1i
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 09:10:09 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b9e7e20-1c4e-11ec-ba21-12813bfff9fa;
 Thu, 23 Sep 2021 09:10:07 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18N65CAL024936; 
 Thu, 23 Sep 2021 09:10:05 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b8j7krutu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 09:10:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7425.eurprd03.prod.outlook.com (2603:10a6:20b:260::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Thu, 23 Sep
 2021 09:09:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 09:09:56 +0000
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
X-Inumbo-ID: 0b9e7e20-1c4e-11ec-ba21-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARyM5bd/USn88D76eCPLIFDXD8FunBn/zfkCei5z7RrGOqmss8UP/g5okLOwwuXyibA8lWRAgQROI9vkGAbeqFaL39EojmOJfFWmCEv4ScF7k13bw9et12h/RVGhhJI6z0Px9mXMsFD6X6RCYyzpyVYJWyopqQMgur/GJdO1+EKmW0O0i67UB8chva6ns67ndAsQFY+KmgO8n/C2Cy1b8zlbL8MXFp+J+Ek/fDfdYq295WOfMkPgj2kiyvTNoR578ysntc+RcOowPldQOwOG4zvWdA1DitRwLWKaFPD8jHefNswCp9yazgwMc7QED8GM1wbNck/88UBM0l7pAPoucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=jxQI2uEP5ck7Lt6/B2VRAhJxpExuP54d/COIh2GQwp4=;
 b=DaTyTmGMnOgZvz9KuqUF+U3s30CrVS3TGEuE/zt6GoCb0J2o4WeR45gFPt3JsPHYphzrQ/eJUce/MwLZeoQ/LblfGuoQv+vuFwEDLtK0lrGrl6yhk5X0Oe8eFPSl2E3IJHK3f5OQH1XsToSkwPvhm4VIkw6vWK2vQSK2jzj8tW1a88ngVGnt5l6oZIzKqBoCF2CJBDgKcKOsft0hSJ0+wLtGZKJ4QkD9xGc3pv4HizuFufZZDBIITkAaogyCfXUL47ySTgqTVtMOig/urLxPDn6hQoVOqdz9OZlIlUdWKejT+wGE9Vv35ThPaDnLn+XBRwQRR6xmWpYqC/9lA+5fYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxQI2uEP5ck7Lt6/B2VRAhJxpExuP54d/COIh2GQwp4=;
 b=l6tHIURxeDsjZJn3vvfddKRHng4O25m7MRj6LT2Xe9JGEDwagkjHCRnaexfRHPd8O4t2fTqnJO9I7frgQQsVbR8uwUnU120DTsTkuP/jQEhvIYF3IPYmuhr0gHOQCnOHl2A2jL3KM7XKVsH5LS1JSP/y5ruRaJ6Fcc41O03+YpeWBhfe5w+ykwZR2JSPdpU2n6AsSNhWM8lyhhJxFgR62aBRkT19pNS3WT3wlggAQKtgEiiZwc26zPGSlDHoZphdeE/PRedZ99ofTiWk3CpKReVUGnSg9FiC/s+ZoBEYr2/hcEUcZOtfnCbEf3j2xIlDS8HjixYZIblZFtrL6eu5oQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "julien@xen.org"
	<julien@xen.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Oleksandr
 Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 2/2] xen-pciback: prepare for the split for stub and PV
Thread-Topic: [PATCH 2/2] xen-pciback: prepare for the split for stub and PV
Thread-Index: AQHXr5qiwVuFg9DS+ESEBHonrZ7zRquwjVWAgADGyoCAAADcgIAAAVyA
Date: Thu, 23 Sep 2021 09:09:56 +0000
Message-ID: <98e432f0-6be1-6394-1c06-ac5e726c708d@epam.com>
References: <20210922101422.2319240-1-andr2000@gmail.com>
 <20210922101422.2319240-2-andr2000@gmail.com>
 <alpine.DEB.2.21.2109221407350.17979@sstabellini-ThinkPad-T480s>
 <4552e4b6-21a8-4829-16b4-7cda8ba0c0d1@epam.com>
 <7880dee9-7372-5a25-db55-018f21e8b08c@suse.com>
In-Reply-To: <7880dee9-7372-5a25-db55-018f21e8b08c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e8d5731-b9f9-4bae-b044-08d97e71e985
x-ms-traffictypediagnostic: AM9PR03MB7425:
x-microsoft-antispam-prvs: 
 <AM9PR03MB7425461DD20150C3BB000773E7A39@AM9PR03MB7425.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZzHOQAwQ1vrA6qbxqPAZPlBuXjiPsTfJ2hY5h595Ibz4zXplB47QH5B3fxOcKPjWkV4nLA8U0VLjwffg3veRVBrJ7BqjOPJ8KYP/HE3bbvmCfYDWp61mBdgt8KVK/RQS81dkx5HGTt4a7mZeYJaXyjMelmYxKuFPi/OBhw/t6ppDlmGi7092xk8g05jYysQB9DOAazzpPn988EU6mOVkfhGe+E/9WUjqUftSKqzEvkTsdx4TvGsoC+tlAnxJ1p8vL5kx92Zyq6rdA5R0lwrKudRxdSINlKnsyCZyeWNyV4CCoGgH8U2dVvUty1S2YH314l1xb261Wm5wo0aEBc3KimDK0z+gzrF74dTKT7rFnsO6/LqcARrKLKDX89nqqHTCxyyducfP/P2z0NtIrerf3IvEqScU/AJ86vhTUxx+fJcUHyGvaVTtXs+22slXPsxnB1/DHm2E1+JfUuQp7+WsuUgnmnaDP8DCgfKFWyq2xMN3JDuiRbTyldezHvyfjEPUWYCwGjCeyn/aSQ+kK3HbfYrN6U6hjkW0VbNMDkvf138/G+em6ozh3sxBS1f4ckaHjDlBz66+jW1tOc4ojMArdpJV4KsczPgyqvbN2x/VPrDh0/+QwosFPO3+q0uoZ1BA9/Rz6M0LI08saSQmFBbWXGZiCp+ciKFn9WLumAE/b3V8HotMYlVzOHY+WACHc1lhNbfEgdkkRhLnNRoPY8ljoBJfDuxPghPZKKUIs78pOp9+OWAiUP7fTBb+7fhq1CY5
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(4326008)(76116006)(66476007)(316002)(66556008)(31696002)(2906002)(6512007)(6486002)(31686004)(66446008)(8676002)(2616005)(122000001)(5660300002)(8936002)(36756003)(64756008)(66946007)(110136005)(26005)(186003)(53546011)(38100700002)(6506007)(71200400001)(86362001)(54906003)(38070700005)(83380400001)(508600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dFRHcFVaYlRiVGhFMDEzM2dMdUlFZmYzODdsTDVLK1NMeTlVZHJ2UWV6YmtG?=
 =?utf-8?B?U3hmZ0ZCQWhpcGxOUDlRMjNRejdnYjdKOUpTZ3ZucHlvTUlOVU0zVFRKV2c1?=
 =?utf-8?B?dkhOUU9hYU14VGxBRk5kclNwUlpVZU9aa1ZwbVRWQTJUbmhGUjZVNkZHanlD?=
 =?utf-8?B?NG9ZbzdDeE44RjdTZEdIOXVqdEpydk81dFI4d20yQWNIMXNDbUI4QXJYWGo1?=
 =?utf-8?B?cXl1REU1T3FpZGlTelhvbXpYV1Q4SVZsTkFBMVVyaXdOaGozdlEwVE1yRTBv?=
 =?utf-8?B?aUV5VmZVa3U0WWZqV3JmVlNla3pIVWZXZzk1UU42SWE5dXRwTHVsdXZiUnNu?=
 =?utf-8?B?MTlaR0ViUkZWTnRTek4yQmpZSVN5VWE4OTFYc2pCV0NNTWJ6djRtVTNiUEs3?=
 =?utf-8?B?di8wNWd0ZjQ4U1BlSzBXYm9QOURLOTVaejRDcHY3Ni80cVhudDF2c0ttOEdB?=
 =?utf-8?B?YTRYeGFRTGVDTzNhMzZVdzR5dzI0N2VjbkluZXoycjRxZWxYN2xNalI5Z0VM?=
 =?utf-8?B?d2pUSWx6R1RodTRIV1ArSkhjaG5hWmcydnFzaUJ1Y1ZyaDl3N0RDOHgvNUcz?=
 =?utf-8?B?VE9YQWpocUFvU3JZN1g5d3lkVUxyclJjR3kvSUkvNkZUelNNcUNmWkJZb2Vh?=
 =?utf-8?B?b3dXL3ZRZ3BCaENkaXIwby9TY3pKc1Z0bXRjZHBPTjN0OGtCOTNXWGRLWktW?=
 =?utf-8?B?RzNTRVkyRHdIaTQ0RVRJbDBJTDBmUVovejhJQ0hnNkUyaExacXAzSEpEa3Zr?=
 =?utf-8?B?MUMwbHFLd1UvcnlzVWNwbEpHMkxrQ2pLS0lSSDRVL3hBK1ZwMXZtQVo4b0Vo?=
 =?utf-8?B?NUZBaXNybldxY2tTTll1WWJjbWZNUWlSeWlhcGxzNm95RHhZamRWZWFmUFRy?=
 =?utf-8?B?NWpQOHlrSGJhUUJmWUY4QlhmcitpcXQ4MkNscWltODV2Q1VnUnRKb3FpYWRs?=
 =?utf-8?B?T08zS2FDcWFMSExuWEtmeU51U0JBajhEdEJJZS9hK2NhUXZDSVRQa0xCSkUz?=
 =?utf-8?B?MEFIelhMaUtVVjZjbStNMWIrTm11ait3UXUwdVdtOFpUZWoxdFlJSDc3WUxz?=
 =?utf-8?B?UlVGaXowbTdZcytuZmhkQUk3S2JEUm5LSFlFU2VxMGcxRmkrMjIzU1Qvb09F?=
 =?utf-8?B?cVZ2dVJUd0dhL0R5eldIOXhYTThhSnhLdWpobmJvUWN3Q0pjOTFqbTN5SU5k?=
 =?utf-8?B?eTZ2d1h3Y3R5bEN3UXc1K0c3dkFSSFRrUWpWVzVITUF3Z0k1VllXL2R5S3Bh?=
 =?utf-8?B?YlZYT2RnU3owOGdHNktOYzB2dkxaNERrdC82Q21ubjU1MnM0N3phWVRySXdO?=
 =?utf-8?B?c1h4UmluYUhyNzEydkJPaVNjOFk1bUgwM0VTMnNXaE9SU0F2SmxhYWxCWlN3?=
 =?utf-8?B?QnFYa0M2QWZBaHFWc3JGOVA5RjdUKzVvUzVQR1ZOOHByb2RtdjlTZi83TGV0?=
 =?utf-8?B?QXVmbmtwM2Vab0NwWndKNlNzQlpJTENMd012SXN6L0p5SGloU1hkb0c4U2dL?=
 =?utf-8?B?VThpd3pSZktvMERyNjRXNlhySmlYRHc4Vi9GUEFsWU1hb3hFZWNxUVp0TUlM?=
 =?utf-8?B?RWdnazA2N25NUkMxa0NuWUg5R2hXbWtSeUV6NGk4RmhDZWdFZy94KzdHWXFl?=
 =?utf-8?B?Qjl3cm1OU0dQdVM1d1QzWjRWWGFZYXptWG5SRVRXZi9wMVdjenhrMXlSMkpH?=
 =?utf-8?B?b1dLZjhNTG56dStFaWthWDhMMnlieWtLMmVIeG9wbnhyd0k0UjRuRXNJbTRh?=
 =?utf-8?Q?b3Ht1ky3unoef3gQPFk2lzgBjcTcJdK1438KUGV?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2E7B7B4902C7B4B9407F91DECC9D645@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8d5731-b9f9-4bae-b044-08d97e71e985
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2021 09:09:56.3345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jxeEUKx1fYbNlDOmgQUCaMevy9y+qgev4HnB1L+8ywO2M+EGHwKB0MGbk6OVJ7TXgMGLxD+pNpmqPLHTc5X4ilxq+3jUoGkXkKqUshDxJF/a1F2kD/1vKj4GDbLFFjIE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7425
X-Proofpoint-ORIG-GUID: P1bSan3MJh1pTPuimyaE6QEzuOU6HUD5
X-Proofpoint-GUID: P1bSan3MJh1pTPuimyaE6QEzuOU6HUD5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_03,2021-09-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 mlxscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109230057

DQpPbiAyMy4wOS4yMSAxMjowNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjMuMDkuMjEg
MTE6MDIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4NCj4+IE9uIDIzLjA5LjIx
IDAwOjEwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4gT24gV2VkLCAyMiBTZXAgMjAy
MSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IC0tLSBhL2RyaXZlcnMveGVu
L3hlbi1wY2liYWNrL3hlbmJ1cy5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNr
L3hlbmJ1cy5jDQo+Pj4+IEBAIC03NDMsNiArNzQzLDkgQEAgY29uc3Qgc3RydWN0IHhlbl9wY2li
a19iYWNrZW5kICpfX3JlYWRfbW9zdGx5IHhlbl9wY2lia19iYWNrZW5kOw0KPj4+PiDCoMKgIMKg
wqAgaW50IF9faW5pdCB4ZW5fcGNpYmtfeGVuYnVzX3JlZ2lzdGVyKHZvaWQpDQo+Pj4+IMKgwqAg
ew0KPj4+PiArwqDCoMKgIGlmICgheGVuX3BjaWJrX3B2X3N1cHBvcnQoKSkNCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiAwOw0KPj4+IElzIHRoaXMgdHJ1bHkgZW5vdWdoIHRvIHN0b3AgdGhl
IFBWIGJhY2tlbmQgZnJvbSBpbml0aWFsaXppbmc/IEhhdmUgeW91DQo+Pj4gYWN0dWFsbHkgdGVz
dGVkIGl0IHRvIG1ha2Ugc3VyZT8gSWYgaXQgd29ya3MsIGFtYXppbmchIEkgYW0gcXVpdGUgaGFw
cHkNCj4+PiBhYm91dCB0aGlzIGFwcHJvYWNoIDotKQ0KPj4NCj4+IFdlbGwsIEkgcHV0IHNvbWUg
bG9ncyBpbnRvIHRoZSBkcml2ZXIgYW5kIHNhdyBub3RoaW5nIG9idmlvdXMgcG9pbnRpbmcNCj4+
DQo+PiB0byBhbnkgYmFja2VuZCBhY3Rpdml0aWVzIChwcm9iYWJseSB0aGlzIGlzIGFsc28gYmVj
YXVzZSBJIGRvbid0IGhhdmUgYW55DQo+Pg0KPj4gZnJvbnRlbmQpLiBJIHNlZSB0aGF0IHRoZSB4
ZW5idXMgZHJpdmVyIGlzIG5vdCByZWdpc3RlcmVkLiBJbiBYZW5TdG9yZSBJIHNlZToNCj4+DQo+
PiByb290QGRvbTA6fiMgeGVuc3RvcmUtbHMgLWYgfCBncmVwIHBjaQ0KPj4gL2xvY2FsL2RvbWFp
bi8wL2JhY2tlbmQvcGNpID0gIiINCj4+IC9sb2NhbC9kb21haW4vMC9iYWNrZW5kL3BjaS8yID0g
IiINCj4+IC9sb2NhbC9kb21haW4vMC9iYWNrZW5kL3BjaS8yLzAgPSAiIg0KPj4gL2xvY2FsL2Rv
bWFpbi8wL2JhY2tlbmQvcGNpLzIvMC9mcm9udGVuZCA9ICIvbG9jYWwvZG9tYWluLzIvZGV2aWNl
L3BjaS8wIg0KPj4gL2xvY2FsL2RvbWFpbi8wL2JhY2tlbmQvcGNpLzIvMC9mcm9udGVuZC1pZCA9
ICIyIg0KPj4gL2xvY2FsL2RvbWFpbi8wL2JhY2tlbmQvcGNpLzIvMC9vbmxpbmUgPSAiMSINCj4+
IC9sb2NhbC9kb21haW4vMC9iYWNrZW5kL3BjaS8yLzAvc3RhdGUgPSAiMSINCj4+IC9sb2NhbC9k
b21haW4vMC9iYWNrZW5kL3BjaS8yLzAvZG9tYWluID0gIkRvbVUiDQo+PiAvbG9jYWwvZG9tYWlu
LzAvYmFja2VuZC9wY2kvMi8wL2tleS0wID0gIjAwMDA6MDM6MDAuMCINCj4+IC9sb2NhbC9kb21h
aW4vMC9iYWNrZW5kL3BjaS8yLzAvZGV2LTAgPSAiMDAwMDowMzowMC4wIg0KPj4gL2xvY2FsL2Rv
bWFpbi8wL2JhY2tlbmQvcGNpLzIvMC9vcHRzLTAgPSAibXNpdHJhbnNsYXRlPTAscG93ZXJfbWdt
dD0wLHBlcm1pc3NpdmU9MCxyZG1fcG9saWN5PXN0cmljdCINCj4+IC9sb2NhbC9kb21haW4vMC9i
YWNrZW5kL3BjaS8yLzAvc3RhdGUtMCA9ICIxIg0KPj4gL2xvY2FsL2RvbWFpbi8wL2JhY2tlbmQv
cGNpLzIvMC9udW1fZGV2cyA9ICIxIg0KPj4gL2xvY2FsL2RvbWFpbi8yL2RldmljZS9wY2kgPSAi
Ig0KPj4gL2xvY2FsL2RvbWFpbi8yL2RldmljZS9wY2kvMCA9ICIiDQo+PiAvbG9jYWwvZG9tYWlu
LzIvZGV2aWNlL3BjaS8wL2JhY2tlbmQgPSAiL2xvY2FsL2RvbWFpbi8wL2JhY2tlbmQvcGNpLzIv
MCINCj4+IC9sb2NhbC9kb21haW4vMi9kZXZpY2UvcGNpLzAvYmFja2VuZC1pZCA9ICIwIg0KPj4g
L2xvY2FsL2RvbWFpbi8yL2RldmljZS9wY2kvMC9zdGF0ZSA9ICIxIg0KPj4gL2xpYnhsL3BjaSA9
ICIiDQo+PiAvbGlieGwvcGNpLzAwMDAtMDMtMDAtMCA9ICIiDQo+PiAvbGlieGwvcGNpLzAwMDAt
MDMtMDAtMC9kb21pZCA9ICIyIg0KPj4NCj4+IEJ1dCBJSVVJQyB0aGVzZSBjb21lIGZyb20gdGhl
IHRvb2xzdGFjaw0KPj4NCj4+IEBKdWVyZ2VuLCBkbyB5b3Uga25vdyBob3cgdG8gY2hlY2sgaWYg
dGhlIGJhY2tlbmQgaXMgaW5kZWVkIG5vdCBydW5uaW5nDQo+Pg0KPj4gb3IgdGhlIGFib3ZlIHNo
b3VsZCBiZSBlbm91Z2ggdG8gcHJvdmU/DQo+DQo+IEkgZG9uJ3Qgc2VlIGhvdyB0aGUgYmFja2Vu
ZCBjb3VsZCBiZSBydW5uaW5nIHdpdGhvdXQgYmVpbmcgcmVnaXN0ZXJlZA0KPiB3aXRoIHhlbmJ1
cy4gSXQgd29uJ3QgcmVjZWl2ZSBhbnkgd2F0Y2hlcywgc28gdGhlcmUgaXMgbm8gd2F5IGENCj4g
Y29ubmVjdGlvbiB3aXRoIGEgZnJvbnRlbmQgY291bGQgYmUgZXN0YWJsaXNoZWQuDQoNClRoaXMg
aXMgbXkgdW5kZXJzdGFuZGluZyB0b28sIHNvIHRoZSBvbmx5IGNoYW5nZSBJJ3ZlIHB1dCBpbiBw
YXRjaCBJIHJlbW92ZWQNCg0KcmVnaXN0ZXIvdW5yZWdpc3Rlci4gSXQgc2VlbXMgdGhpcyBpcyBq
dXN0IGVub3VnaCBhbmQgdGhlIHBhdGNoIHNob3VsZCBiZSBvayBhcyBpcw0KDQo+DQo+DQo+IEp1
ZXJnZW4NCj4NClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

