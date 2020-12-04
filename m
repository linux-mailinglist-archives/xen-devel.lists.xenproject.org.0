Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057B92CEFC9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 15:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44844.80264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klCEo-0000sN-Hj; Fri, 04 Dec 2020 14:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44844.80264; Fri, 04 Dec 2020 14:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klCEo-0000s1-DC; Fri, 04 Dec 2020 14:39:10 +0000
Received: by outflank-mailman (input) for mailman id 44844;
 Fri, 04 Dec 2020 14:39:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pknM=FI=epam.com=prvs=06072b5274=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1klCEm-0000rw-M1
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 14:39:08 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93c05ee1-8077-42a7-9898-0c36fb513aaf;
 Fri, 04 Dec 2020 14:39:07 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B4EaB9b003285; Fri, 4 Dec 2020 14:38:59 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 by mx0b-0039f301.pphosted.com with ESMTP id 3572y0k6jm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 14:38:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2195.eurprd03.prod.outlook.com (2603:10a6:200:4f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 4 Dec
 2020 14:38:57 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3632.018; Fri, 4 Dec 2020
 14:38:57 +0000
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
X-Inumbo-ID: 93c05ee1-8077-42a7-9898-0c36fb513aaf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvPVila2N70VZBSTzMwRg0e2A2DEf0G8HwrDGiyh5eJcZaCSggX7PYoFS4Q+5Bi/QZlvcerlZtSpCqqXWuTzdgQIQYsCEptgNK6slFG53rW5F79/AdEqjqiBIuYF8SoC4SgQPS4hSugQmzbaie6im/8g+zduVNiBJDhYJ6A1PrcTgDh0hq9QL7w26KTQZEET2sLYH+dU5F1UgtWVxNl65b3flOAjKh+Hnkl6fsL2zgCX4meZeK1SpPf1cDYVrgEuEOxn5Yx0AN6IcdzMK6iAai51DIrsjd0CU51ZauFIJV6SDD3VU+PYsT7PiOqGFdfcxj9lLAo5CVb+NItKXkxksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtC2b1Z5k5r1RLToD9WL3ocGlKUc5pLpOfsbTjP7DPw=;
 b=eUos4FJvjCQ7gmfKepCTtZ5oJDrcNLcmzh36vzwfbLzgAei0vMWJphk6SabHH6Bo6wM3QMFYMBKcBRmCO00NB6jLCDiZPazZwOvAS6tVVV/wVVrJVgt2Z5YMO7bn38bgoZjoHPBK8dUkTOfryVJ2JtiYqozbphPuZoFGyMvR/SuU4bOoitgruR3ZsEZtd3vElIbwBLK7B3nZLonzk8cUHOFSFTNHM/Qy5BKj/KfPlClHicudt8tN5ThcwDFRldWr/kZLcxWTifJrXEgYeq/cgaX5OTrG90r3RQddm3O2pxUwcdFkNc9bJLSaPCwztCxONIKflTJm5pdlzP7RirTqZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtC2b1Z5k5r1RLToD9WL3ocGlKUc5pLpOfsbTjP7DPw=;
 b=lXu2/wPr0pJA+TV8N/rZMo6xrQ6QZafvpUOKO/yvGzgHXbGR6eVH9kDDUkNxKP4RnNaFVDZ7OGobyvYTNBXeI2vt/VEDFhZEeScSc3F2boEE4NQhqmmPxeYtq/jeoQky8UJ8+ktbv8qgBYpYRpmsC9QY4HMmKZztdj9GK0fdIqk7QH75qjFuxQxAU8mp0Lmd8QytA8XFasF9/TdKUzCwwJ1ZP6OlCqh7Mif6b8NbNR8FRAWSg4ldGNxAHQeQ9H17WdePyMM3aIM+s4YcIPUTOA2HZBU1kG5BNUCHI2wLlkiNYy+cForLmNYvsINGC416+zjkOc5ECcwV7V0CjRYdZA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>,
        "Rahul.Singh@arm.com"
	<Rahul.Singh@arm.com>,
        "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
        "julien.grall@arm.com" <julien.grall@arm.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH 06/10] vpci: Make every domain handle its own BARs
