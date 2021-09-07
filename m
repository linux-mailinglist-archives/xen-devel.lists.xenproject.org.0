Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AE84026B3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 12:05:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180725.327504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXyW-0000yC-23; Tue, 07 Sep 2021 10:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180725.327504; Tue, 07 Sep 2021 10:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXyV-0000w2-Tz; Tue, 07 Sep 2021 10:05:07 +0000
Received: by outflank-mailman (input) for mailman id 180725;
 Tue, 07 Sep 2021 10:05:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hq6o=N5=epam.com=prvs=98842be756=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNXyU-0000ue-4w
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 10:05:06 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 129d972a-0fc3-11ec-b0e1-12813bfff9fa;
 Tue, 07 Sep 2021 10:05:04 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1879h7RO005781; 
 Tue, 7 Sep 2021 10:05:02 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 by mx0b-0039f301.pphosted.com with ESMTP id 3ax2jngtf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 10:05:01 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AS8PR03MB7143.eurprd03.prod.outlook.com (2603:10a6:20b:23e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 7 Sep
 2021 10:04:59 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 10:04:59 +0000
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
X-Inumbo-ID: 129d972a-0fc3-11ec-b0e1-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ayg+E8KbkwmM/To98WalRkwreO+Jsd6A+YUrsNzqgMfpfHN1QJnwQArMvKHqhIe0sCOGGBGOPnge+gYWcJNLVS5KA2mMRrMSJMhKF7qtQfEcujPYajHWhaMpdm+mRdspGSb3hsyZNlINjIbyP9a8Sq8mKwf45mydQ+d+Pjw2M22nu2Y4Q6d/N5vsCbiwK0zOmgT0C7gF5Ia9k+emuZFM76IqPrA6Lh/URBYz5LqRGFVv/SEx0fqNUGb+TtSQtPr3qaE9TFYsBaT7fhlJ2fWbu9dLiTi96xfJMOxSiVt1XMSgBeYDoWRE+ZPJ7SFO/vKSAJ5kiPIDNV4fSKbht88RGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/TQLdNk+Reu+foPLnB0xZnQ6fPvTin+Fuvfe22LzTIA=;
 b=ogkdl417/AE/+0h6wxo3Nt++pni2qrzHHSPjHPO5hs/39SowMTII0VBv1yDt4Glj68ZN0ZCug5mbz731uEJyjjjUbrMHTLIPX8C534sCTSQSQff7wymIkmWS1mudcvhc/bxSGvBng5ogsVDcwJowfnGHQpw930l144cAGnrlNnQgn+QOesTI7y/XTixafbY4MXnDoUPiSGzlIehsrN/NFxdsNb8x6arJg4T5E/BWMeLslEcRgQzBJeJnu6YOiif2kAVtZy29V8xmlGkEvuhoX+7EkiW7O0NpBCDlTIDIAoJlI3aH5fjdM/tVWVMXwJzUgeEcnyVMdEEN5CH+vKVo4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TQLdNk+Reu+foPLnB0xZnQ6fPvTin+Fuvfe22LzTIA=;
 b=LkiCAsqVH+bGUx7o/BahbNM8k7E1C3mLq9UV/ff4M0pjfR4Bmri0bpuaIhMus4zECeTAkY9FtqsIYPO2k1r+9qpmp3BBEYUyUTtHS9VNOUhpquZdUx0YtF1tGaFLYar/VlHl1ea6SWby8kLLwZ/3crUtAJoFArjdcdm43jUf3xTFEVYqWO0dyDp2w2SYZNSJS1viPhj9pIzMgf9mWzriXIC50ZtZVmN07OSIaVC4DkLvNUJGs8F52G9NrN0rmanEK78KqjKVvX8epkXL/ui6Bkr2EXZ7iatDFemHSHWvZYem5OsNhX3bJUcruzCcCoejL3jr+EFRmkWbM6oRIPYuFQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/9] vpci/header: Move register assignments from init_bars
Thread-Topic: [PATCH 3/9] vpci/header: Move register assignments from
 init_bars
Thread-Index: AQHXoKwh6IBgDEFZ2k+LKlDV/Oq/mKuXC7EAgAFSlwA=
Date: Tue, 7 Sep 2021 10:04:59 +0000
Message-ID: <218da10d-2280-4f15-4ede-b5fadcb8c59d@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-4-andr2000@gmail.com>
 <4007d84d-9e76-32df-58f6-af5ff26fdf6e@suse.com>
