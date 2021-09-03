Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057063FFE36
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 12:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178041.323899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM6TW-0005ea-4e; Fri, 03 Sep 2021 10:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178041.323899; Fri, 03 Sep 2021 10:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM6TV-0005c6-W8; Fri, 03 Sep 2021 10:31:09 +0000
Received: by outflank-mailman (input) for mailman id 178041;
 Fri, 03 Sep 2021 10:31:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xv6v=NZ=epam.com=prvs=9880a75e98=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mM6TU-0005bM-OD
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 10:31:08 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6acf58b6-7e27-4308-a979-c4927b2545f1;
 Fri, 03 Sep 2021 10:31:05 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 183AIQtC008940; 
 Fri, 3 Sep 2021 10:31:02 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0a-0039f301.pphosted.com with ESMTP id 3auhu681em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 10:31:02 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6881.eurprd03.prod.outlook.com (2603:10a6:20b:286::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Fri, 3 Sep
 2021 10:31:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::641e:b269:6d21:b7f8]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::641e:b269:6d21:b7f8%5]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 10:31:00 +0000
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
X-Inumbo-ID: 6acf58b6-7e27-4308-a979-c4927b2545f1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=co8f4AWKsRTST6P4ipuy/UNZ0+L9aX9mgokwvNy1uK9hBCyb+xBuVoqEjpSWeIULAsbASidG+1nQfqA4nm1rQrFEUk8OmEsdgv7sb+O4rgQrJsqJ9o0R8TsA8CWW8AO+hKzj+FRbac14jsitnV1OsQlI3pgOQWvJ0fCH18+PKCbxT6ncDjNtRzt5OTtYcX07M/vdhiEVhZXx77j/WXLb6c9Y0LX22OSuWWzOAuPNnok/Js0Cqe0xu7uHlfM+Rc0810vHVphnBOT6wMr2io/di5plrrG5PU+pbGeteKf4f1f2G5lG1MAuLjAhte5ju5nM5poDfox1c7Sw67db1avQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=I1JrNBXFqVlvMtY1Qn3q/f0qiRWmgN9ym+/sXuGPkl8=;
 b=FQRcp0uWYrbOpcOdTD8BrEIn1Fbh4GoQKVerphzb1pk6uU/wMz99+ELzJENI1WRXB45lqWy27STwo6HBqieNRdmsVYc2tMZOl9SfNYfVFxuMBL29KKYDAZWMluWufCDZ9BzSLOYx8DStaYp+YBz/e0GiBv6sqQhMx4ww6eMVqwII3vXj8rCD+MhEfmDmJyIZ5Hn27XLJQmVk/kEmm/xvhnHVoHhssP3qjPdAr0rt3aNr87kWIXKTQ99nxwWPduu80uW6GTxELnx7WTWq3Yo4diPyxZkh/eZT/1ijNoN41bV2nFfDWoWjHI5TqsTR+DXvSAtALx/IR/gnwwnZno9gig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1JrNBXFqVlvMtY1Qn3q/f0qiRWmgN9ym+/sXuGPkl8=;
 b=04ETNyi+jyv0gOdhh60UZXJlTKT3pz7FAgep46b8OnlZPgJqQfsvx412iJ7g4WPqopKlxu5hXnUEaJCfeE3TOEc+Vn28HLERwzEp5b3j1PZ75Lv+0lK+hsPoMBvGWaPjW7eQrLXBLtzPlq7jhNWQuoUwhIKdSJCCb2vkNf4xQq8aEaCbVxcnYYiskwW6MyiuBAEzXf7/0BYNFqbHo3Mtx5J6psM21Jogt/tMgM3f9IaG3kGe87j5WM5Xem0ISgdRsiADxaruAXdtYLbhdUafV9SObDjqdz32ynbsatZ8WgD40SWj2oCSJ67I0R7X8yOKFEEbGNs9gXQNYQzW/AHOmQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Juergen Gross <jgross@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
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
        Rahul Singh <rahul.singh@arm.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH 08/11] libxl: Only map legacy PCI IRQs if they are
 supported
Thread-Topic: [PATCH 08/11] libxl: Only map legacy PCI IRQs if they are
 supported
Thread-Index: AQHXoJ50aOdU36kT/0mQrZPJ6sbBAauSGzCAgAABJYA=
Date: Fri, 3 Sep 2021 10:30:59 +0000
Message-ID: <f285da98-ce0e-c120-80fc-26940104c1c6@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-9-andr2000@gmail.com>
 <e154c91d-bd24-9058-81d0-79e2e321140f@suse.com>