Thread-Topic: [PATCH 06/10] vpci: Make every domain handle its own BARs
Thread-Index: 
 AQHWtpbzyJg77SbpvkSRWLKjWy/3PanEQmgAgAA8YoCAABlOgIABCD8AgABBOQCAAAXIAIAAAS0AgAADNgCAAAlOAIAAEnYAgAAcfoCAAAKRAIAAAYQAgAABxICAAAHUgIAg/YsA
Date: Fri, 4 Dec 2020 14:38:56 +0000
Message-ID: <802e20d8-82b6-5755-e6e5-aadb07585a32@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-7-andr2000@gmail.com>
 <20201112094002.bzk6gvp4iy4dgj4s@Air-de-Roger>
 <1b3f11c2-a5a2-da5c-25b3-851ef9465ab9@epam.com>
 <20201112144643.iyy5b34qyz5zi7mc@Air-de-Roger>
 <1fe15b9a-6f5d-1209-8ff5-af7c4fc0d637@epam.com>
 <b4697fbe-6896-ed64-409d-85620c08904a@suse.com>
 <3d6e5aab-ff89-7859-09c6-5ecb0c052511@epam.com>
 <1c88fef1-8558-fde1-02c7-8a68f6ecf312@suse.com>
 <67fd5df7-2ad2-08e5-294e-b769429164f0@epam.com>
 <03e23a66-619f-e846-cf61-a33ca5d9f0b4@suse.com>
 <b151e6d2-5480-d201-432a-bece208a1fd9@epam.com>
 <c58c1393-381a-d995-6e41-fa3251f67bd7@suse.com>
 <8fc22774-7380-2de1-9c30-6649a79fdfe1@epam.com>
 <46c75ee1-758c-8a42-d8d3-8d42cce3240a@suse.com>
 <66cb04c5-5e98-6a4d-da88-230b2dbc3d98@epam.com>
 <04059ce3-7009-9e1e-8ba2-398cc993d81b@suse.com>
