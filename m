Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F4D3A2F68
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 17:34:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139956.258680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrMgW-00061A-64; Thu, 10 Jun 2021 15:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139956.258680; Thu, 10 Jun 2021 15:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrMgW-0005yg-2R; Thu, 10 Jun 2021 15:33:32 +0000
Received: by outflank-mailman (input) for mailman id 139956;
 Thu, 10 Jun 2021 15:33:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVv/=LE=epam.com=prvs=679567fbaa=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1lrMgU-0005ya-NB
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 15:33:30 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 765242df-cc0a-479e-8e6c-996c1c274d6b;
 Thu, 10 Jun 2021 15:33:28 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15AFU9DN016699; Thu, 10 Jun 2021 15:33:27 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 by mx0a-0039f301.pphosted.com with ESMTP id 393mqp07bn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 15:33:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3425.eurprd03.prod.outlook.com (2603:10a6:208:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.26; Thu, 10 Jun
 2021 15:33:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b459:9e8c:964b:a3d1]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b459:9e8c:964b:a3d1%6]) with mapi id 15.20.4195.031; Thu, 10 Jun 2021
 15:33:22 +0000
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
X-Inumbo-ID: 765242df-cc0a-479e-8e6c-996c1c274d6b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1/gRDqDlriGBVRGYmEJZrP3wLIVV/CEbFPn7FTBPXItoPwjSDxjfqqCI199QnvYn6G5knjk4bDqrXg8a/bMD4q2stTPuDP/KH/qHMpyV3fdWP5bGoZ6xIyah4HVhyy+AjKNK1JmQ7F+b7iSHfCNH+WHj+UNouRZQAn8BmORFJ6zklPdDAlcskhT56ecldl4P+RmIiJcKN/0EHyuc/2KItNDfTwZvtO9FFC1EstujmjAEFKjXb688eSfDoymOIuzw76v4ey3TKMBABhx+iauGRs8UQnuDkBH2odhcyWSrIRJ+t3M+qR4NOdDyGTo2np2hAiDaWy55F6TQD0c7EY8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSjApoFD0gmo8JADzxrc3DbSryHX8BK83gTeR0Vn8Jo=;
 b=e3EhKj7Nu/gG71xkWWJg4LKqmwQWQl+1kTuciOu3rJt89CnDswv08mKixDIMI8TrgCYe66iBeiY9G4vSKu3QBfJqGViJKnPQ+p8pgfWc9svy46p0gkPxC3HurHthmbwHwLoXx7hQAvMIDNtqv0cutvzfdlUrXA1on1ekjxTU+dqe3E7F9vVqAPOjbyn4oER5LT508CJcgwrDgcjTSQnfsSoDgME55LUB29B2tO1sZM06kSpftnMLD5+Eb8hP3qp9/qGzE+eNjFAN2tks6x5OKVFfLGFgbl7H+D0jqeBQqVQAvb8dEyavE9Dn+N7hX131yOHNkPoqCwbUGjVlQ0NITw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSjApoFD0gmo8JADzxrc3DbSryHX8BK83gTeR0Vn8Jo=;
 b=NRLQErikzmutj/DBOWj9TDZpgN60dfChFYQVOpv4eDYa7tT8+d+5qkWcKxgIme1AB5pC1O/xQ7PJr6qbV6rC+Fm15O+vnwYYnT1lyrw5QEEPh7OTEvJIJ3QEMU6H/31ROEr4cL/xnZc+UcMTDrvVpHO0TWQj6iVokHso54Jx++L1/nZ65Z3LyC8Ra+xibHxwTVhIcY46hi3/lHKffeb0vuHmoo96QmB/HCEO5YNfMSN1iD20vtByrfOx0dkVzQ4kYFc7uJxy4PGHilIxOrK2tooKYLji3AVBfQeo4B6bmWT8ajKaoWZknvf5LalG3Nc+8Tey/W3hvmuLclf7HE+pdA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
Thread-Topic: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
Thread-Index: AQHXWQwW/O3obtZgqkmpGRvt7ZNDkasM6aMAgAAjXoCAAEW+AIAAFw0A
Date: Thu, 10 Jun 2021 15:33:22 +0000
Message-ID: <e0f73a05-b027-d0b6-8f8d-a1078dedccf7@epam.com>
References: <c10e16c9-ec42-336f-e838-caca49b39723@epam.com>
 <YMHFQA1L61ntKNRq@Air-de-Roger>
 <30955a5b-ee46-60d7-ae56-23dc7c91008c@epam.com>
 <YMIdbGCpFGZGwLoN@Air-de-Roger>