In-Reply-To: <4007d84d-9e76-32df-58f6-af5ff26fdf6e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1029a4a1-8877-4620-33e7-08d971e6f3ba
x-ms-traffictypediagnostic: AS8PR03MB7143:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AS8PR03MB71432F484D3BC1037C9F0BDFE7D39@AS8PR03MB7143.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gMV8TXCLUjV5f4GQOCYNGLik8bzWsYRiwSPS0QepALIwMsH6m1WEI0qWiaypF2vX3cjgwwfabjcWaV/qNNX/F70KVQ7V+uFmTODDcTSPAhEBK/hMPN3c+fOTkyeFOTpegojSUF0T1p6+l1kgooJCXDzQNHG7DbDjCgJ3NzqQl7q3aetiigcmkxcer0jQATSnInncnxJn/8V8DtzJsv/yKEO2ZmhbrYvYrfJ5LsYnwkq4Wzfb6i/FENTTMqLnDSXlqJV/8RQMCIdtwAQ81PMi4xbSDZVdYpOSJPUcgftBG0yBJNxQ831SCim0bJkDBu3rholf1u9VmJz5XOmnuWVFcLyRH8VI4ziP+Qu5xR6vzcewvSJg41lUES/7+sObL7Rbmp27fiO0pvDk1gn93+787KJzA7ToaLmzgNC670hcCEdHe6XZqgRv8cRVEdEg+dqveTuQhza4f6llx09lCouPKXyVE0afasuR+3uUpkIM5yxMNA/ASTFBFkykSqKRgahKfNtw1n5oGel5TWjKdIvOTS7zZSOaUBZzgHCL5WtbpjcR0y2XjwtdqDQN4wLt8VfWWSm1f42xfKGJkgoXId3yQOXDsBUaTtIfZ7grKFVlnWSATTsIKMe8IDlaICHMGUTROVn/P7bdtG4BdRhPc6OUFJ+bU2fUegmot+RwvbQo42cA+O7iqKs3QRx2BV9y1dAJUlCWwTNpadebhlu2HWQJRZe5+dOkxTaXPl0gk+/QDErKVbAUDcFWEGN419gUBhUO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(2906002)(8936002)(478600001)(8676002)(71200400001)(86362001)(38100700002)(2616005)(5660300002)(38070700005)(31696002)(4326008)(122000001)(76116006)(6486002)(91956017)(31686004)(53546011)(66556008)(66946007)(66446008)(64756008)(186003)(83380400001)(66476007)(36756003)(110136005)(54906003)(26005)(6512007)(6506007)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aFZRa29KbTZxUzNydUlhQ2h2NnJJQ3V0SjNEcURDK1VSVVdUV0VUZDRXb0ZL?=
 =?utf-8?B?QlpWd1NndlJxeWNuVEhHWnZya294UVlGME52TWxHdE1xYVd4RVowRDJTSUtW?=
 =?utf-8?B?M010MitmbStpaUtwdmZMOEN1TEhweS9CWERpU1gzRUpWVDN0bk1mTjNWNlAv?=
 =?utf-8?B?OW1sU2NrbWFnMTljbW15eTcrQWV5ZldWUXRYNlV2Z3B5Q2dWWmwyMXJsT0lt?=
 =?utf-8?B?QkN6TUc5V3ZXd0xveXlqSFdGMFVLMnNtb2hucEpILzNlSU9DOEdsUHM3S0xI?=
 =?utf-8?B?eUYraEg0ZTBsLzZWTklxUTZVbnNVUXErWlFGZ3dhTjJIMU1qczRkdmJlUkhZ?=
 =?utf-8?B?RG5mSk84SDY0bENnOE14RlBXTXVQd3JOeEdNWHdhTHRUVjhRbDhhQUpDZVdJ?=
 =?utf-8?B?b3NBd213Q3JrNnZsaDRUamhodVZhQmVQTzRNSkJVZUhjVWtpMlFMY0Q0azlK?=
 =?utf-8?B?SnNnVHRtVXRpNkZ2ZWpFY01GdGtMZmdEaEZjam1vNjRUZm55WnJkcVpBdnly?=
 =?utf-8?B?Y1FKS3BsZVZRcHdMWkM0b0tTcFl3ZnZmSXlUY05uR2wySHhmWit1V3l5MUJj?=
 =?utf-8?B?bnB3SGxXSnhPOUd2Z1A4a2pLWFFFKzg0OEFZOXBZMjY4UUpjK3N4MXdyR2Vv?=
 =?utf-8?B?QjJwU3A2MGVWcVdMN3JubTN1cStxNWtjQkJTVDIvcDZmc1RSc1p0T2NyZVl6?=
 =?utf-8?B?eDhDOGdkVHhPcVV5b1NYWndpM2M2azIyR3VEWnJrZE9zeXNyc1ZCSGJpR3M5?=
 =?utf-8?B?d3BEK0h6K2hla2Z1ZGFYK3pLUzBQN05kSmVodFo3NVI5T1R0TDZLWldtaGht?=
 =?utf-8?B?eDExQ0pHYXBpZW1MZStNS0lQZmpwbW9IZzk4dzV5ZlB1bkdlSUtnRDIrK3dC?=
 =?utf-8?B?UktHbDRmR3VRVjN3Zyt4TjIvRWlvUlNYZDdiWHZtNlZOL1BwYnkxbXdueEkr?=
 =?utf-8?B?eFFZTXd5MEhocmVKUDhwVndqTHZ3MXhNdTNGTm1Dc3dEdzBSYjJjNjhIMStm?=
 =?utf-8?B?RjRYOWlZVy9aYUlHZm9JaUVCSXkxQ3VBbW9ZVm9vK1ZqNVpGSHE2d1pEdm54?=
 =?utf-8?B?OTZqVTlIZzNRZERJbDB0Z2g1RHVHOTh6TVl2SzJQcmNQTDNjVXNTaCtXbHBF?=
 =?utf-8?B?UXRJWEorVjdoMit3UFRIdDhqMVF4QlBETHB2WmFEWHJGMEY0azFWZ0pHMDEw?=
 =?utf-8?B?WG9hS2JUWTFCbzdqTWZKd2s2NjYzaVhTQXNpdDhDY29oUTRwNi8vNDlyVGVN?=
 =?utf-8?B?Y2FSU01lZm52YkhrQjRVdGorSUl0NzQyRUpNd2hsRXkyY2hseEdlNHU2NDdO?=
 =?utf-8?B?a01xWVRmQ2c3NEVYMVd1cGNvMk1TNjhSSklydUY4V3RIaUdvZUF3U1hqb0RX?=
 =?utf-8?B?dG5jbVEyR210bWlLNUE4bFRGL283WWdZT2w3eFJVRS9ZdllleUdnNnY0REh6?=
 =?utf-8?B?amRjS0ZFeVBoejlhRmpWNW9YU3NLVHVKa0J1YXZtVE1RM2hLZGFJRlhNNnNw?=
 =?utf-8?B?OVlBVUxLVDhiL0NwSXE3N3R6dk8vSWdlVFRLY0dOWjhtV2xOQitJVmQvN2t3?=
 =?utf-8?B?Yklmc3VWMkcwWEZ2VHBna2dDd01pbkdDMysvREdQaSthcmY0bWZBOUV3UXEx?=
 =?utf-8?B?WER6bXFMOWozd2RYK1daMlVLcllsa0ZCblRXM3phdiswTlp3VDQvaDcvSnBu?=
 =?utf-8?B?dmQ2UFQ3VmlDaWh1UVZpWmE0UGl2SzdRMjlOV00wSHQvdkgrbERmcTc2WVdS?=
 =?utf-8?Q?HUnwe21BfJs596oqiQACyXFrwm9VA5BahQm3WQa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DEB72B1234C29479B61DD896A6910AC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1029a4a1-8877-4620-33e7-08d971e6f3ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 10:04:59.4103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JRSmn8T68mW3t0qHf94B3kpILE8lHDnhxYd0bXPvdecV6yqMOKV+o+9qQMd7khxKdLxWelIqml2AKbqBdE9T1vaalR3SfCEsssYv16jq21LuzvSDruqMLTLKmSyNZdgv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7143