In-Reply-To: <04059ce3-7009-9e1e-8ba2-398cc993d81b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efec32e3-2a89-48b4-2859-08d8986254d4
x-ms-traffictypediagnostic: AM4PR0301MB2195:
x-microsoft-antispam-prvs: 
 <AM4PR0301MB2195D5D734068C47D3BAB5F0E7F10@AM4PR0301MB2195.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 544v5IpcpESxIicnWJGvb26PU9w0akgEAECVrOLKw1QDxL9MwqkDV0nnX1ixEOQy438QMJLMOSRf3Q5bUv6cMp/akWDAs3PqzdS4uQWe6y+2jFr6wq+p8S80/5UNAIKAU7CEb6SLW1TBNePRtaRFBMpK4fpEGKFVb68N238VTFDJNaNBkmgY72nWD8TJZaxkWSM/tOjMdQH4sot13TOgUb+vGjJH6lgVhNbCAWPSBsdXAX/blfjTJijXrJoPkQTtJV1RuXWyepE2yOrh6Hr86VXZlmuhxKrCVk//q9c+PH/zsNpmZ6VnOjeq9cxMsDEovXhFdQa7p4ErJPLNeQN3lZbQJ1YAJUOzjFmqJjZHZb7cOhXPETBiV66W8SsNfewU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(366004)(376002)(346002)(316002)(2616005)(86362001)(186003)(66476007)(66556008)(66946007)(8676002)(2906002)(64756008)(76116006)(31696002)(6916009)(66446008)(7416002)(4326008)(6512007)(6486002)(8936002)(54906003)(71200400001)(6506007)(36756003)(31686004)(83380400001)(53546011)(478600001)(5660300002)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?MUgzMHpOYktwTXEwMHIrb3ZsWmhiUnZsZGcrWm5pUVViaFU1ay9EOVpDcTAv?=
 =?utf-8?B?WEJ3UXFETHY1dUM5WGI5U2lVb1JWYTBLNVMzYzZGdzQ1b1dtZWYwWVdWZzhi?=
 =?utf-8?B?dXdwU3RQU0RoMXpYK0NJT2N2Vmh2cHQ5U2FCWFllSzYrdndVcnRBOG9Oc2NX?=
 =?utf-8?B?Vnl4WVk2QXQ4K2hERVYwa1pXMjgrYXVOcjhRQm5TbVJpSGw5RFdjeE8vK3M4?=
 =?utf-8?B?N3lNR2VwQVpVUkE4NGp0WmhPUUlpNFVXalV2dm9paUtZZ0xoZmlJNDhxRVEy?=
 =?utf-8?B?dTJhSXZDY1BsV2cyTW94YkM2VVMxSjFWRFNBak9sTm9JaEl2dFlxUXg5M3pL?=
 =?utf-8?B?SVFVZ2t5R2ZqanJXUTAxdThOd1pra0d1eElEdDVJazBDNXlKY2cwU0txTis5?=
 =?utf-8?B?V2w5aGVDbWZCTTEwMDVMcjNtNytSWVpSUHBEc0RpaDVVcUdyLzREbFZmVFp2?=
 =?utf-8?B?SEZodE1mU2hKekVrdnNoUWdqWkw4Snh0REJjZDEzRmYrU1JnQnZYdnM0czNG?=
 =?utf-8?B?YitKZ0gvbmtCbzRLRW5GcmFsVWlGekFPK2VtdTYyVk9uamhtbk5nenI1a2U4?=
 =?utf-8?B?eVhya2l5V2EzZ2pyT1FsdjczdFJSdUhaL0dTdHdsNXVSRTdjYVFOaGdpVy96?=
 =?utf-8?B?SHRleCtaMjdVUm9KVk1HZ0xtV2puMXBlY3IrVXVsTGVMOEtQYU1PUjRjMmdI?=
 =?utf-8?B?eitzRVMwOWZKMGFUU0NuOWhRUldYVmxrRnhJQjBBTUFzVE1XTkJMbUJrNkph?=
 =?utf-8?B?bE1jNkJlam9uSXhjODgwSGxzVDR5d3p4cElGSzRKNlh6ckgrNHZKcExrZnFG?=
 =?utf-8?B?NG5YaG85ellnWVZaMFRPNDlpRWhFMURud0dmRmwrV2VOMHFINTBRRjhtTGRI?=
 =?utf-8?B?RXE5S1RMcGFhV3JiWEMxcm11ekYyQ0xMeVJBZ3BCQTk2K2VNeElOUHhyV1R4?=
 =?utf-8?B?WVNDVERIOFZTVjM2RzR2aG5xTFduWU1hT3VzV0ZEQXZuYWg2VXQ3cU9senQz?=
 =?utf-8?B?cTlnbHlLcm8xTyt3MVhCKzJOd1ZBamdQeFY4MS8ySmhsaHdLRlFNU0FLbVR6?=
 =?utf-8?B?TnE4Q2xoZE03QzBCTVkrNFRlY0tEQXc3cVFpNEE3SFlpcEtIZUYvdU9rRzVn?=
 =?utf-8?B?TjB3aXFEMFJocUZ4ajJwVkFPNzcwdWhsbU9rbkZUbENEMlZFZ1FjNStpeWgr?=
 =?utf-8?B?RWZlVU1Jbk8xMlJWVHRCQ2h6SndIcXBGZS9QaGVQMmE1Z2thd0hPcXZpak5L?=
 =?utf-8?B?VDJRMUUxZUt6RDJ5WTVncWRSYXFhUkUxVDdHYTk5aitkVzY1QklkY09BYnZL?=
 =?utf-8?Q?uFO4P2HCW58jE+/WOTWgS8JphF7IlNo9mv?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E232E532DE80BE4D8D33B6C18CA575A6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efec32e3-2a89-48b4-2859-08d8986254d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2020 14:38:56.9575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kIozqT/9MuiyHj6VrU/E8cKamue0iCN6d1xBBgbRg1Bk5E+Zq0hoEcKeMZdfG+3Is0pVUzn8eiVN8Qr0OMJL6aU9ezSOKCD/q/9buZ3WAfxjvulg1d+ChNdvDWDVURCY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2195
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-04_05:2020-12-04,2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=540 bulkscore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040084