In-Reply-To: <e154c91d-bd24-9058-81d0-79e2e321140f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 111e0924-0885-4e37-950a-08d96ec5ec3e
x-ms-traffictypediagnostic: AM9PR03MB6881:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB6881CF3B4263A56A9AB68658E7CF9@AM9PR03MB6881.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4JoyLQJyQVy8el1YBzscb/9jdMy50fcKhWEPxscJbb+Eh8q0dgIZjzIYUIs6nrobEJDlX18wBu4Wzoi1zhvfRIaGn2I6ezD/wDZCu3+O9/ngTWcv1eSFu1nUpwOEPX1flScpcPnkkuFIlYazs836NoOeEAkSHGz7nSf0p/BnIgICpK07vXgJScxG17PqJJCFlsn7J7Eq7Y7dyQ+UbVW9p7cbWgN8J/0rljM7SE7D/bfHXzCKsYLNYB+kEl5xjqurbOiTC6qI+Tnd8RTjv5N33f9x70BEgFhe4jEfUFMJsOsd7z/NaMCed4PColDl/ZFMhzhaDXzmd7+pZk2o0ubooYDcLD951ycQb8u54pWiDuCZGfEdMtvFIsAYMTzFyFR+H0roU+91dMZ99Im8R5Qd8eniGONcZOC/X6ZWnOpjBuYLf4AQkeGKMxEjGdQEA4pYYVkxbP9ZncA66lNZ3nMz0qQDDcgQp63PfoATcGucNjSjxu6egf0U71Y43bBL9etZijBahk29mTyHIbcMgWnFd14WCKdwfxelt+VbOMASybYDF2Vr6orTUqIDl03BAQjpmQhHRpLPqcoSI4kLKJlB+mhpg5/cgNKIKzJIg4xCAQeZB0i05woi+ywC/rlQ/rVLHIGeSKtODhT1amhXoN6XYgye3E0fULrgbaFSluCPjKGAQLMJpXxRwVODCtuih+7pTPHABgE/5mkPZ3gzmkLhC9b4lb8RbnJEqtJZaE2IKnsZ/dYg0pDfoc5Z4PXJsHnC
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(316002)(110136005)(54906003)(6486002)(71200400001)(6512007)(83380400001)(86362001)(5660300002)(2906002)(2616005)(478600001)(38100700002)(66476007)(122000001)(66556008)(64756008)(66446008)(55236004)(4326008)(8936002)(186003)(26005)(76116006)(31686004)(31696002)(38070700005)(8676002)(6506007)(53546011)(66946007)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?alU3aTU4REQvNkdvaEs5ajNZN0cySG5UNFZSdWJTelZxL1VqRXc3alhiTWNN?=
 =?utf-8?B?dTRIWVJlVEtWYllqeEZhU0dOSC8vaVpCbXlwL0ZKYzllVW0rQ2xlS29uV2Er?=
 =?utf-8?B?cWh3RDBINjdnbE82cnV3WkFjSkxBQVNKdnN4MkJ1VUxpeksycnY5TnZQcS9U?=
 =?utf-8?B?WDNVWmw4S0JTa0oyTzR6Mll5TnM0Wko5NDI1S2NoMFBweHQ0NDF4RGpPelB2?=
 =?utf-8?B?ZHpmK0pxYzdOZDRySFVxSE8vb01ETmNIak54WHFjWWlaV240eHE0MFNaZGJv?=
 =?utf-8?B?T3BEVTlWOC9mb0tUT29EcUVBZ0Q3VlF0L3VVOEpuTmFtWEMxVEl4aHR2M1dy?=
 =?utf-8?B?dXVpT3lvSUFwVVE0OWlYN2ZiaHNHdkkxeEpUOGM3aStrSkQxWGovdUozWHZw?=
 =?utf-8?B?NlNOazJFQnJDSG0rTzlWcHMrbHV6S2JMVTE2WEYxNlhVK3FmNi9lZllRdkF1?=
 =?utf-8?B?aWtYMnl2bGlma2owbmx5RWVOSVNLQWp4RmtpZ1h0MkdLRzJUSE1MTHJJaEpH?=
 =?utf-8?B?QndmSXFHSm14TklDK1ZzNnNNcFhMQ3RjWmptY1RkRm5xK2dQZFJOeUN2TUtH?=
 =?utf-8?B?Wlk3YzRHZFFZcVdndEVLdGszSm5qKzRpTEJXcC80RHowdFRNY3g1QnBxR1Va?=
 =?utf-8?B?TUVzL3Zsek9tM0s3eEtPV0RzbjRxbmJRSUtLKzJpTDN4N2prbUVNeHI0Ylli?=
 =?utf-8?B?d3FDUjgvem5LK2dveVlGZDBENzZiODNSOHFIemNjOVc1ZFdGKzJIN0hVZk5H?=
 =?utf-8?B?d1FFbUVHVnd1M2txMUZjenF1RGpsWDJuOUxkNm1SK3JXVDE4cnBKOU9ncUta?=
 =?utf-8?B?N3ozQnJ5ZVF5cHBSRnpyZzNQMGE0dG94bXZUT2lxcGl1cnVJOVlHVXB4YmJN?=
 =?utf-8?B?UjRXejZSUTc2N2dqT0FET2Vic2djMmRrNGg1dUlDYmVud1ZPRGJJNERNSnhi?=
 =?utf-8?B?blNZOWFpUTM4bXZ5ZDJRZk45c0h3bUVKWTZEbVU3djA3VTRSNUtCaXFoVFRY?=
 =?utf-8?B?dUJuQ2tUWmtZMHN6L0taTCtDY0VXNzVvbFFrbnJnUnNDRG8wL1JPYW1CL1RB?=
 =?utf-8?B?TFN0R2xISVlqWUNCeDQyUG9zVDFSKytkQnpSSkErQVM0YjNsajF1dFBVTEZH?=
 =?utf-8?B?bUthK2lqQVNZSHVLeVUwSUQ3TjF5TkpPa2VHQ3R1SU0rMzllTG96c3ptcWp2?=
 =?utf-8?B?VTdERHQ4ZnpWZlVWNzl6UFRodkdqQXBSc0Q1SnIxdldZbHU5SGZwL0VDeWJJ?=
 =?utf-8?B?WUJQMlVYZGJqUmhVb1VOeEtHRnl5V0hubzcvZ1lpdVd1VGplTzhJVC9ZVVpZ?=
 =?utf-8?B?TUtncjJoQnExRWkwcWRhRFowUDQvUUpweXYrRTlEL05KUlRMWGMxWW9FRDdE?=
 =?utf-8?B?bWgvQmRvN0JoRjJGdmZyOElPNEs0N0ppZVRYd2R0WmR2a3RCZ0ZJTU02ZTU5?=
 =?utf-8?B?NVM2TFpRVENXbzZTQVd6am9EQXhiZHdXamxlbnJibmRYc0MxVmdWYjN5Ri90?=
 =?utf-8?B?QkdmcUVsVUk3NS9YYjBzeTdCUnFPRnJ5QjhaR3lBZ2E5R1RRS3pnYmFodEUw?=
 =?utf-8?B?am9peGlUWnU4Y1lOQUVkVXpkVVQwNGpLN2xmd21FMWxkTnlJN0g3UjFsNlRL?=
 =?utf-8?B?WXFIdER4N3pZaEY0QVh3OUhZWGJuME5aQjdaQTQ2Y0NES3RuNGxGZDFNbnla?=
 =?utf-8?B?ZWRtbTRSbFlRVkZuZ1BCWitOT00yOUF0QWpzSUdXZUQ2T1BYNzZxUUhwK2g3?=
 =?utf-8?B?UHNOL2c1UXFQcm9lNUhwVjFxV29YR3FibkhOc0FyRTdxZHlFL2JIZTkyVUx0?=
 =?utf-8?B?bGszY1NzTWZFUWhmdmVHZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB986ED1967C164F91B707BA706D7C6A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111e0924-0885-4e37-950a-08d96ec5ec3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2021 10:30:59.9717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dwTTRvMBwtG6wkkUNOPbnQOL1LS6cHGgolcGw9Ye+BxA8vjuMvqMfGpIyESsDk4/SZ1ianZ2LkJTgklmyq9IH9rY+J770KcKDHftkhwE9w/5aypZyLLTDrwe3IiwmUfL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6881