X-Proofpoint-ORIG-GUID: p4zJE7BS5DzZqRP-HuOsAJv7Lh9KXsnn
X-Proofpoint-GUID: p4zJE7BS5DzZqRP-HuOsAJv7Lh9KXsnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_03,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070066

DQpPbiAwNi4wOS4yMSAxNjo1MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAzLjA5LjIwMjEg
MTI6MDgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+
IFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gZm9yIGR5bmFtaWMgYXNzaWdubWVudCBvZiB0aGUgdnBj
aSByZWdpc3Rlcg0KPj4gaGFuZGxlcnMgZGVwZW5kaW5nIG9uIHRoZSBkb21haW46IGh3ZG9tIG9y
IGd1ZXN0Lg0KPiBJIGd1ZXNzIHdoeSBleGFjdGx5IHRoaXMgaXMgZ29pbmcgdG8gaGVscCBpcyBn
b2luZyB0byBiZSBzZWVuIGluDQo+IHN1YnNlcXVlbnQgcGF0Y2hlcy4gVG8gYWlkIHJldmlldyAo
aS5lLiB0byBub3QgZm9yY2UgcmV2aWV3ZXJzIHRvDQo+IHBlZWsgYWhlYWQpIGl0IHdvdWxkIGlt
byBiZSBoZWxwZnVsIGlmIHlvdSBvdXRsaW5lZCBob3cgdGhlIHJlc3VsdA0KPiBpcyBnb2luZyB0
byBoZWxwLg0KDQpTdXJlLCB3aWxsIGRvIG5leHQgdGltZS4gVGhlIG5lZWQgZm9yIHRoaXMgc3Rl
cCBpcyB0aGF0IGlzIGl0IGVhc2llciB0byBoYXZlDQoNCmFsbCByZWxhdGVkIGZ1bmN0aW9uYWxp
dHkgKEJBUnMgaGVyZSkgcHV0IGF0IG9uZSBwbGFjZSBhbmQgd2hlbiB0aGUgc3Vic2VxdWVudA0K
DQpwYXRjaGVzIGFkZCBkZWNpc2lvbnMgb24gd2hpY2ggaGFuZGxlcnMgdG8gaW5zdGFsbCwgZS5n
LiBod2RvbSBvciBndWVzdCBoYW5kbGVycywNCg0KdGhpcyBmdW5jdGlvbiBpcyBleHRlbmRlZCB0
byBhY2NlcHQgYSBvbmUgbW9yZSBwYXJhbWV0ZXIsIGlzX2h3ZG9tLCBhbmQgYWxsDQoNCnRoZSBh
c3NpZ25tZW50IGxvZ2ljIGlzIHB1dCBoZXJlLiBPZiBjb3Vyc2UgSSBjb3VsZCBoYXZlIGFsbCB0
aGUgImlmIChpc19od2RvbSkiJ3MNCg0KcHV0IGF0IHRoZSBvcmlnaW5hbCBsb2NhdGlvbiwgYnV0
IGRlZGljYXRlZCBmdW5jdGlvbiBsb29rZWQgY2xlYW5lciB0byBtZS4NCg0KPiAgIEFmdGVyIGFs
bCAuLi4NCj4NCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+ICsrKyBiL3hl
bi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IEBAIC00NDUsNiArNDQ1LDU1IEBAIHN0YXRpYyB2
b2lkIHJvbV93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJl
ZywNCj4+ICAgICAgICAgICByb20tPmFkZHIgPSB2YWwgJiBQQ0lfUk9NX0FERFJFU1NfTUFTSzsN
Cj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgaW50IGFkZF9iYXJfaGFuZGxlcnMoc3RydWN0IHBj
aV9kZXYgKnBkZXYpDQo+IC4uLiB0aGlzIGZ1bmN0aW9uIG5hbWUsIGZvciBleGFtcGxlLCBpc24n
dCBEb20wLXNwZWNpZmljLCBzbyBvbmUNCj4gbWlnaHQgZXhwZWN0IHRoZSBmdW5jdGlvbiBib2R5
IHRvIGdhaW4gY29uZGl0aW9uYWxzLiBZZXQgdGhlbiB0aGUNCj4gcXVlc3Rpb24gaXMgd2h5IHRo
ZXNlIGNvbmRpdGlvbmFscyBjYW4ndCBsaXZlIGluIHRoZSBvcmlnaW5hbA0KPiBmdW5jdGlvbi4N
Cg0KQW5zd2VyZWQgYWJvdmUuIEkgdGhpbmsgaXQgbWFrZXMgY29kZSBjbGVhbmVyIGFuZCBlYXNp
ZXIgZm9yIG1vZGlmaWNhdGlvbg0KDQphcyBoYW5kbGVycycgYXNzaWdubWVudCBmb3IgQkFScyBi
ZWNvbWVzIGdyb3VwZWQgYXMgaXQgaXMgZG9uZSBmb3IgTVNJL01TSS1YLg0KDQoNCj4NCj4+ICt7
DQo+PiArICAgIHVuc2lnbmVkIGludCBpOw0KPj4gKyAgICBzdHJ1Y3QgdnBjaV9oZWFkZXIgKmhl
YWRlciA9ICZwZGV2LT52cGNpLT5oZWFkZXI7DQo+PiArICAgIHN0cnVjdCB2cGNpX2JhciAqYmFy
cyA9IGhlYWRlci0+YmFyczsNCj4+ICsgICAgaW50IHJjOw0KPj4gKw0KPj4gKyAgICAvKiBTZXR1
cCBhIGhhbmRsZXIgZm9yIHRoZSBjb21tYW5kIHJlZ2lzdGVyLiAqLw0KPj4gKyAgICByYyA9IHZw
Y2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfaHdfcmVhZDE2LCBjbWRfd3JpdGUsIFBD
SV9DT01NQU5ELA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIDIsIGhlYWRlcik7DQo+
PiArICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgcmV0dXJuIHJjOw0KPj4gKw0KPj4gKyAgICBp
ZiAoIHBkZXYtPmlnbm9yZV9iYXJzICkNCj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4gKw0KPj4g
KyAgICBmb3IgKCBpID0gMDsgaSA8IFBDSV9IRUFERVJfTk9STUFMX05SX0JBUlMgKyAxOyBpKysg
KQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBpZiAoIChiYXJzW2ldLnR5cGUgPT0gVlBDSV9CQVJf
SU8pIHx8IChiYXJzW2ldLnR5cGUgPT0gVlBDSV9CQVJfRU1QVFkpICkNCj4+ICsgICAgICAgICAg
ICBjb250aW51ZTsNCj4+ICsNCj4+ICsgICAgICAgIGlmICggYmFyc1tpXS50eXBlID09IFZQQ0lf
QkFSX1JPTSApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgdW5zaWduZWQgaW50IHJv
bV9yZWc7DQo+PiArICAgICAgICAgICAgdWludDhfdCBoZWFkZXJfdHlwZSA9IHBjaV9jb25mX3Jl
YWQ4KHBkZXYtPnNiZGYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFBDSV9IRUFERVJfVFlQRSkgJiAweDdmOw0KPj4gKyAgICAgICAgICAgIGlm
ICggaGVhZGVyX3R5cGUgPT0gUENJX0hFQURFUl9UWVBFX05PUk1BTCApDQo+PiArICAgICAgICAg
ICAgICAgIHJvbV9yZWcgPSBQQ0lfUk9NX0FERFJFU1M7DQo+PiArICAgICAgICAgICAgZWxzZQ0K
Pj4gKyAgICAgICAgICAgICAgICByb21fcmVnID0gUENJX1JPTV9BRERSRVNTMTsNCj4+ICsgICAg
ICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfaHdfcmVhZDMy
LCByb21fd3JpdGUsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByb21f
cmVnLCA0LCAmYmFyc1tpXSk7DQo+PiArICAgICAgICAgICAgaWYgKCByYyApDQo+PiArICAgICAg
ICAgICAgICAgIHJldHVybiByYzsNCj4gSSdtIG5vdCB0aGUgbWFpbnRhaW5lciBvZiB0aGlzIGNv
ZGUsIGJ1dCBpZiBJIHdhcyBJJ2QgYXNrIGZvciB0aGlzIGFuZCAuLi4NCj4NCj4+ICsgICAgICAg
IH0NCj4+ICsgICAgICAgIGVsc2UNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICB1aW50
OF90IHJlZyA9IFBDSV9CQVNFX0FERFJFU1NfMCArIGkgKiA0Ow0KPj4gKw0KPj4gKyAgICAgICAg
ICAgIC8qIFRoaXMgaXMgZWl0aGVyIFZQQ0lfQkFSX01FTTMyIG9yIFZQQ0lfQkFSX01FTTY0X3tM
T3xISX0uICovDQo+PiArICAgICAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52
cGNpLCB2cGNpX2h3X3JlYWQzMiwgYmFyX3dyaXRlLCByZWcsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA0LCAmYmFyc1tpXSk7DQo+PiArICAgICAgICAgICAgaWYgKCBy
YyApDQo+PiArICAgICAgICAgICAgICAgIHJldHVybiByYzsNCj4gLi4uIHRoaXMgdG8gYmUgbW92
ZWQgLi4uDQo+DQo+PiArICAgICAgICB9DQo+IC4uLiBoZXJlIHRvIHJlZHVjZSByZWR1bmRhbmN5
Lg0KPg0KPj4gQEAgLTU1MywxMSArNTgwLDEzIEBAIHN0YXRpYyBpbnQgaW5pdF9iYXJzKHN0cnVj
dCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAgICAgICAgIHJvbS0+YWRkciA9IGFkZHI7DQo+PiAgICAg
ICAgICAgaGVhZGVyLT5yb21fZW5hYmxlZCA9IHBjaV9jb25mX3JlYWQzMihwZGV2LT5zYmRmLCBy
b21fcmVnKSAmDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9ST01fQURE
UkVTU19FTkFCTEU7DQo+PiArICAgIH0NCj4+ICAgDQo+PiAtICAgICAgICByYyA9IHZwY2lfYWRk
X3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfaHdfcmVhZDMyLCByb21fd3JpdGUsIHJvbV9yZWcs
DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDQsIHJvbSk7DQo+PiAtICAgICAg
ICBpZiAoIHJjICkNCj4+IC0gICAgICAgICAgICByb20tPnR5cGUgPSBWUENJX0JBUl9FTVBUWTsN
Cj4+ICsgICAgcmMgPSBhZGRfYmFyX2hhbmRsZXJzKHBkZXYpOw0KPj4gKyAgICBpZiAoIHJjICkN
Cj4+ICsgICAgew0KPj4gKyAgICAgICAgcGNpX2NvbmZfd3JpdGUxNihwZGV2LT5zYmRmLCBQQ0lf
Q09NTUFORCwgY21kKTsNCj4+ICsgICAgICAgIHJldHVybiByYzsNCj4+ICAgICAgIH0NCj4gU2Vl
aW5nIHRoaXMgbW92ZWQgKGhlbmNlIHBlcmhhcHMgbW9yZSBhIHF1ZXN0aW9uIHRvIFJvZ2VyIHRo
YW4gdG8NCj4geW91KSByZXN0b3Jpbmcgb2YgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgLSB3aHkgaXMg
aXQgdGhhdCB0aGUgZXJyb3INCj4gcGF0aChzKSBoZXJlIGNhcmUocykgYWJvdXQgcmVzdG9yaW5n
IHRoaXMsIGJ1dCAuLi4NCj4NCj4+ICAgICAgIHJldHVybiAoY21kICYgUENJX0NPTU1BTkRfTUVN
T1JZKSA/IG1vZGlmeV9iYXJzKHBkZXYsIGNtZCwgZmFsc2UpIDogMDsNCj4gLi4uIG9uZXMgaW4g
bW9kaWZ5X2JhcnMoKSAoYW5kIGRvd253YXJkcykgZG9uJ3Q/IEkgd2FzIHdvbmRlcmluZw0KPiB3
aGV0aGVyIHRoZSByZXN0b3JlIGNvdWxkIGFjdHVhbGx5IGJlIGRvbmUgcHJpb3IgdG8gdGhlIHR3
byBjYWxscw0KPiAob3IsIGluIHRoZSBvcmlnaW5hbCBjb2RlLCB0aGUgb25lIGNhbGwpLCBvciBw
ZXJoYXBzIGV2ZW4gcmlnaHQNCj4gYWZ0ZXIgdGhlIGxhc3QgY2FsbCB0byBwY2lfc2l6ZV9tZW1f
YmFyKCkuIEF0IHRoZSB2ZXJ5IGxlYXN0IHRoZQ0KPiBjb21tZW50IGZ1cnRoZXIgdXAgc3VnZ2Vz
dHMgbWVtb3J5IGRlY29kZSBvbmx5IGdldHMgZGlzYWJsZWQgZm9yDQo+IHNpemluZyBCQVJzLCB3
aGljaCB3ZSdyZSBkb25lIHdpdGggYXQgdGhpcyBwb2ludC4NCg0KRm9yIGFsbCB0aGUgYWJvdmU6
IHdoYXQgdGhpcyBwYXRjaCBkb2VzIGlzIGEgcHVyZSBjb2RlIG1vdmUuDQoNCkkgaGFkIG5vIGlu
dGVudGlvbiB0byBhbHRlciBpdCBpbiBhbnkgb3RoZXIgd2F5IHJhdGhlciB0aGFuIHRoYXQuDQoN
CklmIHlvdSB0aGluayB0aGUgY29kZSBuZWVkcyB0byBiZSBmdW5jdGlvbmFsbHkgbW9kaWZpZWQg
SSB0aGluayB0aGlzDQoNCmRlc2VydmVzIGEgZGVkaWNhdGVkIHdvcmsgdG8gYmUgc3VibWl0dGVk
LCBidXQgSU1PIHRoaXMgcGF0Y2gNCg0Kc2hvdWxkbid0IHRvdWNoIGFueXRoaW5nLg0KDQo+DQo+
IEphbg0KPg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg==