SGksIEphbiENCg0KT24gMTEvMTMvMjAgNDo1MSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9u
IDEzLjExLjIwMjAgMTU6NDQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24g
MTEvMTMvMjAgNDozOCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTMuMTEuMjAyMCAx
NTozMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDExLzEzLzIwIDQ6
MjMgUE0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gICAgIEVhcmxpZXIgb24gSSBkaWRuJ3Qg
c2F5IHlvdSBzaG91bGQgZ2V0IHRoaXMgdG8gd29yaywgb25seQ0KPj4+Pj4gdGhhdCBJIHRoaW5r
IHRoZSBnZW5lcmFsIGxvZ2ljIGFyb3VuZCB3aGF0IHlvdSBhZGQgc2hvdWxkbid0IG1ha2UNCj4+
Pj4+IHRoaW5ncyBtb3JlIGFyY2ggc3BlY2lmaWMgdGhhbiB0aGV5IHJlYWxseSBzaG91bGQgYmUu
IFRoYXQgc2FpZCwNCj4+Pj4+IHNvbWV0aGluZyBzaW1pbGFyIHRvIHRoZSBhYm92ZSBzaG91bGQg
c3RpbGwgYmUgZG9hYmxlIG9uIHg4NiwNCj4+Pj4+IHV0aWxpemluZyBzdHJ1Y3QgcGNpX3NlZydz
IGJ1czJicmlkZ2VbXS4gVGhlcmUgb3VnaHQgdG8gYmUNCj4+Pj4+IERFVl9UWVBFX1BDSV9IT1NU
X0JSSURHRSBlbnRyaWVzIHRoZXJlLCBhbGJlaXQgYSBudW1iZXIgb2YgdGhlbQ0KPj4+Pj4gKHBy
b3ZpZGVkIGJ5IHRoZSBDUFVzIHRoZW1zZWx2ZXMgcmF0aGVyIHRoYW4gdGhlIGNoaXBzZXQpIGFy
ZW4ndA0KPj4+Pj4gcmVhbGx5IGhvc3QgYnJpZGdlcyBmb3IgdGhlIHB1cnBvc2VzIHlvdSdyZSBh
ZnRlci4NCj4+Pj4gWW91IG1lYW4gSSBjYW4gc3RpbGwgdXNlIERFVl9UWVBFX1BDSV9IT1NUX0JS
SURHRSBhcyBhIG1hcmtlcg0KPj4+Pg0KPj4+PiB3aGlsZSB0cnlpbmcgdG8gZGV0ZWN0IHdoYXQg
SSBuZWVkPw0KPj4+IEknbSBhZnJhaWQgSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgbWFya2VyIHlv
dSdyZSB0aGlua2luZyBhYm91dA0KPj4+IGhlcmUuDQo+PiBJIG1lYW4gdGhhdCB3aGVuIEkgZ28g
b3ZlciBidXMyYnJpZGdlIGVudHJpZXMsIHNob3VsZCBJIG9ubHkgd29yayB3aXRoDQo+Pg0KPj4g
dGhvc2Ugd2hvIGhhdmUgREVWX1RZUEVfUENJX0hPU1RfQlJJREdFPw0KPiBXZWxsLCBpZiB5b3Un
cmUgYWZ0ZXIgaG9zdCBicmlkZ2VzIC0geWVzLg0KPg0KPiBKYW4NCg0KU28sIEkgc3RhcnRlZCBs
b29raW5nIGF0IHRoZSBidXMyYnJpZGdlIGFuZCBpZiBpdCBjYW4gYmUgdXNlZCBmb3IgYm90aCB4
ODYgKGFuZCBwb3NzaWJsZSBBUk0pIGFuZCBJIGhhdmUgYW4NCg0KaW1wcmVzc2lvbiB0aGF0IHRo
ZSBvcmlnaW5hbCBwdXJwb3NlIG9mIHRoaXMgd2FzIHRvIGlkZW50aWZ5IHRoZSBkZXZpY2VzIHdo
aWNoIHg4NiBJT01NVSBzaG91bGQNCg0KY292ZXI6IGUuZy4gSSBhbSBsb29raW5nIGF0IHRoZSBm
aW5kX3Vwc3RyZWFtX2JyaWRnZSB1c2VycyBhbmQgdGhleSBhcmUgeDg2IElPTU1VIGFuZCBWR0Eg
ZHJpdmVyLg0KDQpJIHRyaWVkIHRvIHBsYXkgd2l0aCB0aGlzIG9uIEFSTSwgYW5kIGZvciB0aGUg
SFcgcGxhdGZvcm0gSSBoYXZlIGFuZCBRRU1VIEkgZ290IDAgZW50cmllcyBpbiBidXMyYnJpZGdl
Li4uDQoNClRoaXMgaXMgYmVjYXVzZSBvZiBob3cgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNp
LmM6YWxsb2NfcGRldiBpcyBpbXBsZW1lbnRlZCAod2hpY2ggbGl2ZXMgaW4gdGhlDQoNCmNvbW1v
biBjb2RlIEJUVywgYnV0IHNlZW1zIHRvIGJlIHg4NiBzcGVjaWZpYyk6IHNvLCBpdCBza2lwcyBz
ZXR0aW5nIHVwIGJ1czJicmlkZ2UgZW50cmllcyBmb3IgdGhlIGJyaWRnZXMgSSBoYXZlLg0KDQpU
aGVzZSBhcmUgREVWX1RZUEVfUENJZV9CUklER0UgYW5kIERFVl9UWVBFX1BDSV9IT1NUX0JSSURH
RS4gU28sIHRoZSBhc3N1bXB0aW9uIEkndmUgbWFkZSBiZWZvcmUNCg0KdGhhdCBJIGNhbiBnbyBv
dmVyIGJ1czJicmlkZ2UgYW5kIGZpbHRlciBvdXQgdGhlICJvd25lciIgb3IgcGFyZW50IGJyaWRn
ZSBmb3IgYSBnaXZlbiBzZWc6YnVzIGRvZXNuJ3QNCg0Kc2VlbSB0byBiZSBwb3NzaWJsZSBub3cu
DQoNCkV2ZW4gaWYgSSBmaW5kIHRoZSBwYXJlbnQgYnJpZGdlIHdpdGggeGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvcGNpLmM6ZmluZF91cHN0cmVhbV9icmlkZ2UgSSBhbSBub3Qgc3VyZQ0KDQpJIGNh
biBnZXQgYW55IGZ1cnRoZXIgaW4gZGV0ZWN0aW5nIHdoaWNoIHg4NiBkb21haW4gb3ducyB0aGlz
IGJyaWRnZTogdGhlIHdob2xlIGlkZWEgaW4gdGhlIHg4NiBjb2RlIGlzDQoNCnRoYXQgRG9tYWlu
LTAgaXMgdGhlIG9ubHkgcG9zc2libGUgb25lIGhlcmUgKHlvdSBtZW50aW9uZWQgdGhhdCkuIFNv
LCBJIGRvdWJ0IGlmIHdlIGNhbiBzdGlsbCBsaXZlIHdpdGgNCg0KaXNfaGFyZHdhcmVfZG9tYWlu
IGZvciBub3cgZm9yIHg4Nj8NCg0KVGhhbmsgeW91IGluIGFkdmFuY2UsDQoNCk9sZWtzYW5kcg0K

