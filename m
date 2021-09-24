Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51873416B46
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 07:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194928.347325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTduT-0002YX-BL; Fri, 24 Sep 2021 05:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194928.347325; Fri, 24 Sep 2021 05:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTduT-0002Vh-7u; Fri, 24 Sep 2021 05:38:09 +0000
Received: by outflank-mailman (input) for mailman id 194928;
 Fri, 24 Sep 2021 05:38:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Coby=OO=epam.com=prvs=9901c588ba=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mTduR-0002Vb-0w
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 05:38:07 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 976e6392-1cf9-11ec-baa9-12813bfff9fa;
 Fri, 24 Sep 2021 05:38:05 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18O3wOWd022021;
 Fri, 24 Sep 2021 05:38:04 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b93g78f5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 05:38:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6322.eurprd03.prod.outlook.com (2603:10a6:20b:15e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 05:37:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 05:37:59 +0000
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
X-Inumbo-ID: 976e6392-1cf9-11ec-baa9-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3sDiaUboNg+WxdsGbk9SHJe6cSCbu/df5nlFYt4p63U0jyY8jCzM3fbshevsfq29yjFMiPWZlxaPRdP3CbLyp6xstkCPA2l0XgVFVgW7kXfmOkiDvjFcDP9PjIPurUgqSPsN/YRy7AFqMX7YlPWXKm5osUM86D7Vpv4cO+jJd+Q5XoXvZ0h4Z/O28LjGeglxkGzMPg4g6vgRJw+I/Q4nH6lIvnyH2nCB/VbeaxEQ/2his+oR7dxlk/DQtBoaIYjUla+QZSP0FGI7QvPTwa/lR1KXKhzqYZ5ZNYAdEAXclMazQ5DYgHNLQOeZ2zh+1EmmTjwUdWdFvWOOz7wg6WU9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6Fd3E1E5kG9ArBNNIfiV0R2o1x38+reHDTauKWc6XF0=;
 b=DhybKxS+fqtQzji0e/NaVOb8Rd8/uIZB1aqzsCFMJBnKcqmdCfCz7tAI7Ch52LJB2E2bFmg+9mwmLogMYL8pq5SdvIEYZBGwMGcnGWGBIinxgbvTByoegltBYOZlWTQU+uqDwAqTQHTJE7Hj4QJttqVLYssEl4pg+WGhm/Z26VBazicGtB6/sJ2nnmRjWJQsDqeSCoxkYab/KwvKRnr4D510Xm1PzDtrYIrJUP+trKZVVsULgZvgGbRNfg3iuQQ3oxpxU/UD6cOnxZIjWnSFOTAVgnGFiuxR7hg5oEvRqCW924QtLz/JvdB6IQ2Jw3mID2Yw0hdrriD22KrnXoRNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Fd3E1E5kG9ArBNNIfiV0R2o1x38+reHDTauKWc6XF0=;
 b=CafRroWl+pWb5K+Big+feEUQ+rDfkfsATTOhFvCCzR25gnUWzM5WxYXBUZh0SnBGZVGVuY4oB/FBtk6Dr3f7a9K5sAiRrKCxqEtNzNKjkXPDJfrFXnPWDciMfGg5QaQE2KUM0sfzjHS2J0xxbCyvoYOaLC9jRlLGwpcSJHQztiHk1r/7yXmtXFpx3ljXmUrdkq1vhRvZTbTXl7FFnnKP088dJ5o7xDh2KIEET4EGYFW2huLj+tylYEVXIoW9/BdE4WhDnaMFtOdtwxq4Rk01tnhnQFfL+LrlRphgR/gCJjYSY72nF7d7dptokGkaASq8WvY5s1CWGGsShCN5ouEhiw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "jgross@suse.com"
	<jgross@suse.com>,
        "julien@xen.org" <julien@xen.org>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>
Subject: Re: [PATCH v3 1/2] xen-pciback: prepare for the split for stub and PV
Thread-Topic: [PATCH v3 1/2] xen-pciback: prepare for the split for stub and
 PV
Thread-Index: AQHXsGDshY1QGXQ13Ui5WskBVnVMCauyBw8AgACk2YA=
Date: Fri, 24 Sep 2021 05:37:59 +0000
Message-ID: <9fa3bd45-6605-7a77-e0b7-3fb91f093eff@epam.com>
References: <20210923095345.185489-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2109231217050.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231217050.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a71aeaae-7311-495b-44f1-08d97f1d783e
x-ms-traffictypediagnostic: AM0PR03MB6322:
x-microsoft-antispam-prvs: 
 <AM0PR03MB6322513C3D69F5778A24BCBDE7A49@AM0PR03MB6322.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Rq7Fc1MfZbHfCgRRRc8FfZuKwqXUhvkFy+T4PED7Wdvnk8F9frxSaFz8OuOklZIqDNWV5V8nXJZLSDEhR2SW3FoP8QQPFbOwKYcT+bau2s/nvpHlh9ClPfEK5tIir4AgMAjLaic57twM8G0nsuyOF9+dpRNjOdStaCUaXOhQ36zSJayiXBaRX6VGqTnFmM4N1mW86Fo4Yt0f1WmsEJzoE+9swhad2ZJoXaJ1zIp0lvr1yxUAFNqJIpvlg8fNVZOt3VIcWDdCU6LdhaSJgIXJmokxzdISU9cOuYs/R25qYH7gzwga4RD5YsWVRPriHhp6fMhT9UWKWr420FxDgZWCQj4uOI10JFGlXcbtETWsl66Rz80oqcmv41tmCDknoSbJwNHqSgC1miOcnUixv2naTlW9Agi6R6Zp5RNBOfEUErrEp9a4wihRZDcQ3OkIpaBbLKaMnLTH1NHhZofB1I/1M/o8oFrAjoej0BNB02Bku3rPND/EpNElQ/fvcFJfQovhaVdnWI7kzEnwcMRCyNi+IKvmjC7GiySUduaLk1iRP0LcXVGmd6Ngo62NJt2RDQwTx2DivQB3BkzwHbbgpJAiZiW7cdOQW1ofV3MxdWOKKD7ZEuvnkCGcfCke7KNCJOtNLqZEFyVrkeq6d1f1UIZks++6nAGBwLyKGUbzHGsnIXVzNggKM+Uocx+m7qZksvYAaPae509L7UnuKMg8QBxdVymiv1TFXBZMTttHpT0lwcvovk4uEKdn9GCK9gRSOQnZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(110136005)(55236004)(54906003)(71200400001)(122000001)(186003)(83380400001)(6512007)(31696002)(66446008)(64756008)(38100700002)(86362001)(508600001)(38070700005)(66556008)(66946007)(36756003)(66476007)(5660300002)(8936002)(2906002)(26005)(76116006)(91956017)(6486002)(8676002)(31686004)(53546011)(2616005)(316002)(6506007)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TU9ya2hmU3R6QU5XdVpqT3ljMEI4TlhPQStwWGd5SlZTYlBaQUNTS3lvZ2t5?=
 =?utf-8?B?V0ZORElKQTFWcDZmNERxYVRjRnVtWmJnamNZVG5hV1BPYjlmTWhCSWxyV3Zu?=
 =?utf-8?B?RGJVYm5YditycFZGT1puVUNwYUtPci9mNW02R2dnekppWGw4anlYUHJnTUl3?=
 =?utf-8?B?VE83aVNxRUx0UDhtNXdoMmI2UXA5a29XVm5lUWFRdjU0cml4UUxSdHNKV1ho?=
 =?utf-8?B?citKc0d1b0pWSDF0dzczSUdJejhBNGhuM3gvY2FocmtVMDJaZGw2SGI5UEZj?=
 =?utf-8?B?NnFRNVpmTVFCSlZwNVBSNUxxZjUrN1pCdSt3aERCangrVFdMRElEZUtlc1Rs?=
 =?utf-8?B?RW9xVy9oUzlBWi9aQU1ad2JnbndlUTJvbTA0M0U2aFBES0lXTXVucytUN2p2?=
 =?utf-8?B?ZDlsdFRIRFh5SENVbkI2K3N1VW1WTnZTTXVJL2ZodXlyZkdBcFdGU3M3NURh?=
 =?utf-8?B?SDlBeXpXRVNpTW1yOU9IbTRHdEhDakJGeXVNbXpGbGd1UkVEUHRQWEtMTGZV?=
 =?utf-8?B?OTNudm03VmYvci9TcE8zaTZIMkFFVUd5ZjBvYytOcSs4OGk0UFQ0dFArRkM1?=
 =?utf-8?B?QUdqQUc2Y0VOOFNOTWtqdmdRMTQxOERwQXZteXNHNGF5SGNpLzdzMnI4cFB6?=
 =?utf-8?B?OW9QWDlzZDNTQ3Y2NW1XZTVOemdMVnZkK0N3RktHd01sTDhIenZHL3oxSlNy?=
 =?utf-8?B?SzROVGN5UDk4WmVaUzJWOXRUaEVmN0xWa0NIZUJMeGdHcCtteTN3eUp2OEQv?=
 =?utf-8?B?MTBpajdaSDBJdjA2a2hXTXQ3bU15OXFld3hyN2NPUlF1UzR3SEhYVGYyY3dD?=
 =?utf-8?B?Z0FEOUJ3Zmg5NlJ1WHZPbDUrVWNBRG53QVFISE5EQnNENGNpQ29aUGpyL3VE?=
 =?utf-8?B?Rm9STDBFMDl5akZPVWZhT3JBOUpqZWMrdWllZUVXZm1YbUE2RDUxM1pSRnc1?=
 =?utf-8?B?aHVTZ0Jhdkk1aXNBbmY3djhTMlljcUhYNVBPRU9YSEZWalpwYmVQd1NOSjE5?=
 =?utf-8?B?US94aUhZTm5wcjdqNnBFaVVURFdGZVJhTUNETDRSR3Voams0bmdKVytTV01J?=
 =?utf-8?B?K0d3a2hHQm5nY2tsQ2hVRVBKQnZRWWtNeXExVVNZcjdwVkdVelBraTh3ZXZN?=
 =?utf-8?B?QkppS2RTaytha2JWcVdBSGZjakVLQlRFMXJ6dk9peEhIZE14emNUWFVJcDFF?=
 =?utf-8?B?Mi9XczJRaisxK29zY0VhcFVzT3MyZXFTK21lWEpBVUplTzFOVXBldTZXU2h1?=
 =?utf-8?B?WE1ucWZsUDJxay9IUWlmNHBNeXREaXdhMTZzOU9hdzdrWVBJcVVFektBTlBW?=
 =?utf-8?B?YjN6b2piRXpZanhRN1k0WERJd1l3Ynh3ZnU3ZXd0OVU0MG5Jai90NXlRaWtX?=
 =?utf-8?B?ODFLV0FOL2JJTE9XajNtYjdIOGk4b1JYREVUeHV5NmFQdGxtRFdlUTFWb1lw?=
 =?utf-8?B?TE4vZGJKdEpNUno5NG5FNjBhMHl6NDVlamJ6dDlYOUFwUmk0WXRYTy9UbjB1?=
 =?utf-8?B?OENSUWtOc2d1aUVVTEUvUmFnSnJseVpJYkdtRHNoNUZOTzRBblNNWk9Gd016?=
 =?utf-8?B?V01EaTFLdWFrMy96cXFCcy9qZm9GS2ZvaDZTR2dOSFBXTTdLZ0F3Vk14RTN3?=
 =?utf-8?B?OXArS3F0cm4vNndvZm84Zmx3TWxWREpsVmdpbmdUZGhLaHFBMVhJTXZPSC9k?=
 =?utf-8?B?cmd5NURtTTl3bVFGTmpUQmdWaS8wcENXaHR0SytQcWFTQk5ZeDhtV3NHeGd6?=
 =?utf-8?B?OVVUVGVraXk3UkVydFJTa0kxUUUzZWc5MVphT1EveG5ocDhnUGlGTjVQbjkx?=
 =?utf-8?B?MExHek53amxhRUZEVllldz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <149BF2E93DE3A540A631D03426217848@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71aeaae-7311-495b-44f1-08d97f1d783e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 05:37:59.6975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PcJuUaYVv6WTtlxDjI9ttXide0zBdEC/m6N/PPqXGyMa7UKv6BpzOabeleGm2WcGez8J3K0OIh4bZ9Ozm06Ej2EbajKBH56hMTo7+v6aCiKTZL5YJRUCwYsgnkLbRQAM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6322
X-Proofpoint-GUID: VPe82lMRurUDbbIx5lU38aspdAM_CR9H
X-Proofpoint-ORIG-GUID: VPe82lMRurUDbbIx5lU38aspdAM_CR9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_01,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109240032

DQpPbiAyMy4wOS4yMSAyMjo0NywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBUaHUs
IDIzIFNlcCAyMDIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEN1cnJlbnRs
eSBQQ0kgYmFja2VuZCBpbXBsZW1lbnRzIG11bHRpcGxlIGZ1bmN0aW9uYWxpdGllcyBhdCBhIHRp
bWUuDQo+PiBUbyBuYW1lIGEgZmV3Og0KPj4gMS4gSXQgaXMgdXNlZCBhcyBhIGRhdGFiYXNlIGZv
ciBhc3NpZ25hYmxlIFBDSSBkZXZpY2VzLCBlLmcuIHhsDQo+PiAgICAgcGNpLWFzc2lnbmFibGUt
e2FkZHxyZW1vdmV8bGlzdH0gbWFuaXB1bGF0ZXMgdGhhdCBsaXN0LiBTbywgd2hlbmV2ZXINCj4+
ICAgICB0aGUgdG9vbHN0YWNrIG5lZWRzIHRvIGtub3cgd2hpY2ggUENJIGRldmljZXMgY2FuIGJl
IHBhc3NlZCB0aHJvdWdoDQo+PiAgICAgaXQgcmVhZHMgdGhhdCBmcm9tIHRoZSByZWxldmFudCBz
eXNmcyBlbnRyaWVzIG9mIHRoZSBwY2liYWNrLg0KPj4gMi4gSXQgaXMgdXNlZCB0byBob2xkIHRo
ZSB1bmJvdW5kIFBDSSBkZXZpY2VzIGxpc3QsIGUuZy4gd2hlbiBwYXNzaW5nDQo+PiAgICAgdGhy
b3VnaCBhIFBDSSBkZXZpY2UgaXQgbmVlZHMgdG8gYmUgdW5ib3VuZCBmcm9tIHRoZSByZWxldmFu
dCBkZXZpY2UNCj4+ICAgICBkcml2ZXIgYW5kIGJvdW5kIHRvIHBjaWJhY2sgKHN0cmljdGx5IHNw
ZWFraW5nIGl0IGlzIG5vdCByZXF1aXJlZA0KPj4gICAgIHRoYXQgdGhlIGRldmljZSBpcyBib3Vu
ZCB0byBwY2liYWNrLCBidXQgcGNpYmFjayBpcyBhZ2FpbiB1c2VkIGFzIGENCj4+ICAgICBkYXRh
YmFzZSBvZiB0aGUgcGFzc2VkIHRocm91Z2ggUENJIGRldmljZXMsIHNvIHdlIGNhbiByZS1iaW5k
IHRoZQ0KPj4gICAgIGRldmljZXMgYmFjayB0byB0aGVpciBvcmlnaW5hbCBkcml2ZXJzIHdoZW4g
Z3Vlc3QgZG9tYWluIHNodXRzIGRvd24pDQo+PiAzLiBEZXZpY2UgcmVzZXQgZm9yIHRoZSBkZXZp
Y2VzIGJlaW5nIHBhc3NlZCB0aHJvdWdoDQo+PiA0LiBQYXJhLXZpcnR1YWxpemVkIHVzZS1jYXNl
cyBzdXBwb3J0DQo+Pg0KPj4gVGhlIHBhcmEtdmlydHVhbGl6ZWQgcGFydCBvZiB0aGUgZHJpdmVy
IGlzIG5vdCBhbHdheXMgbmVlZGVkIGFzIHNvbWUNCj4+IGFyY2hpdGVjdHVyZXMsIGUuZy4gQXJt
IG9yIHg4NiBQVkggRG9tMCwgYXJlIG5vdCB1c2luZyBiYWNrZW5kLWZyb250ZW5kDQo+PiBtb2Rl
bCBmb3IgUENJIGRldmljZSBwYXNzdGhyb3VnaC4gRm9yIHN1Y2ggdXNlLWNhc2VzIG1ha2UgdGhl
IHZlcnkNCj4+IGZpcnN0IHN0ZXAgaW4gc3BsaXR0aW5nIHRoZSB4ZW4tcGNpYmFjayBkcml2ZXIg
aW50byB0d28gcGFydHM6IGV4dGVuZGVkDQo+PiBQQ0kgc3R1YiBhbmQgUENJIFBWIGJhY2tlbmQg
ZHJpdmVycy4gQXQgdGhlIG1vbWVudCB4ODYgcGxhdGZvcm0gd2lsbA0KPj4gY29udGludWUgdXNp
bmcgQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VORCBmb3IgdGhlIGZ1bGx5IGZlYXR1cmVkIGJhY2tl
bmQNCj4+IGRyaXZlciBhbmQgbmV3IHBsYXRmb3JtcyBtYXkgYnVpbGQgYSBkcml2ZXIgd2l0aCBs
aW1pdGVkIGZ1bmN0aW9uYWxpdHkNCj4+IChubyBQVikgYnkgZW5hYmxpbmcgQ09ORklHX1hFTl9Q
Q0lERVZfU1RVQi4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gLS0tDQo+PiBDaGFu
Z2VzIHNpbmNlIHYyOg0KPj4gICAtIHN3YXAgdGhlIHBhdGNoIG9yZGVyDQo+PiBOZXcgaW4gdjIN
Cj4+IC0tLQ0KPj4gICBkcml2ZXJzL3hlbi9LY29uZmlnICAgICAgICAgICAgICAgfCAyNCArKysr
KysrKysrKysrKysrKysrKysrKysNCj4+ICAgZHJpdmVycy94ZW4vTWFrZWZpbGUgICAgICAgICAg
ICAgIHwgIDIgKy0NCj4+ICAgZHJpdmVycy94ZW4veGVuLXBjaWJhY2svTWFrZWZpbGUgIHwgIDEg
Kw0KPj4gICBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2liYWNrLmggfCAgNSArKysrKw0KPj4g
ICBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYyAgfCAgNiArKysrKy0NCj4+ICAgNSBm
aWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9LY29uZmlnIGIvZHJpdmVycy94ZW4vS2NvbmZpZw0KPj4g
aW5kZXggYTM3ZWI1MmZiNDAxLi42ZTkyYzZiZTE5ZjEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L3hlbi9LY29uZmlnDQo+PiArKysgYi9kcml2ZXJzL3hlbi9LY29uZmlnDQo+PiBAQCAtMTgwLDEw
ICsxODAsMzQgQEAgY29uZmlnIFNXSU9UTEJfWEVODQo+PiAgIAlzZWxlY3QgRE1BX09QUw0KPj4g
ICAJc2VsZWN0IFNXSU9UTEINCj4+ICAgDQo+PiArY29uZmlnIFhFTl9QQ0lfU1RVQg0KPj4gKwli
b29sDQo+PiArDQo+PiArY29uZmlnIFhFTl9QQ0lERVZfU1RVQg0KPj4gKwl0cmlzdGF0ZSAiWGVu
IFBDSS1kZXZpY2Ugc3R1YiBkcml2ZXIiDQo+PiArCWRlcGVuZHMgb24gUENJICYmICFYODYgJiYg
WEVODQo+PiArCWRlcGVuZHMgb24gWEVOX0JBQ0tFTkQNCj4+ICsJc2VsZWN0IFhFTl9QQ0lfU1RV
Qg0KPj4gKwlkZWZhdWx0IG0NCj4+ICsJaGVscA0KPj4gKwkgIFRoZSBQQ0kgZGV2aWNlIHN0dWIg
ZHJpdmVyIHByb3ZpZGVzIGxpbWl0ZWQgdmVyc2lvbiBvZiB0aGUgUENJDQo+PiArCSAgZGV2aWNl
IGJhY2tlbmQgZHJpdmVyIHdpdGhvdXQgcGFyYS12aXJ0dWFsaXplZCBzdXBwb3J0IGZvciBndWVz
dHMuDQo+PiArCSAgSWYgeW91IHNlbGVjdCB0aGlzIHRvIGJlIGEgbW9kdWxlLCB5b3Ugd2lsbCBu
ZWVkIHRvIG1ha2Ugc3VyZSBubw0KPj4gKwkgIG90aGVyIGRyaXZlciBoYXMgYm91bmQgdG8gdGhl
IGRldmljZShzKSB5b3Ugd2FudCB0byBtYWtlIHZpc2libGUgdG8NCj4+ICsJICBvdGhlciBndWVz
dHMuDQo+PiArDQo+PiArCSAgVGhlICJoaWRlIiBwYXJhbWV0ZXIgKG9ubHkgYXBwbGljYWJsZSBp
ZiBiYWNrZW5kIGRyaXZlciBpcyBjb21waWxlZA0KPj4gKwkgIGludG8gdGhlIGtlcm5lbCkgYWxs
b3dzIHlvdSB0byBiaW5kIHRoZSBQQ0kgZGV2aWNlcyB0byB0aGlzIG1vZHVsZQ0KPj4gKwkgIGZy
b20gdGhlIGRlZmF1bHQgZGV2aWNlIGRyaXZlcnMuIFRoZSBhcmd1bWVudCBpcyB0aGUgbGlzdCBv
ZiBQQ0kgQkRGczoNCj4+ICsJICB4ZW4tcGNpYmFjay5oaWRlPSgwMzowMC4wKSgwNDowMC4wKQ0K
Pj4gKw0KPj4gKwkgIElmIGluIGRvdWJ0LCBzYXkgbS4NCj4+ICsNCj4gSSBnZXQgdGhpcyBidWls
ZCBlcnJvciBvbiBBUk06DQo+DQo+IGRyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmM6
MjI6MTA6IGZhdGFsIGVycm9yOiBhc20veGVuL3BjaS5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0
b3J5DQo+ICAgI2luY2x1ZGUgPGFzbS94ZW4vcGNpLmg+DQo+ICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+DQo+IGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuDQo+IHNjcmlwdHMvTWFrZWZpbGUuYnVp
bGQ6Mjc3OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0
dWIubycgZmFpbGVkDQo+DQo+DQo+IEkgaW1hZ2luZSB0aGF0IHRoZSBzZWNvbmQgcGF0Y2ggaXMg
cmVxdWlyZWQgZm9yIHRoZSBidWlsZCBvbiBBUk0uDQpBaCwgeWVzLiBUaGF0IGlzIHdoeSBpdCB3
YXMgdGhlIGZpcnN0DQo+ICAgSQ0KPiBzdWdnZXN0IHRvIG1vdmUgdGhlIGRlZmluaXRpb24gb2Yg
WEVOX1BDSURFVl9TVFVCIHRvIHRoZSBzZWNvbmQgcGF0Y2guDQo+IChrZWVwIFhFTl9QQ0lfU1RV
QiBhbmQgeGVuX3BjaWJrX3B2X3N1cHBvcnQgaGVyZS4pDQpJJ2xsIGdvIHdpdGggdGhpcw0KPg0K
PiBBbHRlcm5hdGl2ZWx5LCBqdXN0IHJlbW92ZSAidHJpc3RhdGUgIlhlbiBQQ0ktZGV2aWNlIHN0
dWIgZHJpdmVyIiIgZnJvbQ0KPiBoZXJlIHNvIHRoYXQgWEVOX1BDSURFVl9TVFVCIGJlY29tZXMg
bm9uLXNlbGVjdGFibGUuIFlvdSBjYW4gYWRkIHRoZQ0KPiB0cmlzdGF0ZSBwcm9wZXJ0eSBpbiBw
YXRjaCAjMi4NCkl0IGxvb2tzIGxpa2UgaGFsZi1iYWtlZC4uLg0KPg0KPg0KPg0KPj4gICBjb25m
aWcgWEVOX1BDSURFVl9CQUNLRU5EDQo+PiAgIAl0cmlzdGF0ZSAiWGVuIFBDSS1kZXZpY2UgYmFj
a2VuZCBkcml2ZXIiDQo+PiAgIAlkZXBlbmRzIG9uIFBDSSAmJiBYODYgJiYgWEVODQo+PiAgIAlk
ZXBlbmRzIG9uIFhFTl9CQUNLRU5EDQo+PiArCXNlbGVjdCBYRU5fUENJX1NUVUINCj4+ICAgCWRl
ZmF1bHQgbQ0KPj4gICAJaGVscA0KPj4gICAJICBUaGUgUENJIGRldmljZSBiYWNrZW5kIGRyaXZl
ciBhbGxvd3MgdGhlIGtlcm5lbCB0byBleHBvcnQgYXJiaXRyYXJ5DQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy94ZW4vTWFrZWZpbGUgYi9kcml2ZXJzL3hlbi9NYWtlZmlsZQ0KPj4gaW5kZXggMzQz
NDU5MzQ1NWIyLi41YWFlNjZlNjM4YTcgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3hlbi9NYWtl
ZmlsZQ0KPj4gKysrIGIvZHJpdmVycy94ZW4vTWFrZWZpbGUNCj4+IEBAIC0yNCw3ICsyNCw3IEBA
IG9iai0kKENPTkZJR19YRU5fU1lTX0hZUEVSVklTT1IpCSs9IHN5cy1oeXBlcnZpc29yLm8NCj4+
ICAgb2JqLSQoQ09ORklHX1hFTl9QVkhWTV9HVUVTVCkJCSs9IHBsYXRmb3JtLXBjaS5vDQo+PiAg
IG9iai0kKENPTkZJR19TV0lPVExCX1hFTikJCSs9IHN3aW90bGIteGVuLm8NCj4+ICAgb2JqLSQo
Q09ORklHX1hFTl9NQ0VfTE9HKQkJKz0gbWNlbG9nLm8NCj4+IC1vYmotJChDT05GSUdfWEVOX1BD
SURFVl9CQUNLRU5EKQkrPSB4ZW4tcGNpYmFjay8NCj4+ICtvYmotJChDT05GSUdfWEVOX1BDSV9T
VFVCKQkgICAgICAgICs9IHhlbi1wY2liYWNrLw0KPj4gICBvYmotJChDT05GSUdfWEVOX1BSSVZD
TUQpCQkrPSB4ZW4tcHJpdmNtZC5vDQo+PiAgIG9iai0kKENPTkZJR19YRU5fQUNQSV9QUk9DRVNT
T1IpCSs9IHhlbi1hY3BpLXByb2Nlc3Nvci5vDQo+PiAgIG9iai0kKENPTkZJR19YRU5fRUZJKQkJ
CSs9IGVmaS5vDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svTWFrZWZp
bGUgYi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9NYWtlZmlsZQ0KPj4gaW5kZXggZThkOTgxZDQz
MjM1Li5lMmNiMzc2NDQ0YTYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFj
ay9NYWtlZmlsZQ0KPj4gKysrIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svTWFrZWZpbGUNCj4+
IEBAIC0xLDUgKzEsNiBAQA0KPj4gICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
DQo+PiAgIG9iai0kKENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQpICs9IHhlbi1wY2liYWNrLm8N
Cj4+ICtvYmotJChDT05GSUdfWEVOX1BDSURFVl9TVFVCKSArPSB4ZW4tcGNpYmFjay5vDQo+PiAg
IA0KPj4gICB4ZW4tcGNpYmFjay15IDo9IHBjaV9zdHViLm8gcGNpYmFja19vcHMubyB4ZW5idXMu
bw0KPj4gICB4ZW4tcGNpYmFjay15ICs9IGNvbmZfc3BhY2UubyBjb25mX3NwYWNlX2hlYWRlci5v
IFwNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2liYWNrLmggYi9k
cml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2liYWNrLmgNCj4+IGluZGV4IDk1ZTI4ZWU0OGQ1Mi4u
OWE2NDE5NmU4MzFkIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNp
YmFjay5oDQo+PiArKysgYi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2liYWNrLmgNCj4+IEBA
IC03MSw2ICs3MSwxMSBAQCBzdHJ1Y3QgcGNpX2RldiAqcGNpc3R1Yl9nZXRfcGNpX2RldihzdHJ1
Y3QgeGVuX3BjaWJrX2RldmljZSAqcGRldiwNCj4+ICAgCQkJCSAgICBzdHJ1Y3QgcGNpX2RldiAq
ZGV2KTsNCj4+ICAgdm9pZCBwY2lzdHViX3B1dF9wY2lfZGV2KHN0cnVjdCBwY2lfZGV2ICpkZXYp
Ow0KPj4gICANCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgeGVuX3BjaWJrX3B2X3N1cHBvcnQodm9p
ZCkNCj4+ICt7DQo+PiArCXJldHVybiBJU19FTkFCTEVEKENPTkZJR19YRU5fUENJREVWX0JBQ0tF
TkQpOw0KPj4gK30NCj4+ICsNCj4+ICAgLyogRW5zdXJlIGEgZGV2aWNlIGlzIHR1cm5lZCBvZmYg
b3IgcmVzZXQgKi8NCj4+ICAgdm9pZCB4ZW5fcGNpYmtfcmVzZXRfZGV2aWNlKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KTsNCj4+ICAgDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuLXBjaWJh
Y2sveGVuYnVzLmMgYi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYw0KPj4gaW5kZXgg
YzA5YzdlYmQ2OTY4Li5mOGJhMjkwM2EzZmYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3hlbi94
ZW4tcGNpYmFjay94ZW5idXMuYw0KPj4gKysrIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVu
YnVzLmMNCj4+IEBAIC03NDMsNiArNzQzLDkgQEAgY29uc3Qgc3RydWN0IHhlbl9wY2lia19iYWNr
ZW5kICpfX3JlYWRfbW9zdGx5IHhlbl9wY2lia19iYWNrZW5kOw0KPj4gICANCj4+ICAgaW50IF9f
aW5pdCB4ZW5fcGNpYmtfeGVuYnVzX3JlZ2lzdGVyKHZvaWQpDQo+PiAgIHsNCj4+ICsJaWYgKCF4
ZW5fcGNpYmtfcHZfc3VwcG9ydCgpKQ0KPj4gKwkJcmV0dXJuIDA7DQo+PiArDQo+PiAgIAl4ZW5f
cGNpYmtfYmFja2VuZCA9ICZ4ZW5fcGNpYmtfdnBjaV9iYWNrZW5kOw0KPj4gICAJaWYgKHBhc3N0
aHJvdWdoKQ0KPj4gICAJCXhlbl9wY2lia19iYWNrZW5kID0gJnhlbl9wY2lia19wYXNzdGhyb3Vn
aF9iYWNrZW5kOw0KPj4gQEAgLTc1Miw1ICs3NTUsNiBAQCBpbnQgX19pbml0IHhlbl9wY2lia194
ZW5idXNfcmVnaXN0ZXIodm9pZCkNCj4+ICAgDQo+PiAgIHZvaWQgX19leGl0IHhlbl9wY2lia194
ZW5idXNfdW5yZWdpc3Rlcih2b2lkKQ0KPj4gICB7DQo+PiAtCXhlbmJ1c191bnJlZ2lzdGVyX2Ry
aXZlcigmeGVuX3BjaWJrX2RyaXZlcik7DQo+PiArCWlmICh4ZW5fcGNpYmtfcHZfc3VwcG9ydCgp
KQ0KPj4gKwkJeGVuYnVzX3VucmVnaXN0ZXJfZHJpdmVyKCZ4ZW5fcGNpYmtfZHJpdmVyKTsNCj4+
ICAgfQ0KPj4gLS0gDQo+PiAyLjI1LjENCj4+

