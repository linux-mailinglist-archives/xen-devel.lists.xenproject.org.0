Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71154A94FD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 09:19:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265152.458451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFtnz-0002r0-CH; Fri, 04 Feb 2022 08:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265152.458451; Fri, 04 Feb 2022 08:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFtnz-0002oH-7g; Fri, 04 Feb 2022 08:18:55 +0000
Received: by outflank-mailman (input) for mailman id 265152;
 Fri, 04 Feb 2022 08:18:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+82=ST=epam.com=prvs=4034f0a382=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFtnx-0002oB-JW
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 08:18:53 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15fc038e-8593-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 09:18:52 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2148AVJb011800;
 Fri, 4 Feb 2022 08:18:48 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e0qyqs0w6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 08:18:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB4011.eurprd03.prod.outlook.com (2603:10a6:5:32::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 08:18:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 08:18:06 +0000
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
X-Inumbo-ID: 15fc038e-8593-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccFGU7Nl5Eg4UysEmN3B9GBU7Uq15aYfUGViVtENI+b+xrZu396VABYT1L+qLhAml8LuJgMP5v+CJx6ZRthnN61q6WVRPDAcFwxsQ7TYFVeKGnOrub457nZrwI/xV1lRhM3PY09HojVvzqZMJ/OkaQKAryXs2CzxIREjkAewgqqUpmDKjkWGIA0AUmq4q/ttLXNEb+gfd7gclvlKSlPNheZNoJaTM+cGKmDf/UWEB3cUFrQB+tnX0VE+k+FAMfPd0awpBPyL/uC5scRbeJ4b0N6iS6s3RcwlGVkoaD1/cJrDNsHnvz0lNFo/3JnY+DRZB+7UubsiPJz2Zzp05IV5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoMjnUyR5QgnqfycTSZCVV6hh/8SJZXFw7/jJGS6fng=;
 b=d4h/OFaqhwcgBVUby6qoRQTfKw6UJ3VTcU9V3E0shJJwcfsG1Yiny66SpDeC2myQxbwE4NDWjZcSLhtJRircnVm0FrdqzsYVjj4sY7TL7A0JA+HDNPEgQAO8RRM1GfQKiO6Jm95YtnbPJEbQQya26Ho+Y5coN73rVAS+l6qoqMsXx9nC4OAKaEYhtcsc/ATzJHa0c6paZIzgfXg9m+mO/bYB+JgQUuqu+QY73EXlWXhd/WpxZtpnTUqTQqn1Ooi6AD861z0NFdOTTLMni8x6t/DY54iIKju4i38DRGkvnINodAIwUbcPDqHkC9EMtn664SjrI7qdLcZsm84F927n+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoMjnUyR5QgnqfycTSZCVV6hh/8SJZXFw7/jJGS6fng=;
 b=BlgNTWxJEujDh6UEYKsZp9cuiLYtj0HQRk5RwjvcH/FUAAYE5YtkFNQOrvbLKX+30wi4YH1eghEXku/MjJAWRpkdpbw76nswhzatThknk+Q3WY4JrZ9PM4TGTvcQ4ldc5cxS60wE1yqOL5EjbkK54oovQmOaCUiLkRjLZGj2IQ1/tc/J13RUam/3t60O+9jHENt4yQCBtUG7hsjTrrLFJtnoYwelquNljP33fYylofJMe//jIhzplgzCGMyTBuVzOxD/1G1zLKSMUYbCcgasKbzMz9CMgSm1jp8Jgm7ELFKEcAJesEPEqgF8oMnXyqzoUF5DJSgGeeb4+/YKRDfkhg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 12/13] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v6 12/13] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Index: AQHYGZFgYcuoJMilu0Or+397ala4YKyDBiqAgAAGLAA=
Date: Fri, 4 Feb 2022 08:18:06 +0000
Message-ID: <87fd7f35-b6c3-8ce0-098e-d8f1615b3b05@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-13-andr2000@gmail.com>
 <c8de0575-b2c5-48cb-c579-e1d2b7be5bd0@suse.com>
In-Reply-To: <c8de0575-b2c5-48cb-c579-e1d2b7be5bd0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5791fdc-5dc9-4f1c-d429-08d9e7b6df6d
x-ms-traffictypediagnostic: DB7PR03MB4011:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB4011FCB157D25E2C607C0D40E7299@DB7PR03MB4011.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XKmLz/azJuMC8zbiASxMyTVZPir9En+Wwf8vdzfNcF7h8rzAKH9/1dV9BhQO9TwRfWfG9QWiYZqKmL1AbmYM+Sq9FXA4wke19UmUZtIKoC6MjpCjBhmoVlO/6qikYIZgdketntki/VPoVMgu3cFOkC9Z0M36GGk5KaQ/Dv5fwqtx3riTnS05dT1YrHkCS+knQVTi9L7dPEMuoWgtgGTuG30T085NTpkH7mZGXTDhzhiYiV1jOKk1RcFMd4GaX9fUYUgWt7/Fcs8k5dro1HrJ+SMAv0Cp5tq3RA2VVbSYMMcxGx+ktQP5WvxFhmSDVTf/T9n4Aed7xXJJ2NmcIzx+BMKHm1rWnROius91e7vMtuABYB6NChK5MDHGIsOF1/lxPziEBzawookyYBc8e4RYE+5oIwmV91UlYXoLKkxQe8IG2w7gVCRT6lf1w3noZL5zqT0UMKRS5nhWqYisIRtDxJ4US7inIWa+elHkGLuCig4PtPhP8un6A2qCXNrlZt+mBEOuXLcQll2hr8Paaq/k/zSqdUTmHih/ky1MjnooDcr9avR3JMd/T8Vgi2y2/kC/N/njDvfpDDUwrIdVFgEoDYqEre1fhAlZKvVFeP6fZzjBIBDbzzXjdICoiJ0qRjCGskCqFl2cmqH2BTGn3YIM8skKquv3oFr/oW+BOd5oDphp39SPGnwoN1I4jW+FU/9bITU6B3bQzx1FsxERMsI/3TwP3Lxu8aNWxR6rlZIM3J8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(7416002)(5660300002)(31696002)(2906002)(107886003)(4744005)(71200400001)(36756003)(6486002)(31686004)(508600001)(122000001)(38100700002)(38070700005)(186003)(26005)(53546011)(86362001)(6506007)(316002)(2616005)(6512007)(54906003)(6916009)(4326008)(66476007)(8936002)(8676002)(66446008)(64756008)(66556008)(66946007)(76116006)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZENxRjgxN1E1S3BDZkF6ajBaUHJudTdiTzViUVBtY2hLUDJ0eVdZTkNyRmEy?=
 =?utf-8?B?aXFFU2luc1ZqQkRCVURUNXhUMFBsZDlmenh6endaTE1GYWJQaTNpNkR0K2NE?=
 =?utf-8?B?cjA2N3BCWVRtU3R4WUNmSjM0elRNM1QxdUJ1SEdGMyswY2xjQ1gyTmtvcmlr?=
 =?utf-8?B?MjNIbXNXUVJycUpVNnErREl6TlZzbUhIc2R0Ykc3ZHNYN0ZCbzZ5RmJSazRP?=
 =?utf-8?B?NWFmUEorTGM2SFpCMTJMeHdaUzVuQ2IyMVpBdEtlbnFzMDV3OThqUXBaZWJo?=
 =?utf-8?B?Sm5mamt6ZXNCc3ZVZ0lzVjhsWkJJVlh5M3k3RHdUdUp3SG02SUo0VHdja0E0?=
 =?utf-8?B?dU5FZTlkUkxUSzhhN0tHWDNEbnJORmcreGI1aHpNWmRTeDlWYmhrUnVTaU1G?=
 =?utf-8?B?VUs3RUNWSjNWL1BIKzBRcEJod1hXTlRQMFdXVVlEQTVIb3JaeVpzM2JxaU5U?=
 =?utf-8?B?MjFUNVMyYnNNNTFZY3MxV21PNXRBQ0ROQUd5VXdHaXp4ekdyZzhLZ25pZ3FH?=
 =?utf-8?B?VFpCSkF1b2JvVFRpN1BIVU1hcHB4K0gwNXlNNUM5Si9xVkFBMGpTSTI1SDl2?=
 =?utf-8?B?blBiU1dTMDgvcWxySnh2UGFjWU5nZWJIVGpSc1d3Y2hnWEdoWVlIc01pNWxI?=
 =?utf-8?B?dGhjUXN6ZjZKc1J0WG9BL25Kd3EyVkhScStMZU1PcE9mQWhrZXYyajdjRzdI?=
 =?utf-8?B?VmFxc1VBN3FVNVFSdzVCbDlnUEVrRkxaVU5xUVdMY0NrSzVwb0RJS2M0Z0cz?=
 =?utf-8?B?aFR3MUY3SWtkVDhhWHRweE9oU3ZNOTE3TWs4MlBIU3dBbFF2ZVUwcVNSNzd3?=
 =?utf-8?B?UVJDRG9CZlBPSHNNczZPeVRoTlF3NDZ1K2h0YU16aUxQbFREUmpEYURrNkxj?=
 =?utf-8?B?NWY1OU9rRTZsWmc5bEdWSTdlQU9ZUGQ0TjhueDhGOGhkRjRwdjlYZXpEeldO?=
 =?utf-8?B?UnJ6L0FNTTVCbWk5MW9JUnMvbkVWNWVxMVpVcmRTeUVPNENPZGQ2b2pjTFpt?=
 =?utf-8?B?T1NUQWxsRFdHNldSWGhmQ1BnbHRTS0NSUllMcitqMXFFREFHdGw0RFgrQkhj?=
 =?utf-8?B?UEZqMUQ4UTc4ZnhVYStqTkNGTnBxRUV0NUJEVkt1RXpkWGdyeEhuRmRPRFdP?=
 =?utf-8?B?QVJCTlJvTzJZaXgyRzhteHJabW5FZzFxMWVGZWFGTC9KQysxNEhFS1VTT1o4?=
 =?utf-8?B?ZHM5dHlSRG1pWVl2K3BzMGdVVnhCWktob0xwZkJwY01CWGtnYWROWXp2VWw0?=
 =?utf-8?B?TDBsemRjUmd0QmZMdHdSUFYzK3RtU0ExNnBvSEdBRytydkUrcGdadTllRnpp?=
 =?utf-8?B?VU43RTJONWJXMXcwckxmSlk0VVozZTI0UXI2VmVTMTl0bGorb0wrZ3c0RFcx?=
 =?utf-8?B?NEYzRGhDbm5DdTFtdkJVdUREdDRiVlE0ZElydHJUdzJvc1hLVzhxNVlyMHE2?=
 =?utf-8?B?dWx1V0k0M0dTK3lJSVlDVE5BOFg1d3llaVFkamtHTUxZWisyYlBVTFdIbklv?=
 =?utf-8?B?R1c2UDZ5RUcvUExpVVordklRb08rOUZ0eG5FSGN3NGtJRk1QQjRyaHh2cm51?=
 =?utf-8?B?RzMvMHhTRVVGNUwzZDdIcUlWdDhBWHRHekRnWW5KSEV6d1U1c2dBajJIUXRJ?=
 =?utf-8?B?Si9oNGJ0R0YrMklMUGFkdHVPQ1ZVcHBhbHdwd3k3M2dKYndIbVZVMy81ZkJD?=
 =?utf-8?B?YmJGSkI3ZVJnUzdHZWRVZnlZbmx4NE42elUvdWU5TVdDRlpwQ2FXYUlHdmly?=
 =?utf-8?B?QnZ3cFl4L3JYNUJDRXdQa3FaQ2daZUlIU3UvR1RTWTJjRS9CUkNWQkJ4L0Jl?=
 =?utf-8?B?QXFiMXdkcGtBNUsza2R2REdLOWVwWklFbkxUUHU3bWdQQ1lodmxyRksrbWJ2?=
 =?utf-8?B?Zk9ncFJVSWFHcldHVmpsUkY4TGJnZDY3akxXQm93bngrcU82NVNZNnFuVTlw?=
 =?utf-8?B?dTg4eXFZVTlDYmFQN2RDTmI5ZVV2WU5hakExYVNzTXorOWZNVVZoazVMSk0x?=
 =?utf-8?B?dmdnNUs4bncrZEZQbkNFQ0IxaU5QbmM3bG5qRDIrSm5BMU90M1B3bmYwN0lX?=
 =?utf-8?B?T2x2emUvZmw0S0lHZGlEa0Z1NUk4OEtNL0FGYk9lcjlxKzZVcEdReHc4cHIw?=
 =?utf-8?B?Vk1LNkEvRDZaTGtLK29tZ0Z5Q3V4bXVDSHo4S08zRThBenY3UVhCbHFsYWVY?=
 =?utf-8?B?STdVTENXVWN2MWZqVEc0OXQ2c29zb3pRUTV5L0pyRWhWM1U2YnRObDlRS0Fv?=
 =?utf-8?B?ZzdFWTJlSHArRERtcGVIYWp6d095TUt5aGx4aUNDS0NLNkR3dGVZMU5NYlNq?=
 =?utf-8?B?TjhWQ3puSHgwWUtUblBkQkRPOVNSankyWXNrVFNYZGdlNStjNGxvQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C839CCA6D3883408B47A8C3892D3B3A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5791fdc-5dc9-4f1c-d429-08d9e7b6df6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 08:18:06.7436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 22q2wgHN02dzFomOpqO9Vr1jF2H66efzc5/RBds5FgQUdw99HQWcJidd/LejQF7jOTn+bcR12g/hBYPzlXYvyXdkGvqkvfY59eaxAJDFPFZlFWwdALJbmFal9zXO497b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4011
X-Proofpoint-ORIG-GUID: hzQI0c2QrEUBpu-ZUH9ocRaYCV2OHQUL
X-Proofpoint-GUID: hzQI0c2QrEUBpu-ZUH9ocRaYCV2OHQUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 mlxlogscore=791 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040043

SGksIEphbiENCg0KT24gMDQuMDIuMjIgMDk6NTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAw
NC4wMi4yMDIyIDA3OjM0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IC0tLSBh
L3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2ku
Yw0KPj4gQEAgLTE2OCw2ICsxNjgsMzUgQEAgc3RhdGljIHZvaWQgdnBjaV9yZW1vdmVfdmlydHVh
bF9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwNCj4+ICAgICAgIHBkZXYtPnZwY2ktPmd1ZXN0X3Ni
ZGYuc2JkZiA9IH4wOw0KPj4gICB9DQo+PiAgIA0KPj4gKy8qDQo+PiArICogRmluZCB0aGUgcGh5
c2ljYWwgZGV2aWNlIHdoaWNoIGlzIG1hcHBlZCB0byB0aGUgdmlydHVhbCBkZXZpY2UNCj4+ICsg
KiBhbmQgdHJhbnNsYXRlIHZpcnR1YWwgU0JERiB0byB0aGUgcGh5c2ljYWwgb25lLg0KPj4gKyAq
Lw0KPj4gK2Jvb2wgdnBjaV90cmFuc2xhdGVfdmlydHVhbF9kZXZpY2UoY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCwgcGNpX3NiZGZfdCAqc2JkZikNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBwY2lfZGV2
ICpwZGV2Ow0KPj4gKw0KPj4gKyAgICBBU1NFUlQoIWlzX2hhcmR3YXJlX2RvbWFpbihkKSk7DQo+
IEluIGFkZGl0aW9uIHRvIHRoaXMsIGRvbid0IHlvdSBhbHNvIG5lZWQgdG8gYXNzZXJ0IHRoYXQg
cGNpZGV2c19sb2NrIGlzDQo+IGhlbGQgKG9yIGlmIGl0IGlzbid0LCB5b3UnZCBuZWVkIHRvIGFj
cXVpcmUgaXQpIGZvciAuLi4NCj4NCj4+ICsgICAgZm9yX2VhY2hfcGRldiggZCwgcGRldiApDQo+
IC4uLiB0aGlzIHRvIGJlIHJhY2UtZnJlZT8NClllcywgeW91IGFyZSByaWdodCBhbmQgdGhpcyBu
ZWVkcyBwY2lkZXZzX2xvY2soKTsNCldpbGwgYWRkDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0K
T2xla3NhbmRy

