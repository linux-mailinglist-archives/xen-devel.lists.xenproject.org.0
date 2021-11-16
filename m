Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49C45341A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 15:25:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226309.391029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzO9-0000Ii-JX; Tue, 16 Nov 2021 14:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226309.391029; Tue, 16 Nov 2021 14:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzO9-0000Eg-FK; Tue, 16 Nov 2021 14:24:45 +0000
Received: by outflank-mailman (input) for mailman id 226309;
 Tue, 16 Nov 2021 14:24:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oQI=QD=epam.com=prvs=1954156bad=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mmzO7-0000Ea-Oj
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:24:43 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eedfa2ae-46e8-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 15:24:41 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AGEBarI020972;
 Tue, 16 Nov 2021 14:24:38 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ccdq9r65d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 14:24:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3375.eurprd03.prod.outlook.com (2603:10a6:803:1a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 14:24:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 14:24:30 +0000
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
X-Inumbo-ID: eedfa2ae-46e8-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYJQ7ii0mHvTirHkLc1dADKWvJ1zHxhOpX8qd0tlGoOKoGsMWm/TCNpgoArxjd5weO1PZd0CMaUeyVO1/ycF5HLh/dkJC15B6bzkovic1jtYYEmmZTImIIPW5XBAwEoDWMuZ3WCcLj4LrvljDBCzkRTAxnCkXgqVjy9sSSrC46Yxs4JwsavzK87NalZvGKLs0VaEEsvqztBGrrmbDdmhgnxIyiCU6eGewdI+1j/QPnbeErmZoLCzNrRRqvZv+ExDTuPWbnLJ+Lb5fFRRe6URlNNR9Gwfjogdmg9YBPRA28giOZ3+6JsXI6kaSh90sD8oTBxZP/qLhqc0kqc0Voimrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERC3kglmfYm4kn36U4BGgfIU7oIuuiJ97Q8wXkZEMDM=;
 b=lJ+FiuEeE4yetXIWR5vf5QvARCGzqHkO02fr8dmyxAQeIjGU+1OlQpLnhorj/23936DhIFUwGGtWn7tUgXBDGAltI/SlhjpxAClrfY+/QXIWx+Rm6HX1VeJY7+gLHk00fbJLNK1SRwwsZni3+Y+sk/beVhoxlvXdon59nFGMCiM7TMjjbK8Ahbkuk5KGZq1Za5gcOKwvQghjMzWxbWSmL/2qmSp4b8RHWMTm4xyt0NWLVEBOG0HyvElHy6urNAdoPMHc6sGcCeTBOk3H0xPeB5D783TdvYyEQI4bg96oj4oyVEmn+Jh2iPGdKNrc9Fs+45iGobfqxpaB6P/4TG4Hew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERC3kglmfYm4kn36U4BGgfIU7oIuuiJ97Q8wXkZEMDM=;
 b=YljFrr+tjWsR64yry+Mw3sBLoRkSwKzlowrnrlKXl5RhV2OxyR0WObcsCgSbrT8kHrqQugt9aaHLIeORDBCSzwf3GNO3hc1GiRnOLfqRHbuwtWeCMK+9tuVeYLKPgmynojAv7wI8OZYtlxEj6bapoN6t8YAhW0XVRP4rYMrVDResTpszxRmxdn36q3StR8Cc84zr6RsBxRN4oaZ1M5PjNfZHDoQj5Y9JONFTFWEKc0pnkDnByeVxX9hCObuE0i/JILQd2xeRc9aRD8eTdELn13HBwmQY9aKpxLNIdIG2A1Uiu9jG2IYTUx5eGVxp7k8C8u8MwN+9ifwPS+3wqlhNcw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "julien@xen.org" <julien@xen.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awE30EAgAD09oCAAAgGAIAABgyAgABY44CAAAjHAIAAAz2A
Date: Tue, 16 Nov 2021 14:24:30 +0000
Message-ID: <55a95ff3-6717-780b-25f9-c43728b6270b@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
 <4e12f7de-19cb-bc79-4df0-6fb52538a944@epam.com>
 <5b47cd28-5264-9f24-38a0-e9dec6c2c1b4@suse.com>
 <b87a51d2-cd96-d0ac-8718-7f2b2feed531@epam.com>
 <ad01ebdc-7fb8-3c76-d953-08b73b4b0c25@epam.com>
 <fc1fdee4-e567-038f-a90b-127548a8da02@suse.com>
In-Reply-To: <fc1fdee4-e567-038f-a90b-127548a8da02@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccec1107-dc50-4644-c44d-08d9a90ccda2
x-ms-traffictypediagnostic: VI1PR0302MB3375:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB33755EBD94502D13D58ACCA5E7999@VI1PR0302MB3375.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ejsexkSaetSHBRGBKi1GWlamyMSf+5jXmEMlRZN7luY9nHx7+y3seO03tFJWuuO7rGuzJxLNrAJ5mArLdn/EW3U89PWsd0f5ePbhzFaX6Z1NCS7ytzvQqCqJoztciDVUujLWWb9liw0UuNEjkbXzEV4m2zo1UG0pcZtJfnvp2UxkON0/YF627paWxVnEGtvoQdSlFTjAjObjlV5YIiy1TWYg1JkKgh9FFu+I0SvaMJ/Ep0vZpLzc+bFWUQO4xY0KJeg1ntsthc/1yDsFr/zIepwyCFxGwMIFbqCmAmbukiqb/fHI5/JfSpVJ2yF4J3MMQ/NcEqxLHWZtGSRQrySWmdB0oMzUttDjkmRkgHCIe4rRybaU7eeB9bzGy4AQ/MHTAmYFTrpJIVZBLHLZCUPhho2M/cz04zD1asdbwj1zMOVIaZAsyRSWlggNhbKh9OseO/LiB9BgQp/U6vO07JgSWK07vAPx0VeTMVto8pT9jGzfVBV4ihsdHQabmSBYq1MoLvFxM4ctUdBZ9NlPh+SVi+e6uCrv01wZrSPFbMv4MjMTQYUp7GvnX4hZaMKhYt+2bdG1tu501aWHNgpPY0EBLg0QcXqbOcusTbq/Kg5gAaOojg3qZDc20qVOmW/FAH47Me+BXe2prP1TBKbvM/RO8KZ5PKxnmF2Of2Xu6R3UEREEh18OPWge2Bg4lV+0maGQdpHWbcsjU5OFiVc4pBUFS0V3f1mt8uuVolNmMXtJT9v9Dnzem19zce/E2Csh+RDW4f6lM3k5m88MzMtLbTB0gQp8Hj//BGKDYHSnSxfZHgDNRciH9oW6Gl2jd2qkZaGnPn0b5MEzDBjFKo0B2r9muw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(31696002)(36756003)(186003)(31686004)(2616005)(7416002)(38100700002)(4326008)(122000001)(64756008)(86362001)(6512007)(316002)(5660300002)(8676002)(508600001)(66446008)(83380400001)(66556008)(8936002)(66946007)(66476007)(91956017)(76116006)(6486002)(2906002)(54906003)(71200400001)(966005)(110136005)(53546011)(38070700005)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VkdrMkRMeGEvc05SenhOZjhVcTQ1cUU0a1dyOGhvcU9hdk9OZm03ZHNYd1oz?=
 =?utf-8?B?ZHpNSEQwaTFCNTJvc1ZmUUVPUjVnSjFWNytmYnN2QTlKSFRkUmRSR3B2b3l3?=
 =?utf-8?B?ZjNLekV0cW96QXBIV0I4UnVNOHlQODJqdzgrVXo0czZObE1RbmVKendOT01I?=
 =?utf-8?B?UTdBblRlaDZlKzM3Mm80azZ0WWF0emJDTDl0eUYwV2Q0MUFDeHJCVDQ1OTlL?=
 =?utf-8?B?VXcydlFoSWVEam5LUTB0UG1yamlnSDdwSWVrWnpRaHhIVmxXS3p0Yk1HUE9n?=
 =?utf-8?B?ai9hZW90WGdKYmpUTXRMTlRuc2trTlQvc1VVQWJHMzlKSUJNVjJlaUZvWkpC?=
 =?utf-8?B?bE52dGM2MUcyWDZKLzNacEJwN3pOWEFWSDEwSHJNeEZjK2IrdEdkM1hFellI?=
 =?utf-8?B?QWZDOFR2b3ozQ0xHSkVxMVlSbmNqekRqeXMzZGZlWlh5MXE1cFZ2aHlTT1h5?=
 =?utf-8?B?MlBJSnJYemNsbXpYNlJwV1h2N1FwV3NEQndkU1BxU0R0MlNhbnhsZVF4blpF?=
 =?utf-8?B?WllPSGc2RUxmUGxSLytkZC9HQitKMWRKNnhCSncrZHh5UlFuQXFqeFBLd1Q3?=
 =?utf-8?B?YnhHN2tBSDJXWmNjcm5JODY3UVNQZEhsbWVRbkZ2YTQ2N21hN3d5anRjNDVy?=
 =?utf-8?B?a0grdThnR205Y1IrRko2dXFpWlJuUll4NWQzaGJuZzZFeTVhblQ3OFdyYlFh?=
 =?utf-8?B?d3RiUlk3V2pyY09XaXZmWGJkbVdJNks2eFQ3ZzNWYk5kMHl2aHRJdGI1aUlI?=
 =?utf-8?B?Y0VLN0kxaEc5QkJlNjFtRVJpK1J1VkVObGRlTG5GQW81VnZkeWJFcytlM1R3?=
 =?utf-8?B?aHhkMU5RMERDSWFWREpXUzNUNy9SWHZzeFgxY3hKRjhOSHpHNm5SVzc3RVQy?=
 =?utf-8?B?ZEtxdnRqVVh2V2tFTG9BVmh0a0VVUkFJRHoxTXFab0Y4OVZMSGlFV0VORFN5?=
 =?utf-8?B?U0dCWndMNVRiaGszVU55eFg0amNEZk4yNk42eDFVRnEvQ0lIS3p1eGlVaG53?=
 =?utf-8?B?RzYrZ1hzS3VGUExsUEN4V3Z5SUtaaXE3UTcxSmRyUFJqS0lxWVRHWmJQNXRx?=
 =?utf-8?B?UHNCWk9XT29WeTdUV2ZrYWVJRzlENGFUejZUYzFyY1crc2lDUkFBclBzRW02?=
 =?utf-8?B?dEQraTFJMEFOeHdzaFMyR0UzMVJvV2xjd2pzWFFVdUpFV0ZkNnUrVWdmWlk2?=
 =?utf-8?B?Y1ZxNm1MOUpKaE5nOFVzcW15bFhpaEg4MWRsN1JUZTFNc2tlQjA5S0lDZHpn?=
 =?utf-8?B?YStINExHdERhL1RuaDRTWUZIbGE0K1J0UWdlREZFQ3loQm9xS3RYWVFCb0pO?=
 =?utf-8?B?WGZ6ajFOWlRtM1dEeTYvb1hTU0d6UlF3OGgzbUZzdndXVEdqcUdqSUtUbDVz?=
 =?utf-8?B?YlBERE11WktDOC9uT3dRSGJwVXNQc1hjaCtGd1pCYytOS2doUGV0eEE2MXNn?=
 =?utf-8?B?dSs2VVpRV0xDNkJDcGRpck9xL2hrQitQN3V1R0JPM0FCbE9zUjZYUG9UUFVw?=
 =?utf-8?B?OGJjazlScXdtT1QzWFpYVEtOVVJFU3BFQ1Y0SFY3ZVpCVm9EaXZYZ1RMTlNW?=
 =?utf-8?B?L1Ewcm9Cd0RUNDBBTGM0aml5YzA4UitUcXJpTStaeHIxWmhDWGdYZ1ZTVzdo?=
 =?utf-8?B?dGNCenMvbGcvdjJXNkZORE01T2J5SWFRUDVTYXhSeXN5UHJVSXZrbmN4R2NO?=
 =?utf-8?B?UTNJWVArVmJoSHllempvYW1iY1VNa3RjbXhhZGs1T2Z0UlVnRGVCTk5hNXAx?=
 =?utf-8?B?bDA5YUl6dWRNVWdQakZ5a094TlRsUWFLZFdEcEF4aU5uZXQrZXZ4YTBpYWM4?=
 =?utf-8?B?TEg3MTZVM1EvcXhaSHVvb3o4OVhHVGl2RlJOakpIWk9LazF5RWlsdWYralZ0?=
 =?utf-8?B?RTgwMVRlWElvOWNQY3ptT2VQUm1LNndra25DR280VnlqNUhtMUI4Ulo0bHFK?=
 =?utf-8?B?RUtRNnB3WUgwWkxJTlNSR0EvbVRIelp0RjF4Wks5OUxBQ3RtbEk3a2h4dnpy?=
 =?utf-8?B?YStUY1Q4MUhBRlM0amxFbUNTdEh2dE5qaWcrZnYzZ1I0VXpyNEFLcldudkJw?=
 =?utf-8?B?K0NLc2J5WndNNGJkSlRpWlMrK3RBMXF5bG1JdW5XQk9Vb1l3dUplT1M5VWtH?=
 =?utf-8?B?Z0RacldINzlnM24yQU9OTGNtRjI4QXVMaEtMc0tPaHMybFpTeDlsUzRmWUFx?=
 =?utf-8?B?N2F5RG1nbm1RR1A5QWkycE95WGM3M25pZmF0OVZNcDl4WG1McnlBQjZ4TEd2?=
 =?utf-8?B?SnhyR0JHZjJLdVEyZCtWVTM1QzB3QjI1RFdiKzhpQXFjenVkQ1Q0RlpRR3pW?=
 =?utf-8?B?YzVzS3BIUThUUnk4b1pXM0M5WHpCd3lnM0loejhWLzI3NXR2cjVkdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EB8B0928660854FAA8AE862F67E669C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccec1107-dc50-4644-c44d-08d9a90ccda2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 14:24:30.2671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SIkmf49BAQSBa1GA152dYoPggZ3O4SBDHbTDyQrD6jU/4KTWvlGe6wPuOW54CeisS1U0HDxFu0uF5Mycpc+wpbpDp74FQgUR38PcwiumhBy2s5O2Jch4aJVY9uBGhdmW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3375
X-Proofpoint-GUID: 2JLV5KqXfvx2K4ERmLN_aqzx4Iz5g468
X-Proofpoint-ORIG-GUID: 2JLV5KqXfvx2K4ERmLN_aqzx4Iz5g468
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_02,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxlogscore=822 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160071

DQoNCk9uIDE2LjExLjIxIDE2OjEyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTYuMTEuMjAy
MSAxNDo0MSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMTYuMTEu
MjEgMTA6MjMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+IE9uIDE2LjExLjIx
IDEwOjAxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMTYuMTEuMjAyMSAwODozMiwgT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+PiBPbiAxNS4xMS4yMSAxODo1NiwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gT24gMDUuMTEuMjAyMSAwNzo1NiwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gV2hl
biBhIHZQQ0kgaXMgcmVtb3ZlZCBmb3IgYSBQQ0kgZGV2aWNlIGl0IGlzIHBvc3NpYmxlIHRoYXQg
d2UgaGF2ZQ0KPj4+Pj4+PiBzY2hlZHVsZWQgYSBkZWxheWVkIHdvcmsgZm9yIG1hcC91bm1hcCBv
cGVyYXRpb25zIGZvciB0aGF0IGRldmljZS4NCj4+Pj4+Pj4gRm9yIGV4YW1wbGUsIHRoZSBmb2xs
b3dpbmcgc2NlbmFyaW8gY2FuIGlsbHVzdHJhdGUgdGhlIHByb2JsZW06DQo+Pj4+Pj4+DQo+Pj4+
Pj4+IHBjaV9waHlzZGV2X29wDQo+Pj4+Pj4+ICAgICAgICBwY2lfYWRkX2RldmljZQ0KPj4+Pj4+
PiAgICAgICAgICAgIGluaXRfYmFycyAtPiBtb2RpZnlfYmFycyAtPiBkZWZlcl9tYXAgLT4gcmFp
c2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKQ0KPj4+Pj4+PiAgICAgICAgaW9tbXVfYWRkX2Rl
dmljZSA8LSBGQUlMUw0KPj4+Pj4+PiAgICAgICAgdnBjaV9yZW1vdmVfZGV2aWNlIC0+IHhmcmVl
KHBkZXYtPnZwY2kpDQo+Pj4+Pj4+DQo+Pj4+Pj4+IGxlYXZlX2h5cGVydmlzb3JfdG9fZ3Vlc3QN
Cj4+Pj4+Pj4gICAgICAgIHZwY2lfcHJvY2Vzc19wZW5kaW5nOiB2LT52cGNpLm1lbSAhPSBOVUxM
OyB2LT52cGNpLnBkZXYtPnZwY2kgPT0gTlVMTA0KPj4+Pj4+Pg0KPj4+Pj4+PiBGb3IgdGhlIGhh
cmR3YXJlIGRvbWFpbiB3ZSBjb250aW51ZSBleGVjdXRpb24gYXMgdGhlIHdvcnNlIHRoYXQNCj4+
Pj4+Pj4gY291bGQgaGFwcGVuIGlzIHRoYXQgTU1JTyBtYXBwaW5ncyBhcmUgbGVmdCBpbiBwbGFj
ZSB3aGVuIHRoZQ0KPj4+Pj4+PiBkZXZpY2UgaGFzIGJlZW4gZGVhc3NpZ25lZA0KPj4+Pj4+IElz
IGNvbnRpbnVpbmcgc2FmZSBpbiB0aGlzIGNhc2U/IEkuZS4gaXNuJ3QgdGhlcmUgdGhlIHJpc2sg
b2YgYSBOVUxMDQo+Pj4+Pj4gZGVyZWY/DQo+Pj4+PiBJIHRoaW5rIGl0IGlzIHNhZmUgdG8gY29u
dGludWUNCj4+Pj4gQW5kIHdoeSBkbyB5b3UgdGhpbmsgc28/IEkuZS4gd2h5IGlzIHRoZXJlIG5v
IHJhY2UgZm9yIERvbTAgd2hlbiB0aGVyZQ0KPj4+PiBpcyBvbmUgZm9yIERvbVU/DQo+Pj4gV2Vs
bCwgdGhlbiB3ZSBuZWVkIHRvIHVzZSBhIGxvY2sgdG8gc3luY2hyb25pemUgdGhlIHR3by4NCj4+
PiBJIGd1ZXNzIHRoaXMgbmVlZHMgdG8gYmUgcGNpIGRldnMgbG9jayB1bmZvcnR1bmF0ZWx5DQo+
PiBUaGUgcGFydGllcyBpbnZvbHZlZCBpbiBkZWZlcnJlZCB3b3JrIGFuZCBpdHMgY2FuY2VsbGF0
aW9uOg0KPj4NCj4+IE1NSU8gdHJhcCAtPiB2cGNpX3dyaXRlIC0+IHZwY2lfY21kX3dyaXRlIC0+
IG1vZGlmeV9iYXJzIC0+IGRlZmVyX21hcA0KPj4NCj4+IEFybTogbGVhdmVfaHlwZXJ2aXNvcl90
b19ndWVzdCAtPiBjaGVja19mb3JfdmNwdV93b3JrIC0+IHZwY2lfcHJvY2Vzc19wZW5kaW5nDQo+
Pg0KPj4geDg2OiB0d28gcGxhY2VzIC0+IGh2bV9kb19yZXN1bWUgLT4gdnBjaV9wcm9jZXNzX3Bl
bmRpbmcNCj4+DQo+PiBTbywgYm90aCBkZWZlcl9tYXAgYW5kIHZwY2lfcHJvY2Vzc19wZW5kaW5n
IG5lZWQgdG8gYmUgc3luY2hyb25pemVkIHdpdGgNCj4+IHBjaWRldnNfe2xvY2t8dW5sb2NrKS4N
Cj4gSWYgSSB3YXMgYW4gQXJtIG1haW50YWluZXIsIEknbSBhZnJhaWQgSSB3b3VsZCBvYmplY3Qg
dG8gdGhlIHBjaWRldnMgbG9jaw0KPiBnZXR0aW5nIHVzZWQgaW4gbGVhdmVfaHlwZXJ2aXNvcl90
b19ndWVzdC4NCkkgZG8gYWdyZWUgdGhpcyBpcyByZWFsbHkgbm90IGdvb2QsIGJ1dCBpdCBzZWVt
cyBJIGFtIGxpbWl0ZWQgaW4gY2hvaWNlcy4NCkBTdGVmYW5vLCBASnVsaWVuLCBkbyB5b3Ugc2Vl
IGFueSBiZXR0ZXIgd2F5IG9mIGRvaW5nIHRoYXQ/DQoNCldlIHdlcmUgdGhpbmtpbmcgYWJvdXQg
aW50cm9kdWNpbmcgYSBkZWRpY2F0ZWQgbG9jayBmb3IgdnBjaSBbMV0sDQpidXQgZmluYWxseSBk
ZWNpZGVkIHRvIHVzZSBwY2lkZXZzX2xvY2sgZm9yIG5vdw0KPiBKYW4NCj4NCg0KWzFdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hZmU0NzM5Ny1hNzkyLTZiMGMtMGE4OS1iNDdjNTIzZTUw
ZDlAZXBhbS5jb20v