In-Reply-To: <YMIdbGCpFGZGwLoN@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35281ce5-fdd6-4ac8-2b8b-08d92c251516
x-ms-traffictypediagnostic: AM0PR0302MB3425:
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3425982BC5232A6A39FF1AE5E7359@AM0PR0302MB3425.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XOIvHe7+K/JJdfXTLVIatV8Y5mf5cl+meYUyMrQJPeMDqVCDsHV5S/S10+K09B8KN4Edk9gZ6nHZKC6gwLM0Mgx74fGDTMzOyADi00PlLhNkduJFYGPjurBkKpgugqv+Ov7cj76wMw+I//2SlsD9OBQPWu0udWqes7R9R9/4pc1wuJTLWBfMUFN13nd/LPyie/LsFvFkyS+/MHkZiQu+AFtyRkMMUolysMSeqrIHkgePY7hjeH8LTu5VDMQszVnt49fHXvDRSrRA6saZl31uVtxe1z3ff05befxBH+KY3w7VK0bKufszBpChloxz7Umr4CPLD/JTvrxG8QKrkh1xAuefNils8PlShjTKD0WLVWlAS3JH2IU6wUJSoVLIBnV/7OnBCRnDNKUGSv3LjYkGbflsUQ0o79xvhrb+dsE3Tjj09zTKY5q4b50F0NfYCgQf1dNjqwxRxBYAE4qcVHe2vhj+7EPyX8Q4q2xAPq4ycRhVsQQkkwo/DzRAKsFbf/Mi4Q80hH+UxSzaBCEf2x+FRthYRqkiSyq+5xiVImNkeqOWTVZMvjubsSUp5eflGZEuwPXRVDnyYooV9hW4Dv1oMSw/Yfh6zdRmklZQPHEtOIVuwYEOB9Hr67jnfPo4SUi0/dIaJ19TF6EPb6pjRpgLDDSEYb7mhh2sDtXMFin7xz5pOCrZPJvEfm/ltkjISo1LFXcOgMjJin+S8jXHcxutKOvKTXOeb0AD12M3Af3ZmH12ggK2eQbNDhi8UK/ViW6RzjMvfmYvLDXS1805HkKWcOiRCWrGJj4GFUQxODzR+Lo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(2906002)(31696002)(6506007)(316002)(66446008)(53546011)(6916009)(5660300002)(64756008)(6512007)(71200400001)(54906003)(66946007)(6486002)(26005)(76116006)(38100700002)(66556008)(91956017)(83380400001)(36756003)(478600001)(8936002)(86362001)(66476007)(2616005)(4326008)(186003)(31686004)(122000001)(8676002)(966005)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?aEJTMW9WT3hsNUd2UTBjbWIybXBadFZ2WHBWNy9aNWRUMWF5dWt4SlFuZXI4?=
 =?utf-8?B?Vi9Iczd0RzVSUVhmd1JNakUwSjBtNjg0U29kL2FGcG1QL1dVMDVDclBRV1Jp?=
 =?utf-8?B?Y1UyNWJoQkxrcDRaeTVPNlBjS3BYc09YbGdXRXZRTjVYWko1bGNkVXNBYnMv?=
 =?utf-8?B?dUZILzE3ckhyVTR6Q1crRzFBdXd6V2prQVNtMllDQkZmQnlvdlc2V0l3QWo1?=
 =?utf-8?B?alBtOU5FMFZXQnVBN0FwN2doUHh5TGwySHNEaE0zazRHb2g5dDl0cEJvMzZP?=
 =?utf-8?B?enU2eVRRTXQyS2xoL0RCZlZWYlZ2OTdIeWV6TFlEbUxSNUdMVVIyU29MSEdC?=
 =?utf-8?B?L08rRWZwczlVL1hpWkhBNEl6Skx4UzJEcFR4VGZ5NmZ6Nkhqd2NuRC9kd3Bw?=
 =?utf-8?B?NUI0U3VTcklNTHlva29UOVFhYk50M1dCY2RhYXN5OWFQUGpVTGFDME5PS2lN?=
 =?utf-8?B?aUlVZkNLNUR6R2I5UkdsMXJVa1Q3cWhpeWtnRE5xS0FoOFhDYmp0clBpU0pv?=
 =?utf-8?B?Q1loRTUwVkNiOHRxaEw5cm5RbWVuc2tHcU4yVWhNcFpxbnVFNFJma09uWkUv?=
 =?utf-8?B?R3JxZWFzL0ZkNmlmUkVXS0pSaHdLWlJOYlMvajdBZ3I2ekRDVEJwME5UbDdy?=
 =?utf-8?B?amtncW1wMUxtTExkQkJUcFRsc1pPOUVVbXhobk8wTTZ3RjRFUUxiak5YMGV4?=
 =?utf-8?B?Sy9NdDJXQkZUdmVJblFmQ1U2Yk0yb2Q2UThObDBiUWNTdVJPWUxVb0ZnZkdi?=
 =?utf-8?B?cXpOYjZabGNUZ3dCYTd3Q010SnIzYi9VazdLclltTXdtTUVZbEtrNFlWMUlv?=
 =?utf-8?B?bXZCOEptWWx1ajBOS0Z1clUxM0tHL0ZCUllQMGZrYTF3MXE5TC9HNTlyQXpv?=
 =?utf-8?B?MFk0N1VXS3JtNHVmZzlVeHp4RitkMjJSNHpZcUp2RlViSFRjdTYrS1VSL045?=
 =?utf-8?B?NFFxOTE4NGQvdE5Ca0JBODh1N1pHNXd1Z0VYdTBWNW8wRGxrcnM2UHQxRnE3?=
 =?utf-8?B?cEg5WDdlQ3NMQUR2VDVaQWVicU1BNlZhRXhueFJZS00yNjhBTjZuaUFnL2x4?=
 =?utf-8?B?dHJrQWc2RGlJQzY5YXZtS1FwWWZINWM5dU8vcFRTTmVDeHhGNkdhekpYUFVY?=
 =?utf-8?B?MXU2bXZoWXA3Wk9UamJERVZ4NjkwZ3EzUlEyeDY5dVBEamRjSkdkL2IvajZr?=
 =?utf-8?B?TTZDMExBMHNudDdrWk5ZZVh5b1hZdnNLbytYcmNMNFM3bVJjUnZCNjRUVkg3?=
 =?utf-8?B?NkhEaURpOTRERkVudnFaRHkyRUlBdlVpMlB5MXg5aE4zbnNyeUVaL0dCZktX?=
 =?utf-8?B?Y0dORTkyR1hxajFCQ1lCWVkzbDJMY1F5MURMWUhYc2QxdXpmVS84SGljbEQr?=
 =?utf-8?B?L1hvL09DZTF0ZFQxTFNDRVhwTjNVQ0NudXBHSlB6bE5MaVR0WFpvcGVQR2dF?=
 =?utf-8?B?OFVNb281V0xuYzFVTEdCbUpYYmxzY2tTemw3WlkwV3FsckxLekVVZXluVjF4?=
 =?utf-8?B?N2JiWk9pUFFGTjdySGcrQW9RR1dmVGhLUmxmRXBVbjZjbnkwZmVqQ254V3F6?=
 =?utf-8?B?UElJTWxUUG9Mc3lFUExGZVdxU013eXZOSE5WcGlTc0EyZU9hbFhsN1dKTkg3?=
 =?utf-8?B?MFRsNUZaOFQ0SUwwY01qSGozc3YrVllCK3lnN3pYRWZRd0M2Z2ZCYTlXNXpC?=
 =?utf-8?B?WDRJVGxsQlErTDZnWm5HOWUzNHJmVXZ4M1JqRUhISUJBd2YreGFXMUxTOG9H?=
 =?utf-8?Q?5LpvqH4Wr/+lSH2Ia7RD67YwEtKuXhM7eHgUer8?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E50BAF7FFE5AE4E98E48347C8B4937E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35281ce5-fdd6-4ac8-2b8b-08d92c251516
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 15:33:22.7667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKg0xWsdKH1xLcs7KIyarBOeeecuAUo5LuE23MCkB0rj77k/CskMpL2vmDjHiPdJTSiV1xJ4VUj/Fk/4Gm8gurJ+EfOzwjVOt6r0ZtoJ53bXj9oo091UhyVGKFskXDe0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3425
X-Proofpoint-GUID: CBU5R6i5jAt7B3e_iTuKBLf3xh4Zdh-g
X-Proofpoint-ORIG-GUID: CBU5R6i5jAt7B3e_iTuKBLf3xh4Zdh-g
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100099

