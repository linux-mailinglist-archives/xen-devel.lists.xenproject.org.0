Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E9C404816
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 11:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182900.330746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGkf-0006Lv-Od; Thu, 09 Sep 2021 09:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182900.330746; Thu, 09 Sep 2021 09:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGkf-0006K7-LK; Thu, 09 Sep 2021 09:53:49 +0000
Received: by outflank-mailman (input) for mailman id 182900;
 Thu, 09 Sep 2021 09:53:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6so6=N7=epam.com=prvs=9886dc581d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOGkd-0006Jx-Qv
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 09:53:48 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d25a51f3-1153-11ec-b1a9-12813bfff9fa;
 Thu, 09 Sep 2021 09:53:46 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1899hO8Y004708;
 Thu, 9 Sep 2021 09:53:43 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 3ayfvur19d-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 09:53:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3469.eurprd03.prod.outlook.com (2603:10a6:803:18::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Thu, 9 Sep
 2021 09:53:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 09:53:38 +0000
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
X-Inumbo-ID: d25a51f3-1153-11ec-b1a9-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSiP+RDkk3DSKYoR4Vi8KHpglHz8yClcE76tr782TgQXzsvxvyz/QIebyeusHrfaxPr5sa24q90Rvq+Nh5b/c1DmK4W10eQ48N+BbTvCzK5o8ONCQmkKoAbfYoYI6KQK4MIhWXXTzpSiwa1ZnZlzloaP+iZk2fAeV7vPIPECUOk3444zBQeMhzEu7kxyZYjIVySrgdICcvCQ1ji0xv2js2WRdtcymaNMpHTSdaRvjfmBPiul0wWhueXEyqhCUzph4K1MlBmi4YicafyHX1LzauHP9Y6ezFToG2S9BtLGtd/vSS+StDIagUKCdVgeDCiIupy9LvCZwbrUplKI7RAwvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Aa779dZMNrHLiJ6/fJbdM9JNUroII9N4XsxRLIy+C3A=;
 b=iXMb9uaWF9sbazoSJF5Qy0fTwMh1p245pgEvD50+oIlZwrgDTn9wXGb1xmNAmzAc6R6F96fQet/wk/cp0/CvqVueUovHi/Q8dXp5i+2QU+5kYWoUfuy+OzCwiYKCflsRuxnoCEWx+Yl66qDh31wnsgB7QuG1dwK3ncmOPgIb5P7k12LE65VQEJfL97lJBi+MKDb8CI3OYxqpBqv+4DT63bacU400fKnp1lXd8tiJAaNU2AFA9MT5d1vktrOEBfR6RXGjkU2xECVRKVl8AQjvYW9kZl0pzXuXNalN9Ck7mguQUts8DXDJ/1QCc0jaKfbglAp6o4stidGmsgT2TJOj2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aa779dZMNrHLiJ6/fJbdM9JNUroII9N4XsxRLIy+C3A=;
 b=RtdyHFYX3gPKLUxjxFGo1v0xZUn361mlcF2lOKbKQ7opaDeazD3lr5Sm8sMw293D4X2F3Vk7WKmkK4MgAWXeBdI6Gueer82z8GLwhKnpywzQXDO388Az0rUTEXilqMyMQnFeIh4ftSScxlPqmqEy+lfgDv137K1jMtvbQfWuzUKDBEs70CPCrP8l1pa5xGc798fonpquqEL18w0uG+qXg9rNK9j6wNKn1Th7S2hIceZ9oj+L0M8q++dn+TwMiGGFiNpD8e+78i8VHi9h7AIWHO3LSiAyOzw2KZwEri9vUuTPM2MD+jpCsctGKmyCG7cLzGC80ZzVfpMdBw7Tu7GToQ==
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
Subject: Re: [PATCH 7/9] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH 7/9] vpci/header: program p2m with guest BAR view
Thread-Index: 
 AQHXoKxowwaOW1OR4UKei+2TOBJan6uXHAEAgAQmJoCAACVpAIAADfgAgAAGsgCAAAOLgA==
