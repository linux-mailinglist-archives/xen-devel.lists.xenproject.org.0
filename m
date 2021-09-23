Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0A6415C9B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:13:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193731.345106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMfb-00080d-3f; Thu, 23 Sep 2021 11:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193731.345106; Thu, 23 Sep 2021 11:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMfb-0007xo-0W; Thu, 23 Sep 2021 11:13:39 +0000
Received: by outflank-mailman (input) for mailman id 193731;
 Thu, 23 Sep 2021 11:13:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/6DS=ON=epam.com=prvs=9900839950=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mTMfZ-0007xi-LO
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:13:37 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4bb664a8-1c5f-11ec-ba2a-12813bfff9fa;
 Thu, 23 Sep 2021 11:13:36 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NAlmGm001951; 
 Thu, 23 Sep 2021 11:13:34 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b8pfegkp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 11:13:34 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6884.eurprd03.prod.outlook.com (2603:10a6:20b:2de::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 11:13:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 11:13:31 +0000
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
X-Inumbo-ID: 4bb664a8-1c5f-11ec-ba2a-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfcAZxsSdMPBBvFzpvCmDiR3U/RbP3XiWoPB2UOtThnaqG8UA2iY+J1xnV0gfWrBV4qMS86KHDMumVEUC6JBG2J8Lfnr8mxqkAxJ4cLRE3dKP6rbDDyoZuJOK/mVvBDRUIeesecE/59pRbgbOaR6+nPnjWx+oeU+QlAPQMYO1zyrvN+dnjxKVYrvgWW8XtI+aK/LHmjgqaqTG2feUIB9v0DwvxJDRfLHPfIxgJSyLZa85h+bRlopGQ6mGx9BkSds1vn1JiOODdYoAQQ7jhkPG/3AIiUfAJotTeo4FiOuw33/GK7nMZUzoe9F+Xtz2LnOlCY3EqtQ1jLrNVBNAVmp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bmH2R3i2RP4dHzfHu0s3hjen1sJwkocnlF0NpX9KS3U=;
 b=bTXRt/Yn1P3/zxPynK7G3HSFruDhiBZyyIZNioSBsBs9Z6Yr8QmRTibOFkBtX02J9IbAe9oMcG26In+zbyB1rcCjs6OXs6dHth/PHF5pr/xke+0bpThEhMyuCZ8wy6YDqoRpXuC1ZCfslp/GO8yWIho1yy3RqFyjnD0NPvCdonk6voOVr6YtLxEXr1oQ9ur/SeNBXw5mJ2t5zQa4kaEADIU3vCcnFtXOJ8+xWKX0voQW4pxZD9XkyMg/brg32TI5NeeYqFL3ewAP+bRaY7GcRg57SRzMa9ODoYpjbqiaoHtNQszp1FPXio8zJafkS0AWfIQhDsuVVSau2CmWbzxONA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmH2R3i2RP4dHzfHu0s3hjen1sJwkocnlF0NpX9KS3U=;
 b=QZ7igPuNoRlyN6fe9VZsvZoOn25oA/kiuXFVrgq77Mw3Zemm0rV+agWPLhepw8YRWVPBh1AKgk17X2CmdsG1jxJOBl4d3frEYY1Ci+5BLPw9AwoSY8jd+KNCG2h7PEfrjHQ/0uvvsoCgS8NMiMkKJa9b7k8WhAoq22V3sqf8n9weorZJCDPY00BvgmWbE2EXdfK1IxWs9zX2/sdkw0JwaMBuQFF/aFe5mD+GNN5WqmWtvzNSDTxBLv4MYlOS6p+KAKMN/NBwX4wNFYu7HNMaF6APym6gDgzCrOE81bBZ72vSMt+qUf47L2FvYON/tjPOm8yXEuQ2m1NvniJsxPLm7A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] xen-pciback: prepare for the split for stub and PV
Thread-Topic: [PATCH v3 1/2] xen-pciback: prepare for the split for stub and
 PV
Thread-Index: AQHXsGDshY1QGXQ13Ui5WskBVnVMCauxdpMAgAAAwIA=
Date: Thu, 23 Sep 2021 11:13:31 +0000
Message-ID: <4efeaf1e-26d4-a2f0-89ab-1a9d795f1f5a@epam.com>
References: <20210923095345.185489-1-andr2000@gmail.com>
 <d12b0bcd-e998-d4c5-e673-9c13a864eea4@suse.com>
