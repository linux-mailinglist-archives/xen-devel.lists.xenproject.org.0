Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218674028B2
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:24:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181003.327946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNa98-0007iW-1L; Tue, 07 Sep 2021 12:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181003.327946; Tue, 07 Sep 2021 12:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNa97-0007gg-Tz; Tue, 07 Sep 2021 12:24:13 +0000
Received: by outflank-mailman (input) for mailman id 181003;
 Tue, 07 Sep 2021 12:24:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hq6o=N5=epam.com=prvs=98842be756=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNa96-0007gY-Uy
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:24:13 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8167cb72-0fd6-11ec-b0ec-12813bfff9fa;
 Tue, 07 Sep 2021 12:24:11 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 187Bh5dS023794; 
 Tue, 7 Sep 2021 12:24:08 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 3ax0pd9gv1-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 12:24:08 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR03MB4949.eurprd03.prod.outlook.com (2603:10a6:20b:84::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 12:23:59 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 12:23:59 +0000
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
X-Inumbo-ID: 8167cb72-0fd6-11ec-b0ec-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQzOyFXyiwn7PkXjCS4i5+hsvLQPObhwIj8r21RVL6zrg4bn0EnkiqcJ7eWyoUik8Q25OqVF7MPB6X6FjG8pTRKF1PljTIdbI3BXItU/HozIMixWCI6BG0/Y+jhQCJebRD+UwF3qXFg1bfqCbErW2pIYv/8jcyQUcNJpk1j86LpRe947vqbJyv7I3f9uTquxug+fUaeOMt+5kSeZjV6/NDPjFKnr3WR7oTRITd7DRSR8JsOHjANGMCdVeJWldQxFK13l8hHzADax34TJsVg9tH0DGr0oMMCdyL/KYmUOUGUHtG4Iml3MkkQY1UTtW/2dFwZHX0il9fnFf/98hxLlhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8qGrsR7JiIMdJ8qARnR6BCFPDRyxpVUqctH0MnLAb4A=;
 b=VvjL9WlzXozdtpeyRgI3lTABGgYuA9AmQK3c5xFt3jYu3GxvKt/RNC8luah0UHv0L9pBeE/MvoQFuFf5jgZuhjNatF/GCIDM6sXxfwGkRZ5DpBdN26adn8XaQTM2HHxvORSqQPki8OMfeWR9nMGuHA91PWDMyqQmG4/u6TgF5dEiZrH6Nc0qbMRjKX1QZGO3A4iLbR1DZZgiznDB/FJ9f5jIs+EvPCbV0x48vjlH5437CJ3HE+4D1nxVXpIqoQzoNIA3MijPLlE+6WGOtuDNgMIQP3poyGWEq8s6TnMmJQ/K+UZJbPcJetkNXupy9H7aOKKBUOYn7Oy56bmDP+X1LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qGrsR7JiIMdJ8qARnR6BCFPDRyxpVUqctH0MnLAb4A=;
 b=FyFbW+l0W3d5Bd+k9ybDUicMI13K95s09w5XXFirqrgcEGG8Dd89qGx0m48RcXL/zQs5SRJd5Fg4WzIilfUmMph8h7GiWFGcoU0vbCKvFnrD0NgpvIgpk0/zCcyip30WwHYqYywh3pQ3gVTR2FLfB16bQIfzBurWAsALh9KCwScyT2Tm8G0UCEfZ/q0q3HMcRZu/NLU+FHRE/9z3rVFZq7uj+ST/u0dgwlGKWnCLd7XJO9+iOMLDtsQHb95ZUqUqnidswuMQ0GDsG/hbi8UUYay9ZJR22Tmhml9F+zUiAJlF43InoGOBIDgsP0eYn+6nOU+v4FZGEgPLX/tBAGViNA==
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
Subject: Re: [PATCH 4/9] vpci/header: Add and remove register handlers
 dynamically
Thread-Topic: [PATCH 4/9] vpci/header: Add and remove register handlers
 dynamically
Thread-Index: 
 AQHXoKusySJnLVveGkulaWKrBZdXpKuXEOQAgAFPE4CAAAkRAIAAB3eAgAALDQCAAAeQAIAAAQeAgAAA/AA=
Date: Tue, 7 Sep 2021 12:23:58 +0000
Message-ID: <37b08bea-2e0a-1a9e-aa26-8e3f61ddce7f@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-5-andr2000@gmail.com>
 <8bb58d2d-255b-96e9-50ff-529985c655d5@suse.com>
 <16e396be-89f5-4d42-d57b-d91f09b70644@epam.com>
 <00bbe12b-6a79-e660-c5c1-57ccb200d2eb@suse.com>
 <242373cf-9854-74b7-4d54-bbcacc6cb7cb@epam.com>
 <938156e7-cbd0-a19e-f09f-a41dce051367@suse.com>
 <b4c94187-db81-d52f-0425-959fe1e9e83a@epam.com>
 <de2165eb-0c81-d020-f76a-3a8f97fb8cfe@suse.com>
In-Reply-To: <de2165eb-0c81-d020-f76a-3a8f97fb8cfe@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: debb9fc1-4a64-4f7c-81d1-08d971fa5e86
x-ms-traffictypediagnostic: AM6PR03MB4949:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB4949B32902410F0B635119F5E7D39@AM6PR03MB4949.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BMbD0oZNp93Gkku0wuU9+6c9HEzB/R0f1rt6hAeRi3XPTpYVVzyqqvZvt1n6MVqfQuE7IGyg8L+wiCwP8ojCc7Bm3A99RcEMY0OV0mHX1bSGRvutFTfD1VIohjIOHFQUeoaTFi0SQNJpnRcbyzOL9fBu3hqvxj+0t59WBeL7wwgxQ1m/C7k5cSWCoIVWslBfNdOXn5mDU7zoftl53w9YvC4Hwj4F477yBVNYWHCujHAG7LnZDMohajS+ACIyeHeWSzxXX+cPYamRJQbesfYJ4W1itGSiuHN8/8QxptEfzxYtY1YyPRyRw5VuyevlBBX1YcrYxCDHQ/w5PA/i8mOA7zDNR7aDFPCzNIvpG122AYL2GwzZEUBzDST679mr6h+lrreyc6LWYWpBEYnrchci3kfYZ52l+tU2DrIpR/gfgUoRSOz8Hc7MYFt/50BjBLR8p3xT0c/1adlR/9LLJKJ7ZsmO3TGNa+vaLJvDo7dulqmBHPC/+rtvyb2KGGmXMtA6ak8Gon+iUyO+eDGT6Iv6gPo7QsZWbbpVvgzyV6A6sUbuJqmfL24K6csPI7JCw0fwxXB0t+JY+6YHGEqTEPXubPBn8t2GZLVtH/6MuztzwPml1N02lVHbvwXD/JLoN7PKVjKPHyZ88axnBpPeskpm9tFngVv7dHxFf0gRY366qss2gCVhHipRxtn+v3h9LJ7Hj7Zt5VDr8SpbRtwz8e+4L3lx/R9xInrzB4PDwPC+fZ7hTzxyKuQX4tELyukXiBPLasjknXobCeacD5gxJtwMcw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(83380400001)(86362001)(110136005)(54906003)(31696002)(6486002)(2906002)(38070700005)(122000001)(508600001)(36756003)(6512007)(31686004)(38100700002)(4326008)(71200400001)(26005)(186003)(66476007)(66556008)(8676002)(64756008)(66446008)(66946007)(53546011)(91956017)(76116006)(8936002)(6506007)(5660300002)(2616005)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WTBIUnpNZ3hLNnZBdlBReWMyTENKTTJUeVFHT2J6UW5VWXhJSVVTbFdJeWw1?=
 =?utf-8?B?OXVaenpaSUQxMHorY2F1elJ5OUNicnJNTnArOVJ5RjZ5VVM0NElkY3dFNi9w?=
 =?utf-8?B?MVRFZHpLdDJRRUgrWkpLNkVuckVlOGdyZDZvRzROYXVYQnRwQzU5RmxWamFD?=
 =?utf-8?B?N3Ercko5ZW83YlhlUUVYWkVTSVByT0tkMGxhUncxWnlXTTNNZXVBL2w5THc0?=
 =?utf-8?B?ZUVoQVpRTk5oSkp4UmxzbUdwNjFsdFc3MFV2QSt4U0NuRzgvanRyMm1IU2xw?=
 =?utf-8?B?VUd2NXJCWHZmajZ5a0FXTUpjZkhYM0lURDA5T2lWWnBPNXNpTTNUWEVvRU1V?=
 =?utf-8?B?M3dDZGRMQll4UzhIbWRKWm05RzNibHMyZ3dBcUN4bnBNa0F0eG5RS2RLZGZ2?=
 =?utf-8?B?ZFFYR1B2VXB2RnI2L05OMnpsTWNzeU5nK0swVWdmWVZUckhMV0NOWlllaWcx?=
 =?utf-8?B?RlBxSm1nbGlSaDVNWUc1Y2hQTXl4QlUzZHY4YjFEWmtYem8rWHluQWhZUlNk?=
 =?utf-8?B?RHlicnpwd05Hbm5OTkNnc2F3L2xBTjRUaGRGL3NGclVnTWl1MWdLUWoxcXdo?=
 =?utf-8?B?QTVvQWRmQ2hqN2xPTC80L29vL0N1SkFOWURSZ1JGVUZNRmc1c09pdld1R1N6?=
 =?utf-8?B?MVp3STVhYlVWaVl1QnBkUWYxMkFjU2FtdG9SYXF3TzJKM25FM3ozdVd2MEVy?=
 =?utf-8?B?ZFpVSWpyYXhWRGdGVTh4VlpWb2FlbmcxMWhmTER2c3NxZWVhd3V4OUJXWlBy?=
 =?utf-8?B?aWxGbnJETWRJbENEU2hqRzcrdEZiRzNDaUk2KzBmRzN6YXB6a3lHemg5SThR?=
 =?utf-8?B?UW94T3d2T3RnaFlBM2Flc3Z6ZzF6emNkbVBwOGR6T09oUDlFYjJOL29UUG5x?=
 =?utf-8?B?YVZ4WUdEWkFPQkJ1bWVZR2M4QkRBaHVxRm9yRDBaK0YzWEZQU2Z0RzljMFM0?=
 =?utf-8?B?TFhRVG1JdmhMMVBkNjZxMzZTMGVlWnhwU2lsREhZUENtSnVVVzFrNEQ2MjV3?=
 =?utf-8?B?U3p4bTRQcTJGVGxERlRDaTgwMFVjeDYyVXlkNGhtYjRmZWEzVlAwWE1QSUtC?=
 =?utf-8?B?eVF5bGVPUDhYSGhyT0tHeExvT1pVVlBIekQzOFJUd2RpeVAralhyajZyRzE2?=
 =?utf-8?B?OS9GVHo0QmR2Qzl2ZGloRHZkU1NJSk5DZlpzUHBwc0VVZEJjZU0vVFlXME02?=
 =?utf-8?B?OU5HcTJnaXFPcWFQc0Y4ZlBzSGE4ZDhPZUhDS2x3TjdyV1RKR01sSkFCSktm?=
 =?utf-8?B?MGJUeGhkSHVPaUFkRWJ2OU5kVGtoMmErMGZnRlJReEJBREQxVGtoUVBjWWhL?=
 =?utf-8?B?VnJ1QWg1aGZUQ3lWNGw2OHJneDZjZWR0clROQlJET3RVUXRVZUp0YSttQWlS?=
 =?utf-8?B?djN5aUU2a2Q4cTlBanV4N3JmTElBNmdrRy9lYUdnQ1BJUmZnL3BRMUpORTYy?=
 =?utf-8?B?WGoxZjRrSzRxNlV6aWxIbDE4bHE1bkMrWm1lM2o2ZHdiWG02cjFjcXJTTm9N?=
 =?utf-8?B?bnkxaXNJVmFhZXhrM2k5bDNFQU10RFdFdE9MUFdrZHN3RFI2TXhCRDhheWNz?=
 =?utf-8?B?SjFDUCtSaHRCOGZTaUNMWjZ4MWNkYVovZG9zR25pSVpSMk80MCs4RFVTNkdK?=
 =?utf-8?B?alFMZ0VQVG9KSFlhZWM1M2dZUHZVMzd2am9udFpkSEo4T2xXeGp4bW9OeDBV?=
 =?utf-8?B?K0FZYnd0QTZWVXBHNGVIeCtaNW5iMVd3NE0zZkgwOWYxRnUzVXQzdmp0d3Rv?=
 =?utf-8?Q?x041ag8LH5w/2wCbTyxUgteZWcBAJIAhn7k1Tdr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A080D9FE583C194995993088629FDEE9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: debb9fc1-4a64-4f7c-81d1-08d971fa5e86
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 12:23:58.9897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o8RguYEOB9GEeVx5ZJwBvfbeNpSNLEdNUTNTnDyH6im8ZH7S1eJZK5DICIeryHPDS1/sx+uFlDCAgB2u2M518SJ5SUhOW52W1BBTEOajasQYBmeWGCKox6BPdqKRLLlU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4949
X-Proofpoint-GUID: dIMHYvigZppWAJf-fJ20Y8gvWPBb3h9W
X-Proofpoint-ORIG-GUID: dIMHYvigZppWAJf-fJ20Y8gvWPBb3h9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_04,2021-09-07_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070081

DQpPbiAwNy4wOS4yMSAxNToyMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA3LjA5LjIwMjEg
MTQ6MTYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDcuMDkuMjEgMTQ6
NDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjA5LjIwMjEgMTM6MTAsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNy4wOS4yMSAxMzo0MywgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAwNy4wOS4yMDIxIDEyOjExLCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAwNi4wOS4yMSAxNzoxMSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+Pj4+IE9uIDAzLjA5LjIwMjEgMTI6MDgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4+Pj4+Pj4gQEAgLTU5Myw2ICs2MjUsMzYgQEAgc3RhdGljIGludCBpbml0X2JhcnMo
c3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+Pj4+PiAgICAgIH0NCj4+Pj4+Pj4+ICAgICAgUkVH
SVNURVJfVlBDSV9JTklUKGluaXRfYmFycywgVlBDSV9QUklPUklUWV9NSURETEUpOw0KPj4+Pj4+
Pj4gICAgICANCj4+Pj4+Pj4+ICtpbnQgdnBjaV9iYXJfYWRkX2hhbmRsZXJzKGNvbnN0IHN0cnVj
dCBkb21haW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+Pj4+Pj4gK3sNCj4+Pj4+Pj4+
ICsgICAgaW50IHJjOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICAvKiBSZW1vdmUgcHJldmlv
dXNseSBhZGRlZCByZWdpc3RlcnMuICovDQo+Pj4+Pj4+PiArICAgIHZwY2lfcmVtb3ZlX2Rldmlj
ZV9yZWdpc3RlcnMocGRldik7DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArICAgIC8qIEl0IG9ubHkg
bWFrZXMgc2Vuc2UgdG8gYWRkIHJlZ2lzdGVycyBmb3IgaHdkb20gb3IgZ3Vlc3QgZG9tYWluLiAq
Lw0KPj4+Pj4+Pj4gKyAgICBpZiAoIGQtPmRvbWFpbl9pZCA+PSBET01JRF9GSVJTVF9SRVNFUlZF
RCApDQo+Pj4+Pj4+PiArICAgICAgICByZXR1cm4gMDsNCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICsg
ICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgKQ0KPj4+Pj4+Pj4gKyAgICAgICAgcmMgPSBh
ZGRfYmFyX2hhbmRsZXJzKHBkZXYsIHRydWUpOw0KPj4+Pj4+Pj4gKyAgICBlbHNlDQo+Pj4+Pj4+
PiArICAgICAgICByYyA9IGFkZF9iYXJfaGFuZGxlcnMocGRldiwgZmFsc2UpOw0KPj4+Pj4+PiAg
ICAgICAgIHJjID0gYWRkX2Jhcl9oYW5kbGVycyhwZGV2LCBpc19oYXJkd2FyZV9kb21haW4oZCkp
Ow0KPj4+Pj4+IEluZGVlZCwgdGhhbmsgeW91IDspDQo+Pj4+Pj4+PiArICAgIGlmICggcmMgKQ0K
Pj4+Pj4+Pj4gKyAgICAgICAgZ3ByaW50ayhYRU5MT0dfRVJSLA0KPj4+Pj4+Pj4gKyAgICAgICAg
ICAgICIlcHA6IGZhaWxlZCB0byBhZGQgQkFSIGhhbmRsZXJzIGZvciBkb20lZFxuIiwgJnBkZXYt
PnNiZGYsDQo+Pj4+Pj4+PiArICAgICAgICAgICAgZC0+ZG9tYWluX2lkKTsNCj4+Pj4+Pj4gUGxl
YXNlIHVzZSAlcGQgYW5kIGNvcnJlY3QgaW5kZW50YXRpb24uIExvZ2dpbmcgdGhlIGVycm9yIGNv
ZGUgbWlnaHQNCj4+Pj4+Pj4gYWxzbyBoZWxwIHNvbWUgaW4gZGlhZ25vc2luZyBpc3N1ZXMuDQo+
Pj4+Pj4gU3VyZSwgSSdsbCBjaGFuZ2UgaXQgdG8gJXBkDQo+Pj4+Pj4+ICAgICAgRnVydGhlciBJ
J20gbm90IHN1cmUgdGhpcyBpcyBhDQo+Pj4+Pj4+IG1lc3NhZ2Ugd2Ugd2FudCBpbiByZWxlYXNl
IGJ1aWxkcw0KPj4+Pj4+IFdoeSBub3Q/DQo+Pj4+PiBFeGNlc3MgdmVyYm9zaXR5OiBJZiB3ZSBo
YXZlIHN1Y2ggaGVyZSwgd2h5IG5vdCBlbHNld2hlcmUgb24gZXJyb3IgcGF0aHM/DQo+Pj4+PiBB
bmQgSSBob3BlIHlvdSBhZ3JlZSB0aGluZ3Mgd2lsbCBnZXQgdG9vIHZlcmJvc2UgaWYgd2UgaGFk
IHN1Y2ggKGFib3V0KQ0KPj4+Pj4gZXZlcnl3aGVyZT8NCj4+Pj4gQWdyZWUsIHdpbGwgY2hhbmdl
IGl0IHRvIGdkcHJpbnRrDQo+Pj4+Pj4+ICAgICAgLSBwZXJoYXBzIGdkcHJpbnRrKCk/DQo+Pj4+
Pj4gSSdsbCBjaGFuZ2UgaWYgd2UgZGVjaWRlIHNvDQo+Pj4+Pj4+PiArICAgIHJldHVybiByYzsN
Cj4+Pj4+Pj4+ICt9DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiAraW50IHZwY2lfYmFyX3JlbW92ZV9o
YW5kbGVycyhjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+
Pj4+Pj4+ICt7DQo+Pj4+Pj4+PiArICAgIC8qIFJlbW92ZSBwcmV2aW91c2x5IGFkZGVkIHJlZ2lz
dGVycy4gKi8NCj4+Pj4+Pj4+ICsgICAgdnBjaV9yZW1vdmVfZGV2aWNlX3JlZ2lzdGVycyhwZGV2
KTsNCj4+Pj4+Pj4+ICsgICAgcmV0dXJuIDA7DQo+Pj4+Pj4+PiArfQ0KPj4+Pj4+PiBBbHNvIC0g
aW4gaG93IGZhciBpcyB0aGUgZ29hbCBvZiB5b3VyIHdvcmsgdG8gYWxzbyBtYWtlIHZQQ0kgd29y
ayBmb3INCj4+Pj4+Pj4geDg2IERvbVUtcz8gSWYgdGhhdCdzIG5vdCBhIGdvYWwNCj4+Pj4+PiBJ
dCBpcyBub3QsIHVuZm9ydHVuYXRlbHkuIFRoZSBnb2FsIGlzIG5vdCB0byBicmVhayB4ODYgYW5k
IHRvIGVuYWJsZSBBcm0NCj4+Pj4+Pj4gLCBJJ2QgbGlrZSB0byBhc2sgdGhhdCB5b3UgbGltaXQg
dGhlDQo+Pj4+Pj4+IGludHJvZHVjdGlvbiBvZiBjb2RlIHRoYXQgZW5kcyB1cCBkZWFkIHRoZXJl
Lg0KPj4+Pj4+IFdoYXQncyB3cm9uZyB3aXRoIHRoaXMgZnVuY3Rpb24gZXZlbiBpZiBpdCBpcyBh
IG9uZS1saW5lcj8NCj4+Pj4+IFRoZSBjb21tZW50IGlzIHByaW1hcmlseSBvbiB0aGUgZWFybGll
ciBmdW5jdGlvbiwgYW5kIHRoZW4gZXh0ZW5kcyB0bw0KPj4+Pj4gdGhpcyBvbmUuDQo+Pj4+Pg0K
Pj4+Pj4+IFRoaXMgd2F5IHdlIGhhdmUgYSBwYWlyIHZwY2lfYmFyX2FkZF9oYW5kbGVycy92cGNp
X2Jhcl9yZW1vdmVfaGFuZGxlcnMNCj4+Pj4+PiBhbmQgaWYgSSB1bmRlcnN0b29kIGNvcnJlY3Rs
eSB5b3Ugc3VnZ2VzdCB2cGNpX2Jhcl9hZGRfaGFuZGxlcnMvdnBjaV9yZW1vdmVfZGV2aWNlX3Jl
Z2lzdGVycz8NCj4+Pj4+PiBXaGF0IHdvdWxkIHdlIGdhaW4gZnJvbSB0aGF0LCBidXQgeWV0IGFu
b3RoZXIgc2VjcmV0IGtub3dsZWRnZSB0aGF0IGluIG9yZGVyDQo+Pj4+Pj4gdG8gcmVtb3ZlIEJB
UiBoYW5kbGVycyBvbmUgbmVlZHMgdG8gY2FsbCB2cGNpX3JlbW92ZV9kZXZpY2VfcmVnaXN0ZXJz
DQo+Pj4+Pj4gd2hpbGUgSSB3b3VsZCBwZXJzb25hbGx5IGV4cGVjdCB0byBjYWxsIHZwY2lfYmFy
X2FkZF9oYW5kbGVycycgY291bnRlcnBhcnQsDQo+Pj4+Pj4gdnBjaV9yZW1vdmVfZGV2aWNlX3Jl
Z2lzdGVycyBuYW1lbHkuDQo+Pj4+PiBUaGlzIGlzIGFsbCBmaW5lLiBZZXQgdnBjaV9iYXJfe2Fk
ZCxyZW1vdmV9X2hhbmRsZXJzKCkgd2lsbCwgYWl1aSwgYmUNCj4+Pj4+IGRlYWQgY29kZSBvbiB4
ODYuDQo+Pj4+IHZwY2lfYmFyX2FkZF9oYW5kbGVycyB3aWxsIGJlIHVzZWQgYnkgeDg2IFBWSCBE
b20wDQo+Pj4gV2hlcmUgLyB3aGVuPyBZb3UgYWRkIGEgY2FsbCBmcm9tIHZwY2lfYXNzaWduX2Rl
dmljZSgpLCBidXQgYmVzaWRlcyB0aGF0DQo+Pj4gYWxzbyBiZWluZyBkZWFkIGNvZGUgb24geDg2
IChmb3Igbm93KSwgeW91IGNhbid0IG1lYW4gdGhhdCBiZWNhdXNlDQo+Pj4gdnBjaV9kZWFzc2ln
bl9kZXZpY2UoKSBhbHNvIGNhbGxzIHZwY2lfYmFyX3JlbW92ZV9oYW5kbGVycygpLg0KPj4gWW91
IGFyZSByaWdodCBoZXJlIGFuZCBib3RoIGFkZC9yZW1vdmUgYXJlIG5vdCB1c2VkIG9uIHg4NiBQ
VkggRG9tMC4NCj4+DQo+PiBJIGFtIHNvcnJ5IGZvciB3YXN0aW5nIHlvdXIgdGltZQ0KPj4NCj4+
Pj4+ICAgICBIZW5jZSB0aGVyZSBzaG91bGQgYmUgYW4gYXJyYW5nZW1lbnQgYWxsb3dpbmcgdGhl
DQo+Pj4+PiBjb21waWxlciB0byBlbGltaW5hdGUgdGhpcyBkZWFkIGNvZGUuDQo+Pj4+IFNvLCB0
aGUgb25seSBkZWFkIGNvZGUgZm9yIHg4NiBoZXJlIHdpbGwgYmUgdnBjaV9iYXJfcmVtb3ZlX2hh
bmRsZXJzLiBZZXQuDQo+Pj4+IEJlY2F1c2UgSSBob3BlIHg4NiB0byBnYWluIGd1ZXN0IHN1cHBv
cnQgZm9yIFBWSCBEb20wIHNvb25lciBvciBsYXRlci4NCj4+Pj4NCj4+Pj4+ICAgICBXaGV0aGVy
IHRoYXQncyBlbmNsb3NpbmcgdGhlc2UNCj4+Pj4+IGJ5ICIjaWZkZWYiIG9yIGFkZGluZyBlYXJs
eSAiaWYoIUlTX0VOQUJMRUQoQ09ORklHXyopKSIgaXMgc2Vjb25kYXJ5Lg0KPj4+Pj4gVGhpcyBo
YXMgYSBrbm9jay1vbiBlZmZlY3Qgb24gb3RoZXIgZnVuY3Rpb25zIGFzIHlvdSBjZXJ0YWlubHkg
cmVhbGl6ZToNCj4+Pj4+IFRoZSBjb21waWxlciBzZWVpbmcgZS5nLiB0aGUgMm5kIGFyZ3VtZW50
IHRvIHRoZSBhZGQtQkFScyBmdW5jdGlvbg0KPj4+Pj4gYWx3YXlzIGJlaW5nIHRydWUgYWxsb3dz
IGl0IHRvIGluc3RhbnRpYXRlIGp1c3QgYSBjbG9uZSBvZiB0aGUgb3JpZ2luYWwNCj4+Pj4+IGZ1
bmN0aW9uIHdpdGggdGhlIHJlc3BlY3RpdmUgY29uZGl0aW9uYWxzIHJlbW92ZWQuDQo+Pj4+IFdp
dGggdGhlIGFib3ZlIChlLmcuIGFkZCBpcyBnb2luZyB0byBiZSB1c2VkLCBidXQgbm90IHJlbW92
ZSkgZG8geW91DQo+Pj4+IHRoaW5rIGl0IGlzIHdvcnRoIHBsYXlpbmcgd2l0aCBpZmRlZidzIHRv
IHN0cmlwIHRoYXQgc2luZ2xlIGZ1bmN0aW9uIGFuZCBhZGQNCj4+Pj4gYSBwaWVjZSBvZiBzcGFn
aGV0dGkgY29kZSB0byBzYXZlIGEgYml0Pw0KPj4+IE5vLCB0aGF0IEkgYWdyZWUgd291bGRuJ3Qg
YmUgd29ydGggaXQuDQo+Pj4NCj4+Pj4gV2hhdCB3b3VsZCB0aGF0IGlmZGVmIGxvb2sgbGlrZSwN
Cj4+Pj4gZS5nLiAjaWZkZWYgQ09ORklHX0FSTSBvciAjaWZuZGVmIENPTkZJR19YODYgJiYgYW55
IG90aGVyIHBsYXRmb3JtLCBidXQgQVJNPw0KPj4+IEEgbmV3IHNldHRpbmcsIHByZWZlcmFibHk7
IGUuZy4gVkNQVV9VTlBSSVZJTEVHRUQsIHRvIGJlICJzZWxlY3QiZWQgYnkNCj4+PiBhcmNoaXRl
Y3R1cmVzIGFzIGZ1bmN0aW9uYWxpdHkgZ2V0cyBlbmFibGVkLg0KPj4gU28sIGFzIGFkZC9yZW1v
dmUgYXJlIG9ubHkgbmVlZGVkIGZvciBBcm0gYXQgdGhlIG1vbWVudA0KPj4geW91IHN1Z2dlc3Qg
SSBhZGQgVkNQVV9VTlBSSVZJTEVHRUQgdG8gQXJtJ3MgS2NvbmZpZyB0byBlbmFibGUNCj4+IGNv
bXBpbGluZyB2cGNpX2Jhcl9hZGRfaGFuZGxlcnMvdnBjaV9iYXJfcmVtb3ZlX2hhbmRsZXJzPw0K
Pj4gVG8gbWUgdGhpcyBpcyBtb3JlIGFib3V0IHZQQ0kncyBzdXBwb3J0IGZvciBndWVzdHMsIHNv
IHNob3VsZCB3ZSBwcm9iYWJseSBjYWxsIGl0DQo+PiBWUENJX1hYWCBpbnN0ZWFkPyBFLmcuIFZQ
Q0lfSEFTX0dVRVNUX1NVUFBPUlQgb3Igc29tZXRoaW5nIHdoaWNoDQo+PiB3aWxsIHJlZmxlY3Qg
dGhlIG5hdHVyZSBvZiB0aGUgY29kZSBiZWluZyBnYXRlZD8gVkNQVV9VTlBSSVZJTEVHRUQgc291
bmRzDQo+PiBsaWtlIG5vdCBjb25uZWN0ZWQgdG8gdnBjaSB0byBtZQ0KPiBBbmQgdmFsaWRseSBz
byAtIG15IGZpbmdlcnMgZGlkbid0IHR5cGUgd2hhdCB0aGUgYnJhaW4gdG9sZCB0aGVtLiBJJ3Zl
DQo+IG1lYW50IFZQQ0lfVU5QUklWSUxFR0VELiBJIHdvdWxkIGFsc28gYmUgb2theSB3aXRoIEhB
U19WUENJX0dVRVNUX1NVUFBPUlQNCj4gKGkuZS4gbm90IGV4YWN0bHkgd2hhdCB5b3UndmUgc3Vn
Z2VzdGVkKSwgZm9yIGV4YW1wbGUuDQpJJ2xsIHN0aWNrIHRvIEhBU19WUENJX0dVRVNUX1NVUFBP
UlQgYXMgaXQgc2VlbXMgdG8gYmUgbW9yZSBkZXNjcmlwdGl2ZQ0KPiBKYW4NCj4NClRoYW5rIHlv
dSwNCg0KT2xla3NhbmRyDQo=