Date: Thu, 9 Sep 2021 09:53:38 +0000
Message-ID: <08f50550-de12-d6c0-e873-9f293639b0d9@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-8-andr2000@gmail.com>
 <90813678-d873-d346-5f53-ab97aaedd3e6@suse.com>
 <f35a7bbb-8a9a-06c3-c7b3-60b49013d8e5@epam.com>
 <ee9a69f1-6b47-a944-7255-4ffaa3e1c601@suse.com>
 <b9fe88da-3bdb-0b37-f2f4-9a575806e6de@epam.com>
 <2cffae86-1a2d-a9c1-e5f1-1083ed24480f@suse.com>
In-Reply-To: <2cffae86-1a2d-a9c1-e5f1-1083ed24480f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8210ded-80c6-498b-dd7f-08d97377b273
x-ms-traffictypediagnostic: VI1PR0302MB3469:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB34695B85E9FA4917D63DA966E7D59@VI1PR0302MB3469.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 B4DmryE+AZOFMlgqcLFvC7ojsO+Xl3n/GeS5DaAbaRPeNtIa/oX7IHQl6jsVOS3yw9FAIRxB6M75z+BtUDeqMdKqnmr17fanehQfINlAoz+lQ8mfbwCqjqSxMZhxKDU+2nDK4nhfJeSxKXKqs7RYpoq8gQSeMV2FFXf0VJXd21JDaHPWxqs7IoNBMh71f/CgrGHHiu6sDSSRpkZM9OPOw3JfAIYDtTg9gDqlMY4jJWv/BQtIVMfc4Utm1Dd0acW3YL6sqmWr7LNvJgCjBP9qdeOTw3ZP1N/Fm81qRIZ5OOtgduE69Nz+puFpvMIxtOfgNw+BGTBIf8qn4sFy59tNtXyxAzNc3aMlvKGUEcpjjvpQLtrrdsdOYmTM0qiH/oTkLRlH9GKX9g/xVszADC1K0GwyUtzloylLvg9dWQY/Rs3RHqOdgy9y3CTEU9lVuoHvpvpwrSgZgh4bJz5SKaJNQj+ASRcypZ0HL4ekdD2eUSnuFXYuYCY/H+altD+UOVmOsgN6a53n29SHopRMeMlnIqHzaqbEQoRhdJb3JnYTJsuL5nv8Qa0vstWF1zlyjdTThpF2myvhUDHVyC9Fkb+Vnq71sErFTpIkGVrVuKwv72yShIP++uOyIl4J+Z32QAtXG2tB5BvuukPP/4hwhW6QhBUyWikKzqFG0qLH9nBtA9X7+NdOvdWOe4IIqS3cYZGVo9TJPJP2TE1LuNXvNherdGVxQzwvxMi15byLIgnkhZ6kIzE/dZdwCKP5eaAdU6Dx
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(76116006)(316002)(2616005)(122000001)(2906002)(186003)(26005)(110136005)(38070700005)(53546011)(66446008)(91956017)(6506007)(36756003)(71200400001)(6512007)(31686004)(86362001)(31696002)(83380400001)(8676002)(66946007)(66476007)(54906003)(66556008)(64756008)(5660300002)(6486002)(4326008)(478600001)(8936002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SVpTMFdGNENabHJ4NmlQb003bzhjUlFDZUU4LzNQcHpvS09XK1ZTZDRYK1p1?=
 =?utf-8?B?dVRmTWFxKzRTOFdKUVRwTzdramUxNlp5Vm9YS3lCNDdwcFdiRFF6NTVTeFln?=
 =?utf-8?B?ejJYeGNHUWxEd0JlaC9PWjNqd1JzSjdSYlFBN1NYNUN5Um9aTmNudzhsZ2FL?=
 =?utf-8?B?MVZPeU12eFhMNGxibjduQzdnT0M0dXEveDBvWTh1SDFZcTVDZE1sZGpqNm5r?=
 =?utf-8?B?QWtqakdsS1RvMVZMWEtoSkdROEVRdW1ZYzFWQVVKMXVNWmwzQ1RvbkI0NXE1?=
 =?utf-8?B?OVBOa3JKN0Fpc2p3dm03STBYU1pMbXduMVZndGpCZUVmYlRQb0N5N2t0ZnZ3?=
 =?utf-8?B?YjJYMlJjUDNXQ3NzcXBuUjlmbWFJb3lrSCtGV2N5R0pzRjhHUFZ0T3k4dFVV?=
 =?utf-8?B?NUpGcFZvanNmeGY3QUFzZmdkd1V6dkphcjRLWnF3ekRNcm5oTlhaZHliVzAw?=
 =?utf-8?B?eG9FUEVoM21vRkhlcmR5NlBGWklQNG1TcXN4WVNPWkRob3ZseVZwQWpOcWk1?=
 =?utf-8?B?ekNoMHRBUGQwQjdFKzN2R1JRSDd5akFCQ2FOOUlBUHFCOTJBNVB3Vmt6YlFy?=
 =?utf-8?B?VDF0Zi8yUlgyaUFTNS9wcFRDZVAvK3R5d0RCbW9aa0NBdndKZFhmM1ZXMllQ?=
 =?utf-8?B?Skp2OCszQ1pqRWNBb1RJb3Fib3RjL2RCVEp5dzNDakR2L3Y0MWc4NGNpa2hh?=
 =?utf-8?B?bEdFTXdJOGhpcnE1cEdzK1Bzd2x1Tm4yZ2V1RlhHa0VjQVp0ekh4OExGWlV3?=
 =?utf-8?B?YVlaTjBPbXJLclE0RndDQmNuRDhWTUJ4eE5pU2I5cS9vR3BwVDBmSFlQVFht?=
 =?utf-8?B?em5XcmxYanQyYStRYTlIU21CaEJTYlI5Z3FpNlpTK2oyNFU2eGlkYnJDWlVp?=
 =?utf-8?B?RExuSTQ3cWpSTTRJUFcxbW1pZDJYQ3ZoTmp4SUpxSzZvZytIdy9Gdk0rVGNF?=
 =?utf-8?B?a1NmZ1A1Y0tiaEdNbnowR2poSmVpcnRPdUpvbTVmQ0hCVXQ1eWZ4OXAxbEhL?=
 =?utf-8?B?UHNLY2xsc0V6YVFyUzJMWEphQVZnZlJLUWFvd1BmUUp0Z1RwbE1vNm10TXhC?=
 =?utf-8?B?QTNhUU9aLzI4WlQveUtNWTFuRit3Z3JhV2w4OEZjeURwN0N0bTJqYlBYQStp?=
 =?utf-8?B?OGdSYlI0K0ZPTDVCQk1OYnJCck8wbjluWWU1ZlRXVlJJcEVrZm5tR0taTThO?=
 =?utf-8?B?T0UzM2JwaytSTDJNaDNOQ0ZLelNYTTNmMkMvVm82SzJVRFpxb1JCYk9GS1JY?=
 =?utf-8?B?TGQwWjZWZEdsQUkwSUtUaFZTSGxJWUlpdDB4WUhIZkh6MlpYZXpybXFGc0pV?=
 =?utf-8?B?cW9ncmdCQjVPMWh3LzdIUlV1ODVoV0J2Z0ZENXF4NmNjMEc0OUhwQW1zVXh5?=
 =?utf-8?B?K0djL25NNjU5Qzk1MnJkL2FKaS94VFlUSWM5aEY5b2xoVGh2Mk9zeXliclgr?=
 =?utf-8?B?alphc2l3TzU4RHRDdXlpc0VpK3g2NXQ1eXM0ZGcwOUNKeHhsS1Z1V0xQeE5U?=
 =?utf-8?B?dU43S3hZOXpESEVTSGFvMFVJMnprQnZuNlNGd1VHVUcvNjZIUlFXMlhTQVVL?=
 =?utf-8?B?TW9JQlMrTDYzZzRuY1VUT2swRlpmaldwcnlUT3BXRGI5TG13enJaeEx6L1hz?=
 =?utf-8?B?WXBUdDdqTkU5a0Y1bDNXL1RPNS9RNk90RDg4RWN3dzAwZENiRVJWTlh5UFdp?=
 =?utf-8?B?a1NQTTFjenF4cnlDZTYzNEsrL1liNW15amQ5WkZqaGZMYjhPdjVCMHVHNm9C?=
 =?utf-8?Q?+ix6rQEwq663l2VJzV8twbDkBnbsRhRrxCcBSdw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A05C204D3831EC44835A0C080D731A93@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8210ded-80c6-498b-dd7f-08d97377b273
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 09:53:38.1069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hH9k8jiKv6J+1EwhZ071DpCbOTl+Fq6LSVat6Wnw9VBn4oIiOTmAfUSMnPbU0G9CFTlrijd9vNQqpoWDpTYwiwEXS1aF2rJ9D3haJOArhVwZ72SCfC3uR9wsZ7G3yYs8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3469
X-Proofpoint-ORIG-GUID: jmxWlJgogdM5J7pKS1Bm40samr2sbib9
X-Proofpoint-GUID: jmxWlJgogdM5J7pKS1Bm40samr2sbib9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_03,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090060

DQpPbiAwOS4wOS4yMSAxMjo0MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA5LjIwMjEg
MTE6MTYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDkuMDkuMjEgMTE6
MjYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA5LjA5LjIwMjEgMDg6MTMsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNi4wOS4yMSAxNzo1MSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAwMy4wOS4yMDIxIDEyOjA4LCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiBAQCAtMzcsMTIgKzQxLDI4IEBAIHN0YXRpYyBpbnQgbWFwX3Jh
bmdlKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB2b2lkICpkYXRhLA0KPj4+Pj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nICpjKQ0KPj4+Pj4+ICAgICB7
DQo+Pj4+Pj4gICAgICAgICBjb25zdCBzdHJ1Y3QgbWFwX2RhdGEgKm1hcCA9IGRhdGE7DQo+Pj4+
Pj4gKyAgICBnZm5fdCBzdGFydF9nZm47DQo+Pj4+Pj4gICAgICAgICBpbnQgcmM7DQo+Pj4+Pj4g
ICAgIA0KPj4+Pj4+ICAgICAgICAgZm9yICggOyA7ICkNCj4+Pj4+PiAgICAgICAgIHsNCj4+Pj4+
PiAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNpemUgPSBlIC0gcyArIDE7DQo+Pj4+Pj4gICAg
IA0KPj4+Pj4+ICsgICAgICAgIC8qDQo+Pj4+Pj4gKyAgICAgICAgICogQW55IEJBUiBtYXkgaGF2
ZSBob2xlcyBpbiBpdHMgbWVtb3J5IHdlIHdhbnQgdG8gbWFwLCBlLmcuDQo+Pj4+Pj4gKyAgICAg
ICAgICogd2UgZG9uJ3Qgd2FudCB0byBtYXAgTVNJIHJlZ2lvbnMgd2hpY2ggbWF5IGJlIGEgcGFy
dCBvZiB0aGF0IEJBUiwNCj4+Pj4+PiArICAgICAgICAgKiBlLmcuIHdoZW4gYSBzaW5nbGUgQkFS
IGlzIHVzZWQgZm9yIGJvdGggTU1JTyBhbmQgTVNJLg0KPj4+Pj4+ICsgICAgICAgICAqIEluIHRo
aXMgY2FzZSBNU0kgcmVnaW9ucyBhcmUgc3VidHJhY3RlZCBmcm9tIHRoZSBtYXBwaW5nLCBidXQN
Cj4+Pj4+PiArICAgICAgICAgKiBtYXAtPnN0YXJ0X2dmbiBzdGlsbCBwb2ludHMgdG8gdGhlIHZl
cnkgYmVnaW5uaW5nIG9mIHRoZSBCQVIuDQo+Pj4+Pj4gKyAgICAgICAgICogU28gaWYgdGhlcmUg
aXMgYSBob2xlIHByZXNlbnQgdGhlbiB3ZSBuZWVkIHRvIGFkanVzdCBzdGFydF9nZm4NCj4+Pj4+
PiArICAgICAgICAgKiB0byByZWZsZWN0IHRoZSBmYWN0IG9mIHRoYXQgc3Vic3RyYWN0aW9uLg0K
Pj4+Pj4+ICsgICAgICAgICAqLw0KPj4+Pj4+ICsgICAgICAgIHN0YXJ0X2dmbiA9IGdmbl9hZGQo
bWFwLT5zdGFydF9nZm4sIHMgLSBtZm5feChtYXAtPnN0YXJ0X21mbikpOw0KPj4+Pj4gSSBtYXkg
YmUgbWlzc2luZyBzb21ldGhpbmcsIGJ1dCBkb24ndCB5b3UgbmVlZCB0byBhZGp1c3QgInNpemUi
IHRoZW4NCj4+Pj4+IGFzIHdlbGw/DQo+Pj4+IE5vLCBhcyByYW5nZSBzZXRzIGdldCBjb25zdW1l
ZCB3ZSBoYXZlIGUgYW5kIHMgdXBkYXRlZCBhY2NvcmRpbmdseSwNCj4+Pj4gc28gZWFjaCB0aW1l
IHNpemUgcmVwcmVzZW50cyB0aGUgcmlnaHQgdmFsdWUuDQo+Pj4gSXQgZmVlbHMgbGlrZSBzb21l
dGhpbmcncyB3cm9uZyB3aXRoIHRoZSByYW5nZXNldCBjb25zdHJ1Y3Rpb24gdGhlbjoNCj4+PiBF
aXRoZXIgaXQgcmVwcmVzZW50cyBfYWxsXyBob2xlcyAoaW5jbHVkaW5nIGRlZ2VuZXJhdGUgb25l
cyBhdCB0aGUNCj4+PiBzdGFydCBvZiBlbmQgb2YgYSByYW5nZSksIG9yIG5vbmUgb2YgdGhlbS4N
Cj4+IFRoZSByZXN1bHRpbmcgcmFuZ2Ugc2V0IG9ubHkgaGFzIHRoZSBNTUlPcyBpbiBpdC4gV2hp
bGUgY29uc3RydWN0aW5nIHRoZSByYW5nZSBzZXQNCj4+IHdlIGN1dCBvZmYgTVNJLVggb3V0IG9m
IGl0IChtYWtlIGhvbGVzKS4gQnV0IGZpbmFsbHkgaXQgb25seSBoYXMgdGhlIHJhbmdlcyB0aGF0
IHdlDQo+PiBuZWVkIHRvIG1hcC91bm1hcC4NCj4gQW5kIHRoZW4gd2h5IGlzIHRoZXJlIGEgbmVl
ZCB0byBhZGp1c3Qgc3RhcnRfZ2ZuPw0KDQpCZWNhdXNlIG9mIHRoZSBob2xlczogdGhlIHJhbmdl
IHNldCdzIHByaXZhdGUgZGF0YSBjYW4gb25seSBob2xkIEJBUnMgc3RhcnQgTUZODQoNCmFuZCBz
dGFydCBHRk4uIEl0IGRvZXNuJ3QgaGF2ZSBhIGxpc3Qgb2Ygc3RhcnRfe21mbnxnZm59IHdoaWNo
IGRlc2NyaWJlIGVhY2ggcmFuZ2UsDQoNCmJ1dCBvbmx5IHRoZSBzdGFydF97bWZufGdmbn0gb2Yg
dGhlIHdob2xlIHJhbmdlIHNldCwgZS5nLiB3aGVyZSB0aGUgQkFSIHN0YXJ0cw0KDQpTbywgYmVj
YXVzZSBvZiB0aGUgaG9sZXMgd2UgbmVlZCB0byBhZGp1c3QgdGhlIHN0YXJ0aW5nIGFkZHJlc3Nl
czoNCg0KMC4gTU1JTzAgPC0gd2UgcGFzcyBzdGFydF9tZm4gYW5kIHN0YXJ0X2dmbiBwb2ludGlu
ZyB0byB0aGUgQkFSIHN0YXJ0DQoNCjEuIE1TSS1YIDwtIGhvbGUNCg0KMi4gTU1JTzEgPC0gbmVl
ZCB0byBhZGp1c3Qgc3RhcnRfbWZuIGFuZCBzdGFydF9nZm4gd2l0aCByZXNwZWN0IHRvIHRoZSBo
b2xlIGFib3ZlDQoNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0K