In-Reply-To: <d12b0bcd-e998-d4c5-e673-9c13a864eea4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e3beadf-a73b-403e-a635-08d97e832d7a
x-ms-traffictypediagnostic: AM9PR03MB6884:
x-microsoft-antispam-prvs: 
 <AM9PR03MB6884C2EB66E360F3A0012759E7A39@AM9PR03MB6884.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DxJmgmjWZp9KxcncOdtwYajJh1AAapFALq8YaWsGFuQEENKbfR3QGeaks+uh+7mCyh0pjbfP63JW5a5GxxDhYbldf1lNdGrNkiJjTJQqISzMgaPnOcB1glXIV/W4qzGDqWD47s8bfkb9A741adlpmh+w90BnQnYO4d9OvI4GmBDS7YN8Qd4wfvrzT+l00OErO/P/FUyBl1rQtahWGtBcLMbHfGl/YG5vJMG4/idQvZdNigAN/6xssaF8pnuXSq7xtDU9zhw9Q6icSmcG+RW/aYVxj5W8OL8udSaN/l4UPa1t6Bl6oIB8Oej8z7UppR84fyaGQR/gF1SFWBVtHTu1RIz2vGbPq/7ZHzZIsio8VXmS/uE+gvj6xsz8jaQAUjAUteVffUAYtEYKEafJnbrIZdeJTFD96MrGnNGwSMojrwshcDOabBWk0Szkvw5t4geieKg3bKm79/+W9OdzyIR0VlUX5tlfwdtl7fSslWpYlq7M+5zspaVKuTEizLMs9R+GKqLoQgD0VTxtuZDKLKD5GHPApz6iwJE0H4EXGFR18uA0Ha2xtZZbUBws3QGSG0LLYP9sgL6oLvtrXElM6OqPQ1hxI5qZKUvcorW+cNNB9KRkgQVdKQBD1B5b3/g9hhhuOXXwtbdJt6IeIayr9+6xuWM2cy6h7yYmVKUBLJrIg4v2wlNNCFXI0BWbsXUxU+YjHlgMcIkIWlBeQRrgrH9OeD8OL+WEm4fxZI/XWBsvUu0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(316002)(54906003)(83380400001)(186003)(6512007)(5660300002)(8936002)(110136005)(2906002)(26005)(31696002)(508600001)(4326008)(6506007)(2616005)(71200400001)(31686004)(53546011)(122000001)(66946007)(38070700005)(76116006)(66446008)(64756008)(91956017)(38100700002)(66476007)(66556008)(86362001)(36756003)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eXFPcnV4TFdHTlVzWk4xMFB1T1ZZQWJXMmNrcGphdUNXS0VMVzNtL01IZVIx?=
 =?utf-8?B?UHVTT0NGRHJFNmZkcWJyaFNJZEYwazVReElWdFNKMEkwSWt5eXQrT1FrWlRK?=
 =?utf-8?B?by9lTGZZZG5tdkZXM1MreDVDNmM3STNHaUdKaVJ1Mm5YNmFKcVNGbFJhUzB1?=
 =?utf-8?B?UnN6YnhYZE9mQnFPcCtGamtmOXVuSVBWQU9kU0xiUU5TNUNiYjZrQUFXbnN2?=
 =?utf-8?B?WkFXWWVCdURxbkhFRk5LL3NvdWUvYUZ4ak5JVnZSa3pmdXl1WWxDcnY0Myt3?=
 =?utf-8?B?dGJzZWdDQ2w4QmpiODk1S3BTQVVjeGFHTzRDWHlRQjQ4Vk14UkNQckxxMUw5?=
 =?utf-8?B?MmwvR0k4WWd3YVpuZG1SVDdibko2eGRyMDZxTWxzZGI2bUZaNmJCVWxWQmdS?=
 =?utf-8?B?Rll0bU9qY081M1FTUFJrRUpNWE1xdERnVEZOVkl4alU2azNUQXRISDVYOFdx?=
 =?utf-8?B?RWxpQ3d0alFzYlVMQjZsS2Y5V045anZUSVdLak9MMm1ZQncvZUsrNENlOGNC?=
 =?utf-8?B?RExzUHFEVm5VaUd1THZTTlhBNm1IWUlCMXBaSWdOa2JkdS9mQzJ1UEtlSHgr?=
 =?utf-8?B?UHVZMDdIYmdUOXQ4SG1mYlVFWnpOd1daaytHN0NKci9HaTJtcXpLZ3ROUkRE?=
 =?utf-8?B?b2tTaG5Md2xDeTB6Wi9aVlUxbTRqdGlFL016aFNNcW1EV2pmTUZMVGl6TzNC?=
 =?utf-8?B?VU9iTUJNdVpOQ29nVy9Eb2dPUkJuSnJ0V1FRZVlNaWhHWGdhTDZrMTJERUpH?=
 =?utf-8?B?a3RINWVyMVRyLzBtTmQzdXdTL0tKbDJyOTRTVXA4UFc1eGk0UWNXRUJqWnFu?=
 =?utf-8?B?THkyTHQyOUxUektKOW9ZVGx2NE4vaE9uKzhWOG1ad0RPMVpxdUdTL3hFdGhr?=
 =?utf-8?B?RERhU1BOc09nOGc3eFkxZ29SOGtZeU9zRmtUUko4TU5Ea2JSWlpqbHV2L1Zl?=
 =?utf-8?B?enp2NUxlRDl3VWY3MUFiaUQ1RkFHUUhSZTZTZFlDRXJiNXFUMWZ5OEp4dzBy?=
 =?utf-8?B?dXVPc3VHQ2lGTUVhY1VQSEE0YkptTVBUbVNMSUdkYlhhMHl1TFlrd25MRy94?=
 =?utf-8?B?U3pGRE1SQkFDdXduakVwRlZZMk9kZDJMYkJNSFU4MndOOFRHRUxmNlRDaHpv?=
 =?utf-8?B?Y3JXNGJFU2dpejlCZVY3TjBQQ1BaWjVlTnVNUUlCOXlxOVU1Umx0aURROW13?=
 =?utf-8?B?S3NoMXIzWDBvMU1BSzJBNTUyS2ZRaE56c1M3QVY4NWI4TWxIY0ZyYlNzRlhN?=
 =?utf-8?B?bjNjcFNqTFpMTm5rMzJXTW56Q0lwcXJJTGJkRjFnMDhmVUJGb0FjV3NuZzgz?=
 =?utf-8?B?cmlNcWNhaEZFbFNsWXowdEk0LzVWaE83Q2hNKzdIM3VVL3dIeWNBYTAyRVp2?=
 =?utf-8?B?TXlFMzFMTXlvZ2NSaEV6SVFUYThHK2QrNVBIamFsMUFYYWVibjYraGxzcGF5?=
 =?utf-8?B?TEhDTE5lbVc2aXh1VExvWVl4L1NCOUd4NlY3QXpUT1ZMVmc2ZzMrbm1PUC9w?=
 =?utf-8?B?YVpESzM3bEx1dE5NREJGSk14S0VtaVJodS9IdEx6Qmg5VVNFZUVNTjU0L0U2?=
 =?utf-8?B?NHBTR1JuU1h5MlphQ1NyWnZUb0FWRW9KVmFIMm9UbWo0dTlUTVJBRDFGSVVy?=
 =?utf-8?B?UXQ5cTBhQTZYZnNMOU9FUUpBcmtydkZpbVdyVXkvYWdLZVJQeHR4K2RId3pv?=
 =?utf-8?B?Uk1FVFQ0c2VNRWZwMDdjeWJiWXdwSE8xUUNsRzlsZ0daaDJtdGdTVDF4UWFp?=
 =?utf-8?Q?CA5N/rDvoeC7V4ECCgUtmyp480ykueYKQo5WYg2?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <86AA8D9B9F38F84AB71E7D5618A72D71@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3beadf-a73b-403e-a635-08d97e832d7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2021 11:13:31.7577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SLSPo3VMtIxktad63t9EFZ8nUDAlceuMa3BQeXGWL/HI1YBUslcPMUhs08MsZh9B/mcJMqYwTGfobRUcTK0SBTu0hxXWZx0aQNXZdB84vn1bub4ZA0r5O9jpxACOvkuV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6884
