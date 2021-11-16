Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D875452C59
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 09:02:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226188.390803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmtQG-0005qr-HH; Tue, 16 Nov 2021 08:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226188.390803; Tue, 16 Nov 2021 08:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmtQG-0005np-Dl; Tue, 16 Nov 2021 08:02:32 +0000
Received: by outflank-mailman (input) for mailman id 226188;
 Tue, 16 Nov 2021 08:02:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oQI=QD=epam.com=prvs=1954156bad=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mmtQD-0005j6-V2
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 08:02:30 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a723f9a-46b3-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 09:02:28 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG7pwZc018980;
 Tue, 16 Nov 2021 08:02:24 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cc7mt87cs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 08:02:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3374.eurprd03.prod.outlook.com (2603:10a6:803:18::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 08:02:12 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 08:02:12 +0000
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
X-Inumbo-ID: 8a723f9a-46b3-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0Fgw+hBtGH2TaQqqqCEn+tcMj9ZmC+R/b9ixd/xX0JjUue9peR8OuaymNbthWo2w+VWAj+91EjzbEFCNTuEls6Vh9W/CRANTKS8930u03mtqT5d4v2+B30bh8I8nkKqytFaqh091690bxoIDCRNcK1TL5OKTjTWgxgdntFsvWRNBAJNwuTea8lZLWtwoBKnkz2ivGUAYSkU15Swyho0hs1JEqLy89D5e64g44+RhEI67RLVZ7oX0OhhjWYrDebTjdooyZwjyHNM/lQra4WTWh0Z/O9TxUoVslEgXQXxKXgO4G63JJJnY9fmqsviGicJSk086D0p/YKssj9ZDBK5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0It092vHelNtqCYcxURkXempalbmEJAc/vHoWYJW02E=;
 b=lXKkeFD9XpbepqYbzs71Hay+aEUNahLZ+aPxedewhc3OsbxLJl9bITBjz88a0DDw6/V7G44SnzYWxwYy7aW7oL0hJdhJYrbj/s7xrsWEwIExdcdOjIJJDRdaCZUdxK2DyzlMZfAB7I2dJsSee7Si4ahpdFYWQoWsYfFLFyDrxTSuoOHaRudeuNYRo7rApcSLEEwloxIOroN4FkpJxH2fbJA7pBAEQ3yf+smfOP/eDHNk0e9YghU1hbPK8UeAjTbWPhZF1IBZoC0wZhHTq/Nar/FMvP+qnX1Q9HnqR8HiCRKQYEbzYBjpSAfEXi5h3y38hDTNA7PUHHqOKQU0Oiwa9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0It092vHelNtqCYcxURkXempalbmEJAc/vHoWYJW02E=;
 b=jd9AJQSAkfZ22e+ylWL7w6YDJuLEpypax1OGQnr1xHF/TIQw0I2Cb7ErVlemEwdsnQPaVKwqrjTH/vW0FFmvYFuNa+83KwslehrDYQcESHEyKiwDjpx730O/YVdX6942r1bSRYlRvnzGKurJuixQxMWNJRHKuA0pnMxO1irH0kJcr3Fvxf98cdbkLz7+quqok7LHNsyeNJ2D1U0Wua2sflKXn9NjeKjHkrglY9dc7ZLINXwpfscKjNayYoCJga142xdLzyYJMC3P0Y5/wxgFqqqH7jGgSzgLbJQyrc9X5dKqTwLilnGQQJ+G5uX5n02r69nNTxusBSbhVBC3vNTYRA==
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
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 03/11] vpci: make vpci registers removal a dedicated
 function
Thread-Topic: [PATCH v4 03/11] vpci: make vpci registers removal a dedicated
 function
