Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBAF40279A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 13:10:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180838.327675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNYze-00018Q-Ci; Tue, 07 Sep 2021 11:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180838.327675; Tue, 07 Sep 2021 11:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNYze-000161-9W; Tue, 07 Sep 2021 11:10:22 +0000
Received: by outflank-mailman (input) for mailman id 180838;
 Tue, 07 Sep 2021 11:10:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hq6o=N5=epam.com=prvs=98842be756=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNYzc-00015t-37
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 11:10:20 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba463846-66eb-43ae-8be8-af80615d07b8;
 Tue, 07 Sep 2021 11:10:19 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1879h71j030311; 
 Tue, 7 Sep 2021 11:10:16 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 3ax3d2rtyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 11:10:15 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR03MB3959.eurprd03.prod.outlook.com (2603:10a6:20b:20::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 11:10:10 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 11:10:10 +0000
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
X-Inumbo-ID: ba463846-66eb-43ae-8be8-af80615d07b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YR0VHE9EsYK0tB1QbfJwiv/Jjpug1suw4B/TxtXJXKaXrqyi2kh0zbxQoHvXcIE4nlFu68Ou7hK29HGBPl5Ro9/i/wiQ4F3AwNI2dFVXhPRQUEqNF0iT9qR+V2wGoBlwiMJ9rr810YuOShmOtBp8kPT5C8Xzt6wZ9C063Ap3jh1G2EttWwIyKpT41bPMqxNRDUDTU3vwsjGwAwg4YBfRYCmWX0jZDUq3GCQxeOWErVFVb8gmuHT18D9EdtKXv/faBdGIZuQ/WcA9/4hJMxRsykqv56RdUg9Oh9cxKX9LoRO66m3eAdqsp3erkoevrFgtG7gfSIe5Z3iyvZ8bb0AQFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=PV70tGGgugQ0qJ9VluEfc8FUAV6SKKq+W2RYBlTHk04=;
 b=E/xFVVMyev/eaJxmc+SKnxw4W7mjlBXLl0KSnEY/BYgqbbxUgHsU1bbOTvfdVjjQxGrAaZOH5hkkyAqrToSJQ/NJ86e0FQELXiMqnRENYTm4T2JgFJEjf9gKEMc3Dwp1ArHBpwJ7XnO7DXgw5iG1t+R/K/fsKKxGpNIG0G35VEhQXLxrckb2/JJmCu/z9zYksTplz8d8n1Pe8fW2vQOAhRdaHhq7U284az3etEgVa/R7qGr0y0Qnjrjq+2Q8xQOY5PEJSWx2EPcnVk81BDEE7CMX5cZrO9Nm2js7C4wmHkzsgepylPMuiEnG27tMzlsojrxfUiTXUsOZzvBLYhhy8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PV70tGGgugQ0qJ9VluEfc8FUAV6SKKq+W2RYBlTHk04=;
 b=Q2FQuaUUFMlML6OpYGJbUspvS4ImPuAU47cLT9lzkPctJ5yA6SqxvVjTtPOJ1qiO7OztqwIErKE+vvG4S0ZO2/f1bLVeZQ8WgecXrb7CMk8lQgwzaJxrABS4BX9gIfssHrOMYMc00PPqmV/IRvSBc8MhsElYyfYfAgn9VsWU24F/AyR98+OjUrQOf/Ndnt/ebZQApNDKVdVPQrvWaNcf9VaRYyX0hXdPMgCcIQeNTwuHRyLA04uAvOmg2ywfdv8h5Y4bRJw+Gw8GjUEZiTK2qcmFDoCDqOaeVxOI2JqhWwG+uyDEuHVeKKsw9utoFbgV1vGqExyWSYFdFsNTES11yw==
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
Thread-Index: AQHXoKusySJnLVveGkulaWKrBZdXpKuXEOQAgAFPE4CAAAkRAIAAB3eA
Date: Tue, 7 Sep 2021 11:10:10 +0000
Message-ID: <242373cf-9854-74b7-4d54-bbcacc6cb7cb@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-5-andr2000@gmail.com>
 <8bb58d2d-255b-96e9-50ff-529985c655d5@suse.com>
 <16e396be-89f5-4d42-d57b-d91f09b70644@epam.com>
 <00bbe12b-6a79-e660-c5c1-57ccb200d2eb@suse.com>
In-Reply-To: <00bbe12b-6a79-e660-c5c1-57ccb200d2eb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5376dc28-8c0c-4ec9-d32b-08d971f00eea
x-ms-traffictypediagnostic: AM6PR03MB3959:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB3959843F6417D3BC69019172E7D39@AM6PR03MB3959.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zOvJSQ988Ul7tKRw1MAwisz3776VbU6uKa4WOkelhFCH/55bPWKoT8eaFUGyDqjNL0Fn9SmsEoQjsXyndChAYM4ilAz2yWYdr0sDZ1choqFJDxzJEbMO4JRDuo5GWbr8I94gCT/Uw1pVDV3o/uWJfwz5MOubJQxHQ381xJuFz8lEZHVipqmSCmhLjZG7ulRQdT+CbpciVYdnVA6DQXiEGlBCYuIKXJK+UKjGu8vArhAFYJLvT2HxsJ4KmHDcaLGJlbRF2UXNlPERQxr1feSeNVw4606TMSiyjPogtPmlFfg4z6v4EJiEL/jk9UlaUQa4m8+eUA1kOJrC4YPwbXiGgGoGFYmHCiQKZmR0fiozXZ9OEL1iOPK+pg/8DaVez/3G+iV9RmdIxktwpo5Fed1bWO5NM0VG7SaLuRRQqlfmgj6TSrWTCtDQGYztBf6SwTzVUD3XijMN4cADL93kQqVcYl/HXlFZSJDFJew0/P4QHtIrqmAWgC6Coow13ZdhZqSJQlQWYufieF07w0mMAQjMiP6983pnPTMm8t8IjCJdhDsHotWhDWrzF8OqCcPrBXHW8zchbJLselLaaP+YJRNAfgLAln64kflGOGNFjQLK+Tm9QXcQ7S9vD2iDJZ6U/Ju0UJ8luZ2EZgM1ODZEJeM1kWLTrq7lRVHCo3oPOAmyJT27tgHXxNaH6OtvUVUTgwiNVGelcPMlTs2IwB7mkr//D86RLlRB5t9QVGmcAI/Ci4mCiZ+9MstB77PFSnQMhDFr
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39850400004)(346002)(136003)(396003)(110136005)(38100700002)(86362001)(91956017)(6512007)(66556008)(122000001)(64756008)(66446008)(71200400001)(76116006)(66476007)(66946007)(4326008)(83380400001)(2616005)(31696002)(53546011)(316002)(6506007)(6486002)(8936002)(5660300002)(8676002)(36756003)(26005)(186003)(31686004)(478600001)(54906003)(2906002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L1hZV1Y4TWJXU25oRUNaeWJjL2RlVHdTMXVUcm4ySE5pWjlrZXlYQnp1Z0Rj?=
 =?utf-8?B?aW5jV1hlci82UElhNlN6Sy9SSU4rV1pTZ2FPOEp6T0JnRmxlVlhHTGpkUW9G?=
 =?utf-8?B?T251RS9EaHV1MHYydU11TFBObVNXQ21DS0F0di9NeVBKNU5OSUtud0Z6aGhk?=
 =?utf-8?B?aWlKaHBTbVdTYzR0cWFxVXBrbVJBblNIb1hjMzJpV3pabkh0RlRXTTE2MWVa?=
 =?utf-8?B?cThIM3VVTGVDaEpzUWtMSXJDREp0U09pM29tSU9OZEJNaEd3eHREOU5YbjZp?=
 =?utf-8?B?TXluV2c4U3lidFdEc0dwdDcrMm0yM1VESGF2NFY4Tm9rUXVUdzFyTHFXUTFM?=
 =?utf-8?B?bUo1c2J6SnhnekI0VDBLbEo5TlFmRkNualpUd1FxR090czRZYWtiWGVicDQv?=
 =?utf-8?B?UjNZb1FYZlh3L1pGTWlSK3VFeUdpYm5MQXlhdlI4UVZ6bExmV1BxNHhobDJG?=
 =?utf-8?B?bDFVRGZ1VjBGcjRsWWhCUEd1aTUvYjY5bEpqeE1IWGpTRDB2SmxpV1kxMm16?=
 =?utf-8?B?d0tKV3g5V0YwSUVMc0R4UEt5VnFSalBLQ2haZS9FNmxFYlFHWmpTTVo1bDhD?=
 =?utf-8?B?b3FwYzI4YTNMYmQ4RE1yK2sydTMxVEpOekI0eWdUUTdzQi9lSk84UXFqczUy?=
 =?utf-8?B?QTVhNytPdnlyK01Wd2lNTlVqdm1JZXpsOFNjdkdyR05xOVdlSGxPT1ltT3hR?=
 =?utf-8?B?R2hoTnB1Qk5UU2ZDSEdpUW5HV0Zod0tnblhoNkppOTd0a09YVG5yK2Nwajln?=
 =?utf-8?B?RXU3ZWttQTlrT0dsS1F1cTgrMXA3dlpJUW80WmlXaE9nNzRZWmwramNPT0pF?=
 =?utf-8?B?Skp1ZWhFcXRyUEN3WGcrbXU5eGFIYWxUWUZDMzBpcXBDcm1ZSmRlRnNET3Zn?=
 =?utf-8?B?d2xiUmVqaHMwQ2JpSUFhQ3IxNnFkalh5ZktQbGgrRWluaDRRdlRNS1UvTlNp?=
 =?utf-8?B?MkRNYnVSWVNYQndEZGtTZGZLRFRzUmlOM1RzdjFRUDJ2TmhCRzBkak5BY25X?=
 =?utf-8?B?Q1hQL3VJV1NIclVGVVVzcHB5eTN3d05KTVI0WHRTY1loVjZpRkxZZmc2RDFF?=
 =?utf-8?B?ZU83MmFBaERTd2RjQi8rV3FuK0ZSWjlEWnNKMVhGaityN29Fc3UvYlVxZXky?=
 =?utf-8?B?MmNaVlhBbXZ0bDZBaWRYKzZhQWFKRUFnVXJwQW9HWCtsekdCVWlvbGNyTXF1?=
 =?utf-8?B?b1ovRjg5WXd6VEtVSi93a2x5cElmRlBVeDFkeWQxSmZqYzMrZXdXaVcrSlJN?=
 =?utf-8?B?SkFlTkN1MXdtaHovdWFHTlhaVzdIcHJYQmVKdDR4V3Z0U25abmFRVTltWVZU?=
 =?utf-8?B?RU5MbWNlYTVJMGg0dDdkMGVFak95MjZ0OEh0UUM0TmxHZUR0TkhCSzNrempD?=
 =?utf-8?B?RFZseCtBbjF1ZUs3RWpBa1dXTVRPTjJoZGxXaVJSOXhtVnh4VStMNEF0Rktw?=
 =?utf-8?B?TVhLa2dlcGt6MXRWaTc2ZWYxZzc3NVlIc3F3MDB3TWtKRDNtY0tOdnRtc0JI?=
 =?utf-8?B?UHZhYy9NT0pMTk1ITkdRSjk3VndTcDAzL2dnUVgxVmdpSktpOXdBZDd4OUVo?=
 =?utf-8?B?NHZORld6RnBNRzR0aW1QOC83czJQM3psOFBwVVc0bUhCd3oyV0lwU3lkcUhN?=
 =?utf-8?B?c3dqdTVmS28zbFVYa09RY2JRZk55a09Oc3c2ZXRhd2F4Zmc0MGVieFpLNUhD?=
 =?utf-8?B?aGE5MXlkaHdKUFFxeVBQYXdCRDkvQmdBR0VSSVc0c21KQ2NKZmZNY2E5eGFz?=
 =?utf-8?Q?3WevrmrXVpPwkoahpIQ105CzsIWOjfe+8llZ8Ki?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F453448ADFB9BA4B976105F65D448495@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5376dc28-8c0c-4ec9-d32b-08d971f00eea
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 11:10:10.4263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ThyXFsqRQ7QJ2JkPSwkye3Hx5DumtHH6JyD3ihjbNnbJinfWI8fzjHlkTH1Vu/SP+k4UvtgwP1Wh2/DPL7KfSiAQPbjzKaW6nlQ8RX/In/RsqWaLOnIH+OoHWoFIefxH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3959
X-Proofpoint-ORIG-GUID: pCZ4OBDrU4JOeyYAQz9IxTjVYs_UdpQZ
X-Proofpoint-GUID: pCZ4OBDrU4JOeyYAQz9IxTjVYs_UdpQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_03,2021-09-07_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=952
 suspectscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070074

DQpPbiAwNy4wOS4yMSAxMzo0MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA3LjA5LjIwMjEg
MTI6MTEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDYuMDkuMjEgMTc6
MTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAzLjA5LjIwMjEgMTI6MDgsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBAQCAtNTkzLDYgKzYyNSwzNiBAQCBzdGF0aWMg
aW50IGluaXRfYmFycyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gICAgfQ0KPj4+PiAgICBS
RUdJU1RFUl9WUENJX0lOSVQoaW5pdF9iYXJzLCBWUENJX1BSSU9SSVRZX01JRERMRSk7DQo+Pj4+
ICAgIA0KPj4+PiAraW50IHZwY2lfYmFyX2FkZF9oYW5kbGVycyhjb25zdCBzdHJ1Y3QgZG9tYWlu
ICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gK3sNCj4+Pj4gKyAgICBpbnQgcmM7DQo+
Pj4+ICsNCj4+Pj4gKyAgICAvKiBSZW1vdmUgcHJldmlvdXNseSBhZGRlZCByZWdpc3RlcnMuICov
DQo+Pj4+ICsgICAgdnBjaV9yZW1vdmVfZGV2aWNlX3JlZ2lzdGVycyhwZGV2KTsNCj4+Pj4gKw0K
Pj4+PiArICAgIC8qIEl0IG9ubHkgbWFrZXMgc2Vuc2UgdG8gYWRkIHJlZ2lzdGVycyBmb3IgaHdk
b20gb3IgZ3Vlc3QgZG9tYWluLiAqLw0KPj4+PiArICAgIGlmICggZC0+ZG9tYWluX2lkID49IERP
TUlEX0ZJUlNUX1JFU0VSVkVEICkNCj4+Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+Pj4+ICsNCj4+
Pj4gKyAgICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSApDQo+Pj4+ICsgICAgICAgIHJjID0g
YWRkX2Jhcl9oYW5kbGVycyhwZGV2LCB0cnVlKTsNCj4+Pj4gKyAgICBlbHNlDQo+Pj4+ICsgICAg
ICAgIHJjID0gYWRkX2Jhcl9oYW5kbGVycyhwZGV2LCBmYWxzZSk7DQo+Pj4gICAgICAgcmMgPSBh
ZGRfYmFyX2hhbmRsZXJzKHBkZXYsIGlzX2hhcmR3YXJlX2RvbWFpbihkKSk7DQo+PiBJbmRlZWQs
IHRoYW5rIHlvdSA7KQ0KPj4+PiArICAgIGlmICggcmMgKQ0KPj4+PiArICAgICAgICBncHJpbnRr
KFhFTkxPR19FUlIsDQo+Pj4+ICsgICAgICAgICAgICAiJXBwOiBmYWlsZWQgdG8gYWRkIEJBUiBo
YW5kbGVycyBmb3IgZG9tJWRcbiIsICZwZGV2LT5zYmRmLA0KPj4+PiArICAgICAgICAgICAgZC0+
ZG9tYWluX2lkKTsNCj4+PiBQbGVhc2UgdXNlICVwZCBhbmQgY29ycmVjdCBpbmRlbnRhdGlvbi4g
TG9nZ2luZyB0aGUgZXJyb3IgY29kZSBtaWdodA0KPj4+IGFsc28gaGVscCBzb21lIGluIGRpYWdu
b3NpbmcgaXNzdWVzLg0KPj4gU3VyZSwgSSdsbCBjaGFuZ2UgaXQgdG8gJXBkDQo+Pj4gICAgRnVy
dGhlciBJJ20gbm90IHN1cmUgdGhpcyBpcyBhDQo+Pj4gbWVzc2FnZSB3ZSB3YW50IGluIHJlbGVh
c2UgYnVpbGRzDQo+PiBXaHkgbm90Pw0KPiBFeGNlc3MgdmVyYm9zaXR5OiBJZiB3ZSBoYXZlIHN1
Y2ggaGVyZSwgd2h5IG5vdCBlbHNld2hlcmUgb24gZXJyb3IgcGF0aHM/DQo+IEFuZCBJIGhvcGUg
eW91IGFncmVlIHRoaW5ncyB3aWxsIGdldCB0b28gdmVyYm9zZSBpZiB3ZSBoYWQgc3VjaCAoYWJv
dXQpDQo+IGV2ZXJ5d2hlcmU/DQpBZ3JlZSwgd2lsbCBjaGFuZ2UgaXQgdG8gZ2RwcmludGsNCj4N
Cj4+PiAgICAtIHBlcmhhcHMgZ2RwcmludGsoKT8NCj4+IEknbGwgY2hhbmdlIGlmIHdlIGRlY2lk
ZSBzbw0KPj4+PiArICAgIHJldHVybiByYzsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiAraW50IHZw
Y2lfYmFyX3JlbW92ZV9oYW5kbGVycyhjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNp
X2RldiAqcGRldikNCj4+Pj4gK3sNCj4+Pj4gKyAgICAvKiBSZW1vdmUgcHJldmlvdXNseSBhZGRl
ZCByZWdpc3RlcnMuICovDQo+Pj4+ICsgICAgdnBjaV9yZW1vdmVfZGV2aWNlX3JlZ2lzdGVycyhw
ZGV2KTsNCj4+Pj4gKyAgICByZXR1cm4gMDsNCj4+Pj4gK30NCj4+PiBBbHNvIC0gaW4gaG93IGZh
ciBpcyB0aGUgZ29hbCBvZiB5b3VyIHdvcmsgdG8gYWxzbyBtYWtlIHZQQ0kgd29yayBmb3INCj4+
PiB4ODYgRG9tVS1zPyBJZiB0aGF0J3Mgbm90IGEgZ29hbA0KPj4gSXQgaXMgbm90LCB1bmZvcnR1
bmF0ZWx5LiBUaGUgZ29hbCBpcyBub3QgdG8gYnJlYWsgeDg2IGFuZCB0byBlbmFibGUgQXJtDQo+
Pj4gLCBJJ2QgbGlrZSB0byBhc2sgdGhhdCB5b3UgbGltaXQgdGhlDQo+Pj4gaW50cm9kdWN0aW9u
IG9mIGNvZGUgdGhhdCBlbmRzIHVwIGRlYWQgdGhlcmUuDQo+PiBXaGF0J3Mgd3Jvbmcgd2l0aCB0
aGlzIGZ1bmN0aW9uIGV2ZW4gaWYgaXQgaXMgYSBvbmUtbGluZXI/DQo+IFRoZSBjb21tZW50IGlz
IHByaW1hcmlseSBvbiB0aGUgZWFybGllciBmdW5jdGlvbiwgYW5kIHRoZW4gZXh0ZW5kcyB0bw0K
PiB0aGlzIG9uZS4NCj4NCj4+IFRoaXMgd2F5IHdlIGhhdmUgYSBwYWlyIHZwY2lfYmFyX2FkZF9o
YW5kbGVycy92cGNpX2Jhcl9yZW1vdmVfaGFuZGxlcnMNCj4+IGFuZCBpZiBJIHVuZGVyc3Rvb2Qg
Y29ycmVjdGx5IHlvdSBzdWdnZXN0IHZwY2lfYmFyX2FkZF9oYW5kbGVycy92cGNpX3JlbW92ZV9k
ZXZpY2VfcmVnaXN0ZXJzPw0KPj4gV2hhdCB3b3VsZCB3ZSBnYWluIGZyb20gdGhhdCwgYnV0IHll
dCBhbm90aGVyIHNlY3JldCBrbm93bGVkZ2UgdGhhdCBpbiBvcmRlcg0KPj4gdG8gcmVtb3ZlIEJB
UiBoYW5kbGVycyBvbmUgbmVlZHMgdG8gY2FsbCB2cGNpX3JlbW92ZV9kZXZpY2VfcmVnaXN0ZXJz
DQo+PiB3aGlsZSBJIHdvdWxkIHBlcnNvbmFsbHkgZXhwZWN0IHRvIGNhbGwgdnBjaV9iYXJfYWRk
X2hhbmRsZXJzJyBjb3VudGVycGFydCwNCj4+IHZwY2lfcmVtb3ZlX2RldmljZV9yZWdpc3RlcnMg
bmFtZWx5Lg0KPiBUaGlzIGlzIGFsbCBmaW5lLiBZZXQgdnBjaV9iYXJfe2FkZCxyZW1vdmV9X2hh
bmRsZXJzKCkgd2lsbCwgYWl1aSwgYmUNCj4gZGVhZCBjb2RlIG9uIHg4Ni4NCnZwY2lfYmFyX2Fk
ZF9oYW5kbGVycyB3aWxsIGJlIHVzZWQgYnkgeDg2IFBWSCBEb20wDQo+ICAgSGVuY2UgdGhlcmUg
c2hvdWxkIGJlIGFuIGFycmFuZ2VtZW50IGFsbG93aW5nIHRoZQ0KPiBjb21waWxlciB0byBlbGlt
aW5hdGUgdGhpcyBkZWFkIGNvZGUuDQoNClNvLCB0aGUgb25seSBkZWFkIGNvZGUgZm9yIHg4NiBo
ZXJlIHdpbGwgYmUgdnBjaV9iYXJfcmVtb3ZlX2hhbmRsZXJzLiBZZXQuDQoNCkJlY2F1c2UgSSBo
b3BlIHg4NiB0byBnYWluIGd1ZXN0IHN1cHBvcnQgZm9yIFBWSCBEb20wIHNvb25lciBvciBsYXRl
ci4NCg0KPiAgIFdoZXRoZXIgdGhhdCdzIGVuY2xvc2luZyB0aGVzZQ0KPiBieSAiI2lmZGVmIiBv
ciBhZGRpbmcgZWFybHkgImlmKCFJU19FTkFCTEVEKENPTkZJR18qKSkiIGlzIHNlY29uZGFyeS4N
Cj4gVGhpcyBoYXMgYSBrbm9jay1vbiBlZmZlY3Qgb24gb3RoZXIgZnVuY3Rpb25zIGFzIHlvdSBj
ZXJ0YWlubHkgcmVhbGl6ZToNCj4gVGhlIGNvbXBpbGVyIHNlZWluZyBlLmcuIHRoZSAybmQgYXJn
dW1lbnQgdG8gdGhlIGFkZC1CQVJzIGZ1bmN0aW9uDQo+IGFsd2F5cyBiZWluZyB0cnVlIGFsbG93
cyBpdCB0byBpbnN0YW50aWF0ZSBqdXN0IGEgY2xvbmUgb2YgdGhlIG9yaWdpbmFsDQo+IGZ1bmN0
aW9uIHdpdGggdGhlIHJlc3BlY3RpdmUgY29uZGl0aW9uYWxzIHJlbW92ZWQuDQoNCldpdGggdGhl
IGFib3ZlIChlLmcuIGFkZCBpcyBnb2luZyB0byBiZSB1c2VkLCBidXQgbm90IHJlbW92ZSkgZG8g
eW91DQoNCnRoaW5rIGl0IGlzIHdvcnRoIHBsYXlpbmcgd2l0aCBpZmRlZidzIHRvIHN0cmlwIHRo
YXQgc2luZ2xlIGZ1bmN0aW9uIGFuZCBhZGQNCg0KYSBwaWVjZSBvZiBzcGFnaGV0dGkgY29kZSB0
byBzYXZlIGEgYml0PyBXaGF0IHdvdWxkIHRoYXQgaWZkZWYgbG9vayBsaWtlLA0KDQplLmcuICNp
ZmRlZiBDT05GSUdfQVJNIG9yICNpZm5kZWYgQ09ORklHX1g4NiAmJiBhbnkgb3RoZXIgcGxhdGZv
cm0sIGJ1dCBBUk0/DQoNCklNTywgaXQgaXMgY2xlYW5lciB0byBsZWF2ZSBpdCBhcyBpcy4gWWV0
IHdlIHdhc3RlIHNvbWUgYml0cyBmb3IgeDg2Lg0KDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0K
DQpPbGVrc2FuZHINCg==