X-Proofpoint-ORIG-GUID: -4YD1Sw6CRSks1MY1lcyDuQbmyM8uOXu
X-Proofpoint-GUID: -4YD1Sw6CRSks1MY1lcyDuQbmyM8uOXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-03_02,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109030064

SGVsbG8sIEp1ZXJnZW4hDQoNCk9uIDAzLjA5LjIxIDEzOjI2LCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Og0KPiBPbiAwMy4wOS4yMSAxMDozMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+
PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29A
ZXBhbS5jb20+DQo+Pg0KPj4gQXJtJ3MgUENJIHBhc3N0aHJvdWdoIGltcGxlbWVudGF0aW9uIGRv
ZXNuJ3Qgc3VwcG9ydCBsZWdhY3kgaW50ZXJydXB0cywNCj4+IGJ1dCBNU0kvTVNJLVguIFRoaXMg
Y2FuIGJlIHRoZSBjYXNlIGZvciBvdGhlciBwbGF0Zm9ybXMgdG9vLg0KPj4gRm9yIHRoYXQgcmVh
c29uIGludHJvZHVjZSBhIG5ldyBDT05GSUdfUENJX1NVUFBfTEVHQUNZX0lSUSBhbmQgYWRkDQo+
PiBpdCB0byB0aGUgQ0ZMQUdTIGFuZCBjb21waWxlIHRoZSByZWxldmFudCBjb2RlIGluIHRoZSB0
b29sc3RhY2sgb25seSBpZg0KPj4gYXBwbGljYWJsZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBP
bGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+
DQo+PiBDYzogSWFuIEphY2tzb24gPGl3akB4ZW5wcm9qZWN0Lm9yZz4NCj4+IENjOiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IMKgIHRvb2xzL2xpYnMvbGlnaHQv
TWFrZWZpbGXCoMKgwqAgfMKgIDQgKysrKw0KPj4gwqAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9w
Y2kuYyB8IDEzICsrKysrKysrKysrKysNCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L01ha2VmaWxlIGIv
dG9vbHMvbGlicy9saWdodC9NYWtlZmlsZQ0KPj4gaW5kZXggN2Q4YzUxZDQ5MjQyLi5iZDNmNmJl
MmExODMgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L01ha2VmaWxlDQo+PiArKysg
Yi90b29scy9saWJzL2xpZ2h0L01ha2VmaWxlDQo+PiBAQCAtNDYsNiArNDYsMTAgQEAgQ0ZMQUdT
ICs9IC1Xbm8tZm9ybWF0LXplcm8tbGVuZ3RoIC1XbWlzc2luZy1kZWNsYXJhdGlvbnMgXA0KPj4g
wqDCoMKgwqDCoCAtV25vLWRlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtV2Zvcm1hdC1ub25s
aXRlcmFsDQo+PiDCoCBDRkxBR1MgKz0gLUkuDQo+PiDCoCAraWZlcSAoJChDT05GSUdfWDg2KSx5
KQ0KPj4gK0NGTEFHUyArPSAtRENPTkZJR19QQ0lfU1VQUF9MRUdBQ1lfSVJRDQo+PiArZW5kaWYN
Cj4+ICsNCj4+IMKgIFNSQ1MtJChDT05GSUdfWDg2KSArPSBsaWJ4bF9jcHVpZC5jDQo+PiDCoCBT
UkNTLSQoQ09ORklHX1g4NikgKz0gbGlieGxfeDg2LmMNCj4+IMKgIFNSQ1MtJChDT05GSUdfWDg2
KSArPSBsaWJ4bF9wc3IuYw0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxf
cGNpLmMgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+PiBpbmRleCA1OWYzNjg2ZmM4
NWUuLmNkNGZlYTQ2YzNmNyAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxf
cGNpLmMNCj4+ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+IEBAIC0xNDM0
LDYgKzE0MzQsNyBAQCBzdGF0aWMgdm9pZCBwY2lfYWRkX2RtX2RvbmUobGlieGxfX2VnYyAqZWdj
LA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+IMKgwqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDC
oCBmY2xvc2UoZik7DQo+PiArI2lmbmRlZiBDT05GSUdfUENJX1NVUFBfTEVHQUNZX0lSUQ0KPg0K
PiBXaHkgI2lmbmRlZj8gU2hvdWxkbid0IHRoaXMgYmUgI2lmZGVmIChzYW1lIGJlbG93IG11bHRp
cGxlIHRpbWVzKT8NCg0KWWVzLCB5b3UgYXJlIHJpZ2h0LiBJIGhhdmUgdG8gcmV2ZXJ0IHRoZSBs
b2dpYywgZS5nLiBzL2lmbmRlZi9pZmRlZg0KDQpPdGhlciB0aGFuIHRoYXQsIGFyZSB5b3Ugb2sg
d2l0aCBDT05GSUdfUENJX1NVUFBfTEVHQUNZX0lSUSBuYW1lPw0KDQpUaGFuayB5b3UgYW5kIHNv
cnJ5IGZvciB0aGUgbm9pc2UsDQoNCk9sZWtzYW5kcg0KDQo+DQo+DQo+IEp1ZXJnZW4=