Thread-Index: AQHX0hJJo9UyM/9aC0+aCa7QmYvZxKwE37oAgAD8pYA=
Date: Tue, 16 Nov 2021 08:02:12 +0000
Message-ID: <fcf89dd1-2b9f-1da1-3a95-862475f35d75@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-4-andr2000@gmail.com>
 <afd9fe9d-dd18-9a4b-e43a-f0ae8b2afcf9@suse.com>
In-Reply-To: <afd9fe9d-dd18-9a4b-e43a-f0ae8b2afcf9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a95dcd3-bf06-4a08-5e20-08d9a8d765a7
x-ms-traffictypediagnostic: VI1PR0302MB3374:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB3374F50C992AEDDD1982079DE7999@VI1PR0302MB3374.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3Hg1CcHKogB1TkjiLEI0df8acwxzB7N+eukkKIqlHkA7md5kpcnfSzrip42id2j0lgBrZlxAL/013R6yT6g5ikqfRSfeipyL+KM0dGvWTjoMSFA8Rojg8v7pQDqoyOQYLHQpx2J0qg/fKw+MxOmjZRLHfdpBg0dv9cmtzcBRkoo5lfP1wafl+8znk2Lrg7pIPVEL8odl4lbLRL5nvBZ8STKizhJa/vyqTohkwWNg5+grI0i+DFRL51CWQJfLkVpM2zuLjctuqYvTgr9RaBppMAilrpI8l8WZTiweaDqvFwMaTQ3Rv7zqiuk/mrX+TayLQhbaVaSvnbNLq6T9G3Ir3l5OndYvMywu+joAeww8wwuZvDDGn3/6jeJWS4iSECE2WNkcIoBye5cnzgZDk5PUBfP2rMc0g7M1BkwbC1gxvOfA6/zka6gh7z0/4vo3OjeRH4csx9lY/Kp30Rcy9EXgoyLNb091ttCKBICdJj8l4+fbQRiXUuW0ivq/2BNbkvd8e7LQYAA1ONi/Arr5Jhscgzkdq+AC+P9dub5HEzYSYdpXzek+BZW+uPkHnTiuKWM3WjrdZdl4JWpXaOSMj7WA0bzf2OakwkeZOhrsDcWuAii+lxW4Wjhfyd8Y8MHd+3p9pOQmbGdMBPZUo6xsh8ZSpuxFIozY1O6zYTXm0AqqzNU1ylNSFwSZrTijBI58XwfS02porb24JMgz3nJNJX4Da5UQyB2KRYTze05QnAMXfU+yPY3DzmRBjS9oIa5psaiS
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(316002)(7416002)(38100700002)(54906003)(2906002)(110136005)(86362001)(71200400001)(6506007)(91956017)(76116006)(66556008)(66446008)(64756008)(186003)(26005)(66946007)(66476007)(4326008)(6486002)(31696002)(36756003)(4744005)(508600001)(2616005)(122000001)(8936002)(31686004)(6512007)(8676002)(5660300002)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U1dPS2dVVm0wbFhWN1JraHZyNFNSYXhGYU8ydXlkOHVLd3ZPMDU2NUFjenhN?=
 =?utf-8?B?NnMwY1RaWFlMOEJUZ2pIMEFndG9MU3E3OFoxMGV6RTBPaGlLSGdqQTNnK3RS?=
 =?utf-8?B?dDhoSVRIa0JHSnpIMGd0WjlSQk00Tm5UZ0cwM285M282eExEUml6Nk42aTFl?=
 =?utf-8?B?R3BXYTNrRjByMThwNHNZc1RVOUhrWmduN0xzMzZVVnRwbHpTenh2Z1EyS2Fm?=
 =?utf-8?B?aytWSitWNGdCZEVWTVhHalFNazB4VXA1SjdGVkdMOURWOGZabFBMNEFrT2dB?=
 =?utf-8?B?OFkweWxTd1RhU1YzWFpJMzhyc2JhU2V4b2lVR2hvajYyN1NtRUxyWHNSdVBP?=
 =?utf-8?B?N0hjYzFQSWVCRkxkRytuNUU0STI4V21XcThnRmxSUW01c1ZKa3EvVXI3ZlBU?=
 =?utf-8?B?eHFmRjVramN2Z09XeDF6RmVoZFdVanRTMXNDVnRzUktySVR5elY2cGFuc2dx?=
 =?utf-8?B?WmY3QjNxdnVGQ01FMWdLcXhDM1A0MUZkZzM4K1NCS2VKajMwVzdidDNQcTh3?=
 =?utf-8?B?eHFRQm1GTzZaaUJLeExSMmtZTGtITlU5SHNiK1FIVnVDTUhyNWQ0cGpYdVF4?=
 =?utf-8?B?VTd1T1RXaTNiZjR3dWhjemJIVzNkU2JzbG4vQTg4MTZWSTdibTV5M2lyYmth?=
 =?utf-8?B?Y3pSdVBxZ1pNZTZQZXNPTXJLNlNNQVBwaXZ3dGZKekxsd1Q0b2RKeUpGUlBj?=
 =?utf-8?B?TXZWSUN3TXFYZzVMMXhUN2RJRVl0QW90dGdwWlVNUnRJMElOaDdlYVYyd0JD?=
 =?utf-8?B?VWVveUVVaWhPdVdta3NIUVJ0aU1pZHBRaFk2aWJrMHRLdHVvb1BhK21yRkJm?=
 =?utf-8?B?L1ZrdEdCUjdNSzBaNnBRZEMrN0dTVHdpYTRGU0xnYmtsc0VtWUhVYkFFV2c1?=
 =?utf-8?B?bmJqSTNzUWN3TFJPVXJsNmJFaElmQ1QxaXNtMnA1Zmw3clhTSDdZa2FDcWhP?=
 =?utf-8?B?OThSbEpXYU4zeUwrTHVVd0lFTkl1aCtiZGJycmM3ckhGREpES1pZTlR2K0hB?=
 =?utf-8?B?UVplUEVXdnFaQzRkdjdTM3gzdWFrVlN2Nit1VERTc1AyZnFzMjNaejRDa1c2?=
 =?utf-8?B?Ym51UnRldjZ6UEJNMldRTEYxTXY1dHlvT2lHYThLaHc1SEdDRXJBTVVuNHp0?=
 =?utf-8?B?T3BwMlUvaStlbnQzaGNKM2hJVjgyNlRTVkZkNk5aaHhjRk02d0pCZmRRRnl0?=
 =?utf-8?B?bmtUN0V2SmFkWlJGaGFGK29uaXhmM2lHUnpqcytkWUlLTE14S210OXA0d0Fp?=
 =?utf-8?B?Mkllb1JJNkFxNUlYRmx3OVBVVGJnVW5tVDhUSlBmMUJ5bHRlSHRkRytaU2dX?=
 =?utf-8?B?WmxJNXlFLzBQUGt3akR1RVBtQUNtNVQrc3FON2labVh1b2o0dGVXOWFLWm0w?=
 =?utf-8?B?VjFId0ZPOU5TS0V4TlNnV0dYbTdvS09oMW1TZGxVSHpCbFV4c0p4ZFppd2pi?=
 =?utf-8?B?bWFhN1JLbUF1RUxqRUJlQ0RtK054QW9LL1NuN216L3N6ZmxNUWtUM21pelRP?=
 =?utf-8?B?NHNFUTBSUlMyUFFyUWxyZU5QQWhSQmVVVVpnUnRKQVpQRW9tcVV1UExDay9y?=
 =?utf-8?B?TFRuOVBIdVNaMFFrMUpQMHAyem5GK0VrMSttbjlyUkFmenlYeUIvVjViUjVG?=
 =?utf-8?B?LzFaaDArNU1pV1Q0NWduV1NoamhxOGFvU21HL3JRUmlYUXF0YkpjQ2M3aGJ5?=
 =?utf-8?B?WkRRL3l1MFg2NkI3MTVoOFpOcXpBMDlWQXViQ0dTa1FtRHc2dnh6bmoyQThP?=
 =?utf-8?B?WEZHYlJHQ0R6L0tFa3hvQTBtalREckEzcFJMVWh5UUF5UytZaVJISHY0SWI2?=
 =?utf-8?B?T0xPbUkwenM1cU5iWmx6aFBlRkh1NEk4bWE2aVlBcDFwSEFRL3dxT3ZtM2o3?=
 =?utf-8?B?TW15elE2bkpuK3NwT3dKNHBzeVpoY0JVMHl4dEdNcDJDQlBxb2RpYXdnTnF6?=
 =?utf-8?B?Si8wSXNYWXFmdGF6NEpFQU9kenVPdm0zZ0hMYStXdlhuS1g3Y0FDZE9Yb21O?=
 =?utf-8?B?dTlITFBMcEdRWGo5V0dUY29TNnJMZEt4aFcyamRKdGZzc3JqTFNxYnlNbXg0?=
 =?utf-8?B?TFVjUjNDRWoxSU1IQkN6NEsrWGx6aWJ6aVRqUTdPRHdheW1XTHIvblY2Sjlv?=
 =?utf-8?B?eWR3U3JiV3I2SlZ2Wnd3UEdFZXlXRTFHOFZhLzY1dFhKeFl4WXNEL0Y0eHlj?=
 =?utf-8?B?V1F2bXk4Ni9YQXZZaWFyWVdIQ0Y5OUJ6NWRSV3puUjZKbTJIMW1XZy83azgr?=
 =?utf-8?B?bEVDRGhsZGl4WGVyZGRGN0Y3TlVJZkN0Y09BaE1UcC83U1ZIc292a0dSOXhR?=
 =?utf-8?B?alhpaFgyWjZjQTJYamk3SFd1OWM5M0tia1VRZUNRcGp2ei9wOElhUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBCD6D61C0AB4643872E5CC982E1E009@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a95dcd3-bf06-4a08-5e20-08d9a8d765a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 08:02:12.5014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYylsiF27oj6IqkMc3VxhcXC6wi+k7EMzk/MTBYB6freTTojMOrbr4h67JKmXnVSVUmZeKOEbynPsdbxK64YDA509EvdQ5+T816INz9BZjCLEpr9wVWu3MgXN2T4cfg2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3374