DQpPbiAxMC4wNi4yMSAxNzoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gVGh1LCBK
dW4gMTAsIDIwMjEgYXQgMTA6MDE6MTZBTSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
d3JvdGU6DQo+PiBIZWxsbywgUm9nZXIhDQo+Pg0KPj4gT24gMTAuMDYuMjEgMTA6NTQsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gRnJpLCBKdW4gMDQsIDIwMjEgYXQgMDY6Mzc6MjdB
TSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEhpLCBhbGwhDQo+
Pj4+DQo+Pj4+IFdoaWxlIHdvcmtpbmcgb24gUENJIFNSLUlPViBzdXBwb3J0IGZvciBBUk0gSSBz
dGFydGVkIHBvcnRpbmcgWzFdIG9uIHRvcA0KPj4+PiBvZiBjdXJyZW50IFBDSSBvbiBBUk0gc3Vw
cG9ydCBbMl0uIFRoZSBxdWVzdGlvbiBJIGhhdmUgZm9yIHRoaXMgc2VyaWVzDQo+Pj4+IGlzIGlm
IHdlIHJlYWxseSBuZWVkIGVtdWxhdGluZyBTUi1JT1YgY29kZSBpbiBYZW4/DQo+Pj4+DQo+Pj4+
IEkgaGF2ZSBpbXBsZW1lbnRlZCBhIFBvQyBmb3IgU1ItSU9WIG9uIEFSTSBbM10gKHBsZWFzZSBz
ZWUgdGhlIHRvcCAyDQo+Pj4+IHBhdGNoZXMpDQo+Pj4+IGFuZCBpdCAid29ya3MgZm9yIG1lIjog
TVNJIHN1cHBvcnQgaXMgc3RpbGwgV0lQLCBidXQgSSB3YXMgYWJsZSB0byBzZWUgdGhhdA0KPj4+
PiBWRnMgYXJlIHByb3Blcmx5IHNlZW4gaW4gdGhlIGd1ZXN0IGFuZCBCQVJzIGFyZSBwcm9wZXJs
eSBwcm9ncmFtbWVkIGluIHAybS4NCj4+Pj4NCj4+Pj4gV2hhdCBJIGNhbid0IGZ1bGx5IHVuZGVy
c3RhbmQgaXMgaWYgd2UgY2FuIGxpdmUgd2l0aCB0aGlzIGFwcHJvYWNoIG9yIHRoZXJlDQo+Pj4+
IGFyZSB1c2UtY2FzZXMgSSBjYW4ndCBzZWUuDQo+Pj4+DQo+Pj4+IFByZXZpb3VzbHkgSSd2ZSBi
ZWVuIHRvbGQgdGhhdCB0aGlzIGFwcHJvYWNoIG1pZ2h0IG5vdCB3b3JrIG9uIEZyZWVCU0QNCj4+
Pj4gcnVubmluZw0KPj4+PiBhcyBEb21haW4tMCwgYnV0IGlzIHNlZW1zIHRoYXQgIlBDSSBQYXNz
dGhyb3VnaCBpcyBub3Qgc3VwcG9ydGVkDQo+Pj4+IChYZW4vRnJlZUJTRCkiDQo+Pj4+IGFueXdh
eXMgWzRdLg0KPj4+IFBDSSBwYXNzdGhvcmdoIGlzIG5vdCBzdXBwb3J0ZWQgb24gRnJlZUJTRCBk
b20wIGJlY2F1c2UgUENJDQo+Pj4gcGFzc3Rocm91Z2ggaXMgbm90IHN1cHBvcnRlZCBieSBYZW4g
aXRzZWxmIHdoZW4gdXNpbmcgYSBQVkggZG9tMCwgYW5kDQo+Pj4gdGhhdCdzIHRoZSBvbmx5IG1v
ZGUgRnJlZUJTRCBkb20wIGNhbiB1c2UuDQo+PiBTbywgaXQgaXMgc3RpbGwgbm90IGNsZWFyIHRv
IG1lOiBob3cgYW5kIGlmIFBDSSBwYXNzdGhyb3VnaCBpcyBzdXBwb3J0ZWQNCj4+DQo+PiBvbiBG
cmVlQlNELCB3aGF0IGFyZSB0aGUgc2NlbmFyaW9zIGFuZCByZXF1aXJlbWVudHMgZm9yIHRoYXQ/
DQo+Pg0KPj4+IFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZCBjYW4gYmUgYWRkZWQgdG8gRnJlZUJT
RCwgc28gaXQgY291bGQgYmUgbWFkZQ0KPj4+IHRvIHdvcmsuIEkgaG93ZXZlciB0aGluayB0aGlz
IGlzIG5vdCB0aGUgcHJvcGVyIHdheSB0byBpbXBsZW1lbnQNCj4+PiBTUi1JT1Ygc3VwcG9ydC4N
Cj4+IEkgd2FzIG5vdCBhYmxlIHRvIGZpbmQgYW55IHN1cHBvcnQgZm9yIFBIWVNERVZPUF9YWFgg
aW4gRnJlZUJTRCBjb2RlLA0KPj4NCj4+IGNvdWxkIHlvdSBwbGVhc2UgcG9pbnQgbWUgdG8gd2hl
cmUgYXJlIHRoZXNlIHVzZWQ/DQo+IFRob3NlIGFyZSBub3QgdXNlZCBvbiBGcmVlQlNELCBiZWNh
dXNlIHg4NiBQVkh2MiBkb20wIGRvZXNuJ3QNCj4gaW1wbGVtZW50IHRoZW0gYW55bW9yZS4gVGhl
eSBhcmUgaW1wbGVtZW50ZWQgb24gTGludXggZm9yIHg4NiBQViBkb20wLA0KPiBBRkFJSyBBcm0g
ZG9lc24ndCB1c2UgdGhlbSBlaXRoZXIuDQoNCldlbGwsIEFSTSBkaWRuJ3QgdW50aWwgd2Ugc3Rh
cnRlZCBpbXBsZW1lbnRpbmcgUENJIHBhc3N0aHJvdWdoIFsxXS4NCg0KSXQgd2FzIHByZXZpb3Vz
bHkgZGlzY3Vzc2VkIFsyXSwgIiMgRGlzY292ZXJpbmcgUENJIGRldmljZXM6IiBhbmQgcHJvcG9z
ZWQNCg0KdG8gdXNlIFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZC4NCg0KTG9uZyBzdG9yeSBzaG9y
dCwgaXQgaXMgbm90IGVhc3kgZm9yIEFSTSB0byBlbnVtZXJhdGUgUENJIGRldmljZXMgaW4gWGVu
IGFzIHRoZXJlIGlzDQoNCm5vIHVuaWZpZWQgd2F5IG9mIGRvaW5nIHNvOiBkaWZmZXJlbnQgcGxh
dGZvcm1zIGltcGxlbWVudCBkaWZmZXJlbnQgUENJIGhvc3QgYnJpZGdlcw0KDQp3aGljaCByZXF1
aXJlIGNvbXBsZXggaW5pdGlhbGl6YXRpb24gaW5jbHVkaW5nIGNsb2NrcywgcG93ZXIgZG9tYWlu
cyBldGMuDQoNCkl0IHdhcyBhbHNvIGRpc2N1c3NlZCB0aGF0IFBDSSBvbiBBUk0gd291bGQgd2Fu
dCB0byBzdXBwb3J0IGRvbTBsZXNzIChEb21CKSBzZXR1cHMsDQoNCnNvIHdlIHNob3VsZCBoYXZl
IHNvbWUgYm9vdGxvYWRlciB3aGljaCB3aWxsIGVudW1lcmF0ZSBQQ0kgZGV2aWNlcyBmb3IgWGVu
IGJlZm9yZWhhbmQNCg0KYW5kIFhlbiB3aWxsIG9ubHkgc3VwcG9ydCBFQ0FNLWJhc2VkIGhvc3Qg
YnJpZGdlcy4NCg0KQW55d2F5cywgYXMgdGhlIGFib3ZlIGRvZXMgbm90IGV4aXN0IHlldCwgd2Ug
dXNlIFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZCBvbiBBUk0uDQoNCkFuZCB3ZSByZWx5IG9uIERv
bTAgdG8gaW5pdGlhbGl6ZSBQQ0kgaG9zdCBicmlkZ2UsIHNvIFhlbiBjYW4gYWxzbyBhY2Nlc3Mg
UENJLg0KDQo+DQo+PiBJZiB0aGV5IGFyZSBub3QsIHNvIGhvdyBYZW4gdW5kZXIgRnJlZUJTRCBr
bm93cyBhYm91dCBQQ0kgZGV2aWNlcz8NCj4gWGVuIHNjYW5zIHRoZSBQQ0kgYnVzIGl0c2VsZiwg
c2VlIHNjYW5fcGNpX2RldmljZXMuDQpTZWUgYWJvdmUsIHRoaXMgaXMgbm90IHlldCBhdmFpbGFi
bGUgb24gQVJNDQo+DQo+PiBJIGFtIHRyeWluZyB0byBleHRyYXBvbGF0ZSBteSBrbm93bGVkZ2Ug
b2YgaG93IExpbnV4IGRvZXMgdGhhdA0KPj4NCj4+IChkdXJpbmcgUENJIGVudW1lcmF0aW9uIGlu
IERvbWFpbi0wIHdlIHVzZSBoeXBlcmNhbGxzKQ0KPj4NCj4+Pj4gSSBhbHNvIHNlZSBBQ1JOIGh5
cGVydmlzb3IgWzVdIGltcGxlbWVudHMgU1ItSU9WIGluc2lkZSBpdCB3aGljaCBtYWtlcw0KPj4+
PiBtZSB0aGluayBJDQo+Pj4+IG1pc3Mgc29tZSBpbXBvcnRhbnQgdXNlLWNhc2Ugb24geDg2IHRo
b3VnaC4NCj4+Pj4NCj4+Pj4gSSB3b3VsZCBsaWtlIHRvIGFzayBmb3IgYW55IGFkdmlzZSB3aXRo
IFNSLUlPViBpbiBoeXBlcnZpc29yIHJlc3BlY3QsDQo+Pj4+IGFueSBwb2ludGVycw0KPj4+PiB0
byBkb2N1bWVudGF0aW9uIG9yIGFueSBvdGhlciBzb3VyY2Ugd2hpY2ggbWlnaHQgYmUgaGFuZHkg
aW4gZGVjaWRpbmcgaWYNCj4+Pj4gd2UgZG8NCj4+Pj4gbmVlZCBTUi1JT1YgY29tcGxleGl0eSBp
biBYZW4uDQo+Pj4+DQo+Pj4+IEFuZCBpdCBkb2VzIGJyaW5nIGNvbXBsZXhpdHkgaWYgeW91IGNv
bXBhcmUgWzFdIGFuZCBbM10pLi4uDQo+Pj4+DQo+Pj4+IEEgYml0IG9mIHRlY2huaWNhbCBkZXRh
aWxzIG9uIHRoZSBhcHByb2FjaCBpbXBsZW1lbnRlZCBbM106DQo+Pj4+IDEuIFdlIHJlbHkgb24g
UEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRkDQo+Pj4+IDIuIFdlIHJlbHkgb24gRG9tYWluLTAgU1It
SU9WIGRyaXZlcnMgdG8gaW5zdGFudGlhdGUgVkZzDQo+Pj4+IDMuIEJBUnMgYXJlIHByb2dyYW1t
ZWQgaW4gcDJtIGltcGxlbWVudGluZyBndWVzdCB2aWV3IG9uIHRob3NlICh3ZSBoYXZlDQo+Pj4+
IGV4dGVuZGVkDQo+Pj4+IHZQQ0kgY29kZSBmb3IgdGhhdCBhbmQgdGhpcyBwYXRoIGlzIHVzZWQg
Zm9yIGJvdGggIm5vcm1hbCIgZGV2aWNlcyBhbmQNCj4+Pj4gVkZzIHRoZSBzYW1lIHdheSkNCj4+
Pj4gNC4gTm8gbmVlZCB0byB0cmFwIFBDSV9TUklPVl9DVFJMDQo+Pj4+IDUuIE5vIG5lZWQgdG8g
d2FpdCAxMDBtcyBpbiBYZW4gYmVmb3JlIGF0dGVtcHRpbmcgdG8gYWNjZXNzIFZGIHJlZ2lzdGVy
cw0KPj4+PiB3aGVuDQo+Pj4+IGVuYWJsaW5nIHZpcnR1YWwgZnVuY3Rpb25zIG9uIHRoZSBQRiAt
IHRoaXMgaXMgaGFuZGxlZCBieSBEb21haW4tMCBpdHNlbGYuDQo+Pj4gSSB0aGluayB0aGUgU1It
SU9WIGNhcGFiaWxpdHkgc2hvdWxkIGJlIGhhbmRsZWQgbGlrZSBhbnkgb3RoZXIgUENJDQo+Pj4g
Y2FwYWJpbGl0eSwgaWU6IGxpa2Ugd2UgY3VycmVudGx5IGhhbmRsZSBNU0kgb3IgTVNJLVggaW4g
dlBDSS4NCj4+Pg0KPj4+IEl0J3MgbGlrZWx5IHRoYXQgdXNpbmcgc29tZSBraW5kIG9mIGh5cGVy
Y2FsbCBpbiBvcmRlciB0byBkZWFsIHdpdGgNCj4+PiBTUi1JT1YgY291bGQgbWFrZSB0aGlzIGVh
c2llciB0byBpbXBsZW1lbnQgaW4gWGVuLCBidXQgdGhhdCBqdXN0IGFkZHMNCj4+PiBtb3JlIGNv
ZGUgdG8gYWxsIE9TZXMgdGhhdCB3YW50IHRvIHJ1biBhcyB0aGUgaGFyZHdhcmUgZG9tYWluLg0K
Pj4gSSBkaWRuJ3QgaW50cm9kdWNlIGFueSBuZXcsIGJ1dCBQSFlTREVWT1BfcGNpX2RldmljZV9h
ZGQgd2FzIGVub3VnaC4NCj4gV2VsbCwgdGhhdCB3b3VsZCBiZSAnbmV3JyBvbiB4ODYgUFZIIG9y
IEFybSwgYXMgdGhleSBkb24ndCBpbXBsZW1lbnQNCj4gYW55IFBIWVNERVZPUCBhdCB0aGUgbW9t
ZW50Lg0KQWdyZWUgZm9yIHg4NiBQVkgNCj4NCj4gTG9uZyB0ZXJtIHdlIG1pZ2h0IG5lZWQgYW4g
aHlwZXJjYWxsIHRvIHJlcG9ydCBkeW5hbWljIE1DRkcgcmVnaW9ucywNCj4gYnV0IEkgaGF2ZW4n
dCBnb3QgYXJvdW5kIHRvIGl0IHlldCAoYW5kIGhhdmVuJ3QgZm91bmQgYW55IHN5c3RlbSB0aGF0
DQo+IHJlcG9ydHMgZXh0cmEgTUNGRyByZWdpb25zIGZyb20gQUNQSSBBTUwpLg0KV2hpY2ggbWVh
bnMgd2UnbGwgbmVlZCB0byBtb2RpZnkgZ3Vlc3QgT1MNCj4NCj4+IFRoZSByZXN0IEkgZGlkIGlu
IFhlbiBpdHNlbGYgd3J0IFNSLUlPVi4NCj4+DQo+Pj4gT1RPSCBpZiB3ZSBwcm9wZXJseSB0cmFw
IGFjY2Vzc2VzIHRvIHRoZSBTUi1JT1YgY2FwYWJpbGl0eSAobGlrZSBpdA0KPj4+IHdhcyBwcm9w
b3NlZCBpbiBbMV0gZnJvbSB5b3VyIHJlZmVyZW5jZXMpIHdlIHdvbid0IGhhdmUgdG8gbW9kaWZ5
IE9TZXMNCj4+PiB0aGF0IHdhbnQgdG8gcnVuIGFzIGhhcmR3YXJlIGRvbWFpbnMgaW4gb3JkZXIg
dG8gaGFuZGxlIFNSLUlPViBkZXZpY2VzLg0KPj4gT3V0IG9mIGN1cmlvc2l0eSwgY291bGQgeW91
IHBsZWFzZSBuYW1lIGEgZmV3PyBJIGRvIHVuZGVyc3RhbmQgdGhhdA0KPj4NCj4+IHdlIGRvIHdh
bnQgdG8gc3VwcG9ydCB1bm1vZGlmaWVkIE9TZXMgYW5kIHRoaXMgaXMgaW5kZWVkIGltcG9ydGFu
dC4NCj4+DQo+PiBCdXQsIHN0aWxsIHdoYXQgYXJlIHRoZSBvdGhlciBPU2VzIHdoaWNoIGRvIHN1
cHBvcnQgWGVuICsgUENJIHBhc3N0aHJvdWdoPw0KPiBOZXRCU0QgUFYgZG9tMCBkb2VzIHN1cHBv
cnQgUENJIHBhc3N0aHJvdWdoLCBidXQgSSdtIG5vdCBzdXJlIHRoYXQncw0KPiByZWxldmFudC4N
Cg0KVGhhdCB3YXMganVzdCBmb3IgbWUgdG8gdW5kZXJzdGFuZCB3aGVyZSB0byBsb29rIGZvciB0
aGUgUENJIHBhc3N0aHJvdWdoDQoNCmltcGxlbWVudGF0aW9ucyBhbmQgbm90IHRvIGJyZWFrIHNv
bWV0aGluZyB3aGljaCBJIGRvbid0IHNlZQ0KDQo+DQo+IFdlIHNob3VsZG4ndCBmb2N1cyBvbiBj
dXJyZW50IHVzZXJzIHRvIGNvbWUgdXAgd2l0aCBhbiBpbnRlcmZhY2UsDQo+IGJ1dCByYXRoZXIg
dGhpbmsgaG93IHdlIHdhbnQgdGhhdCBpbnRlcmZhY2UgdG8gYmUuDQo+DQo+IEFzIEkgc2FpZCBv
biB0aGUgcHJldmlvdXMgZW1haWwgbXkgb3BpbmlvbiBpcyB0aGF0IHVubGVzcyBub3QNCj4gdGVj
aG5pY2FsbHkgcG9zc2libGUgd2Ugc2hvdWxkIGp1c3QgdHJhcCBhY2Nlc3NlcyB0byB0aGUgU1It
SU9WDQo+IGNhcGFiaWxpdHkgbGlrZSB3ZSBkbyBmb3IgTVNJKC1YKSBhbmQgaGFuZGxlIGl0IHRy
YW5zcGFyZW50bHkgZnJvbSBhDQo+IGd1ZXN0IFBvVi4NCg0KT2ssIEkgdW5kZXJzdGFuZC4gSXQg
c2VlbXMgdGhhdCBKYW4gYWxzbyBzdXBwb3J0cyB5b3VyIGlkZWEuIFNvLCBJIGFtIG5vdA0KDQph
Z2FpbnN0IHRoYXQsIGp1c3QgdHJ5aW5nIHRvIHNlZSB0aGUgd2hvbGUgcGljdHVyZSB3aGljaCBp
cyBhIGJpdCBiaWdnZXIgdGhhbiBBUk0NCg0KPg0KPj4+IElNTyBnb2luZyBmb3IgdGhlIGh5cGVy
Y2FsbCBvcHRpb24gc2VlbXMgZWFzaWVyIG5vdywgYnV0IGFkZHMgYSBidXJkZW4NCj4+PiB0byBh
bGwgT1NlcyB0aGF0IHdhbnQgdG8gbWFuYWdlIFNSLUlPViBkZXZpY2VzIHRoYXQgd2lsbCBodXJ0
IHVzIGxvbmcNCj4+PiB0ZXJtLg0KPj4gQWdhaW4sIEkgd2FzIGFibGUgdG8gbWFrZSBpdCBzb21l
d2hhdCB3b3JrIHdpdGggUEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRkIG9ubHkuDQo+IFN1cmUsIHRo
YXQncyBob3cgaXQgd29ya3Mgb24geDg2IFBWIGhhcmR3YXJlIGRvbWFpbiwgc28gaXQncyBjZXJ0
YWlubHkNCj4gcG9zc2libGUuIE15IGNvbW1lbnRzIHRvIGF2b2lkIHRoYXQgcm91dGUgaXMgbm90
IGJlY2F1c2UgaXQncyBub3QNCj4gdGVjaG5pY2FsbHkgZmVhc2libGUsIGJ1dCBiZWNhdXNlIEkg
ZG9uJ3QgbGlrZSB0aGUgYXBwcm9hY2guDQoNClVubGVzcyB3ZSBoYXZlIHNvbWUgdW5pZmllZCB3
YXkgb2YgYWNjZXNzaW5nIFBDSSBvbiBBUk0gSSBhbSBub3Qgc3VyZQ0KDQp3ZSBjYW4gbGl2ZSB3
aXRob3V0IFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZCBoeXBlcmNhbGwuDQoNCj4NCj4gU28gZmFy
IHdlIGhhdmUgYXZvaWRlZCBQVkggZnJvbSBoYXZpbmcgdG8gaW1wbGVtZW50IGFueSBQSFlTREVW
T1ANCj4gaHlwZXJjYWxsLCBhbmQgdGhhdCdzIGEgZGVzaWduIGRlY2lzaW9uLCBub3QgYSBjb2lu
Y2lkZW5jZS4gSSdtIGluDQo+IGZhdm9yIG9mIHVzaW5nIHRoZSBleGlzdGluZyBoYXJkd2FyZSBp
bnRlcmZhY2VzIGZvciBndWVzdHMgaW5zdGVhZCBvZg0KPiBpbnRyb2R1Y2luZyBjdXN0b20gWGVu
IG9uZXMgd2hlbiB0ZWNobmljYWxseSBmZWFzaWJsZS4NCg0KVW5mb3J0dW5hdGVseSwgb24gQVJN
IChhbmQgSSBiZWxpZXZlIGl0IG1heSBhbHNvIGhhcHBlbiBvbiBvdGhlcg0KDQpub24teDg2IHBs
YXRmb3JtcykgdGhlcmUgYXJlIG5ldyBvYnN0YWNsZXMgdG8gdGhpcyBkZXNpZ24uIEFuZCBpZg0K
DQp3ZSB3YW50IFhlbiArIFBDSSBiZSBzdXBwb3J0ZWQgb24gb3RoZXIgdGhhbiB4ODYgcGxhdGZv
cm1zIHdlIGhhdmUNCg0KdG8gcmUtdGhpbmsgdGhlIGV4aXN0aW5nIGFwcHJvYWNoIHRvIGluY2x1
ZGUgb3RoZXJzIGluIHRoZSBnYW1lLg0KDQo+DQo+IFRoYW5rcywgUm9nZXIuDQoNClRoYW5rIHlv
dSwNCg0KT2xla3NhbmRyDQoNClsxXSBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvZnVz
YS94ZW4taW50ZWdyYXRpb24vLS9ibG9iL2ludGVncmF0aW9uL3BjaS1wYXNzdGhyb3VnaC94ZW4v
YXJjaC9hcm0vcGh5c2Rldi5jDQoNClsyXSBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3hl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZy9tc2c3NzQyMi5odG1sDQoNCg==