X-Proofpoint-GUID: oSKDCu5391jkehK1iYZvSdqW8hDBFR2-
X-Proofpoint-ORIG-GUID: oSKDCu5391jkehK1iYZvSdqW8hDBFR2-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_03,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109230070

DQpPbiAyMy4wOS4yMSAxNDoxMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIzLjA5LjIwMjEg
MTE6NTMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gLS0tIGEvZHJpdmVycy94
ZW4vS2NvbmZpZw0KPj4gKysrIGIvZHJpdmVycy94ZW4vS2NvbmZpZw0KPj4gQEAgLTE4MCwxMCAr
MTgwLDM0IEBAIGNvbmZpZyBTV0lPVExCX1hFTg0KPj4gICAJc2VsZWN0IERNQV9PUFMNCj4+ICAg
CXNlbGVjdCBTV0lPVExCDQo+PiAgIA0KPj4gK2NvbmZpZyBYRU5fUENJX1NUVUINCj4+ICsJYm9v
bA0KPj4gKw0KPj4gK2NvbmZpZyBYRU5fUENJREVWX1NUVUINCj4+ICsJdHJpc3RhdGUgIlhlbiBQ
Q0ktZGV2aWNlIHN0dWIgZHJpdmVyIg0KPj4gKwlkZXBlbmRzIG9uIFBDSSAmJiAhWDg2ICYmIFhF
Tg0KPj4gKwlkZXBlbmRzIG9uIFhFTl9CQUNLRU5EDQo+PiArCXNlbGVjdCBYRU5fUENJX1NUVUIN
Cj4+ICsJZGVmYXVsdCBtDQo+PiArCWhlbHANCj4+ICsJICBUaGUgUENJIGRldmljZSBzdHViIGRy
aXZlciBwcm92aWRlcyBsaW1pdGVkIHZlcnNpb24gb2YgdGhlIFBDSQ0KPj4gKwkgIGRldmljZSBi
YWNrZW5kIGRyaXZlciB3aXRob3V0IHBhcmEtdmlydHVhbGl6ZWQgc3VwcG9ydCBmb3IgZ3Vlc3Rz
Lg0KPj4gKwkgIElmIHlvdSBzZWxlY3QgdGhpcyB0byBiZSBhIG1vZHVsZSwgeW91IHdpbGwgbmVl
ZCB0byBtYWtlIHN1cmUgbm8NCj4+ICsJICBvdGhlciBkcml2ZXIgaGFzIGJvdW5kIHRvIHRoZSBk
ZXZpY2UocykgeW91IHdhbnQgdG8gbWFrZSB2aXNpYmxlIHRvDQo+PiArCSAgb3RoZXIgZ3Vlc3Rz
Lg0KPj4gKw0KPj4gKwkgIFRoZSAiaGlkZSIgcGFyYW1ldGVyIChvbmx5IGFwcGxpY2FibGUgaWYg
YmFja2VuZCBkcml2ZXIgaXMgY29tcGlsZWQNCj4+ICsJICBpbnRvIHRoZSBrZXJuZWwpIGFsbG93
cyB5b3UgdG8gYmluZCB0aGUgUENJIGRldmljZXMgdG8gdGhpcyBtb2R1bGUNCj4+ICsJICBmcm9t
IHRoZSBkZWZhdWx0IGRldmljZSBkcml2ZXJzLiBUaGUgYXJndW1lbnQgaXMgdGhlIGxpc3Qgb2Yg
UENJIEJERnM6DQo+PiArCSAgeGVuLXBjaWJhY2suaGlkZT0oMDM6MDAuMCkoMDQ6MDAuMCkNCj4+
ICsNCj4+ICsJICBJZiBpbiBkb3VidCwgc2F5IG0uDQo+PiArDQo+PiAgIGNvbmZpZyBYRU5fUENJ
REVWX0JBQ0tFTkQNCj4+ICAgCXRyaXN0YXRlICJYZW4gUENJLWRldmljZSBiYWNrZW5kIGRyaXZl
ciINCj4+ICAgCWRlcGVuZHMgb24gUENJICYmIFg4NiAmJiBYRU4NCj4+ICAgCWRlcGVuZHMgb24g
WEVOX0JBQ0tFTkQNCj4+ICsJc2VsZWN0IFhFTl9QQ0lfU1RVQg0KPiBEb2VzIGtjb25maWcgbm90
IGF0IGxlYXN0IHdhcm4gYWJvdXQgdGhpcz8gVGhlIHNlbGVjdGVkIGl0ZW0gaGFzIGENCj4gImRl
cGVuZHMgb24gIVg4OCIgY29uZmxpY3Rpbmcgd2l0aCB0aGUgImRlcGVuZHMgb24gWDg2IiBoZXJl
Lg0KDQpXaHk/DQoNClhFTl9QQ0lERVZfU1RVQiBkZXBlbmRzIG9uIFBDSSAmJiAhWDg2ICYmIFhF
Tg0KDQpYRU5fUENJX1NUVUIgaGFzIG5vdGhpbmcsIGp1c3QgYm9vbA0KDQpYRU5fUENJREVWX0JB
Q0tFTkQgc2VsZWN0cyBYRU5fUENJX1NUVUINCg0KPg0KPiBKYW4NCj4=