X-Proofpoint-GUID: S_wXgDooxJc_w9IpKQYxF79VCQ4vb6BC
X-Proofpoint-ORIG-GUID: S_wXgDooxJc_w9IpKQYxF79VCQ4vb6BC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_16,2021-11-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0 mlxlogscore=617
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160040

DQoNCk9uIDE1LjExLjIxIDE4OjU3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDUuMTEuMjAy
MSAwNzo1NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gVGhpcyBpcyBpbiBwcmVwYXJhdGlvbiBmb3IgZHluYW1pYyBhc3NpZ25tZW50IG9mIHRoZSB2
cGNpIHJlZ2lzdGVyDQo+PiBoYW5kbGVycyBkZXBlbmRpbmcgb24gdGhlIGRvbWFpbjogaHdkb20g
b3IgZ3Vlc3QuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
PG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4gLS0tDQo+PiBTaW5jZSB2MzoN
Cj4+IC0gcmVtb3ZlIGFsbCBSLWIncyBkdWUgdG8gY2hhbmdlcw0KPj4gLSBzL3ZwY2lfcmVtb3Zl
X2RldmljZV9yZWdpc3RlcnMvdnBjaV9yZW1vdmVfZGV2aWNlX2hhbmRsZXJzDQo+IFNob3VsZCB0
aGlzIG1heWJlIGV4dGVuZCB0byB0aGUgdGl0bGUgdGhlbj8NClN1cmUsIEkgd2lsbCByZS13b3Jk
DQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

