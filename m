Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C084A6D78
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 10:04:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263880.456734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFBYo-00073B-JM; Wed, 02 Feb 2022 09:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263880.456734; Wed, 02 Feb 2022 09:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFBYo-00071K-FR; Wed, 02 Feb 2022 09:04:18 +0000
Received: by outflank-mailman (input) for mailman id 263880;
 Wed, 02 Feb 2022 09:04:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFBYm-00071E-DO
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 09:04:16 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 177c06e3-8407-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 10:04:14 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2128xLwr030539;
 Wed, 2 Feb 2022 09:04:06 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dypx4g0pg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 09:04:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6305.eurprd03.prod.outlook.com (2603:10a6:20b:157::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 2 Feb
 2022 09:03:43 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 09:03:43 +0000
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
X-Inumbo-ID: 177c06e3-8407-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlGSN8jOIM9nkQOaoUYBW+VZ9DVfGzYa1MAuKqOQ8n4TjXexIdrn9H5CyKr2r01y8wDH2jae3ioSktdlt7r6h4T6zwjpRgnyiD4kBzhCKK5EdwXOp8eIbdV1mrxdUn9Yh4d+jppWEkcJVF8VKGTxxC0utq3P9rMvGELXA8Lk2L4Ov9U00RBuyoVgDGUG6YRU71BwXBd9ON6h7kr5U+WGAZwuQKhJcslIFN7th6m53xFCFevIyq6FAlgi03mCMHPoxsdBX9XKcw7gr27waMdf5hdhTdbsr8d+lfiYhxyyEtZULivwM7hRK0UpRbpnG2bJnycOYb0n47Ls2hJckAcuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+KT4wm+7ICt7Rpnun5Yk3jRcuBS8sCIzjxZ/3iPc0w=;
 b=ogH0HU+JeksYbaF+IrRx3+5kBYMb7oU6CrgiawMK2bS+uw56t/Ba86rCsNMs8TcsuQ3+A6jygYo+G7jKCJROIlNfCYzlbHPHpiFwAuHMEJnhoFm1EIipIC8yxG7Mvs48qBYUOP4t0SRhTCCHUEvw9KSvpVo9GmB/tugrsIkzcboTjfo0NpUbeypF8BkclG8wQtSK9/LBF/AKTB+VOWzPScc4VP9tfqLOhKmmQwMhBbtIn9K8XVx+kO/TDcwOo3UB4tu5R32P1a4nF1CXd68ZIUw6Y8KlVeN4t7XDx9VGZyGVR6GlhtyM/AwWcc4S3q0RJYK6ddyYoLHWZd3CbtXjzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+KT4wm+7ICt7Rpnun5Yk3jRcuBS8sCIzjxZ/3iPc0w=;
 b=EeyE9cyROR+NAuxNgtG1+3BX8c1C3wEX42n40DpetRifY4PSbFTaGYDtHhSGRu3uE30tOxfeTetdB+M/RK14+3F3HUpgTllBSu6YbC2oHh3xQPNp4D9FSn0mUgL4A5QYCIa4JcN8t2w6OJ6kfSwweoPFEbka5/lQEoBi91Oc66Seb/q4KRGW9aY/AkoFkHEoaSR5EB3vh2wsq2F54/JxFi7qOhkrQ1TQfWaVnXNY383bUgs6s85RTvWz67mV+UrnJisJP18IetlENzYxWIHyVzGQqZTAozseJB+G/36KoYF9Pjo8uXN2wwECzqoovBNuOiv7YjkZnyrM7HxsieBxPw==
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
Subject: Re: [PATCH 0/4] PCI devices passthrough pre-req patches
Thread-Topic: [PATCH 0/4] PCI devices passthrough pre-req patches
Thread-Index: AQHYF4hNdg5dcISE9UKKPLIP6ozan6x/9F4AgAAEHgA=
Date: Wed, 2 Feb 2022 09:03:43 +0000
Message-ID: <c504ecec-ac59-f357-365c-df48129680a1@epam.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <5be7a1d9-0d59-d099-a5ab-f4ca550de78c@suse.com>
In-Reply-To: <5be7a1d9-0d59-d099-a5ab-f4ca550de78c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eecb1236-173e-44af-540d-08d9e62ae9bf
x-ms-traffictypediagnostic: AM0PR03MB6305:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB630517CBDC0BD55B5ACE3AE8E7279@AM0PR03MB6305.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FiVKyuSJTX/Z1i0h2m/YxtmOhqGlDG5rorsfRhV9Y4W3lqHj4SnI0pKA/rtPurOh9qd9GzIN2PzzWiPdkounS9Cc6yb5DzBKErbXlE8z1WdN0DqnrM6/PKhtykCEQAeHXwB80bIsZCwwWykVF8M07/O1GSdBcD4vuJprLq0ZV5tjkvHpwV88GEtMQr4r/KP8Xq0cSSENh0ZVbH4733n5v6GF1cjQmuGyQfrv0Zjyn6URq6Gv9UtW1ILzJllxkINYsBp4SzrJeOh2XU7x2XlSnCUQ4H8jlrzGm0LrM1D4i8jflmWBZWOuy8McpKFPzxp2xA0QsF2oGv8G3PyioypPQv4ASMNwbMGRoUNhEONQchez0k/Ki5Iu1kFwmn5fxaOFAUhyhv/neCRVS2VEpod1dihSgERGKlyAWpORbaxzvfZaQMQEjW0a4sFJ+bVnLInKX+5mJWVv3PU+ZpM/sv0BHYHhW2jY4WauA1cSQqk6V/a0VFOL0jTIL2bzYpy0lM8owFF+zd1xGLnOvwpzEjfHz5GAYLd+4qZGzPg6BdHJV7YeV8PIYJh2X/YqKZr4PyZIlg8MN54WpBGcdz6cd4fDByhsUyNKF8hBnOVNCfWD/14T1cMvzS46+Zd27dkzmmoGfuyX1DwwESL5+uEM0D/JMjTWUWFz1nVMPKoTUzIre/a+F+UqxjYIYqIDA2r8rGyruiKlq7Fzz2YcimQkCixFDRYb0cM1YTFFw/vzKlfiME3XpqY80HBhVyoCYs6m8g2w
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(508600001)(86362001)(31696002)(53546011)(4326008)(31686004)(4744005)(6486002)(186003)(2906002)(76116006)(2616005)(122000001)(8676002)(91956017)(5660300002)(64756008)(83380400001)(8936002)(66476007)(36756003)(66446008)(7416002)(66946007)(66556008)(6916009)(54906003)(38070700005)(316002)(38100700002)(107886003)(71200400001)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bmFEdGpzWnQ5bGFrcjZFazNlaDVUVEVpNXg1OENndEdoVTZlbzJTVkRNeFBy?=
 =?utf-8?B?ajFZMXVZY095Y3haM2RNMmZpSE11UlhkWEJ2VlpCOGwydUpyUW5semUyeFo2?=
 =?utf-8?B?Yi9rQ2s1Y1J5dnZVd3g3M3Rkdnh3MThRWWlIcjB1WHV4WUVIQytKSUEyOS9v?=
 =?utf-8?B?NWY5TUtyTDViYURrWDJSNjJFTEh4K1ZPWjVydFZ1VjNudHRkcHhnRlRqZUVr?=
 =?utf-8?B?KzJKVFE4dUxsM1VJY0Rwa1RGcVM4NUd4dGlFeXM4NG96cmtNUks0VWw1SW1y?=
 =?utf-8?B?N1V6UDBqVDA5YjdwQ0Vmdk5LL2FzRFZKeW11L1VOZFBwcXA2bTczU2d6dHcv?=
 =?utf-8?B?SkJKK2tEZXZHcXh6VGgwTXdSendFS1ArY2t4R0J0ektxbEcxRjdMYzNWc3gw?=
 =?utf-8?B?cEJBU1RHZ3QxVTRvTEp2TE5PRHpkeG1acFRLZUwyb1J6WDNWSFJzazdZSWpL?=
 =?utf-8?B?cmUxclNtZk16cWNVd29CTUhUc3NVTWRYMXlhWVpoSzJINHl5RFNWU0hERlZu?=
 =?utf-8?B?dGtQZ1FPMDEvL3JMVmc2by9EMk9TQVBLbVFWSzVEbldwcmh2SnNubTBvQk5H?=
 =?utf-8?B?WjhHQkU3ZElDU2xtakkxcXg4Z096SStOaDc5a2kvNnVHTy9lTFZ5T1hPU1JG?=
 =?utf-8?B?TnJNZHJFV3JwUkRDOWRlcW81VUp1U25oc0MweDJORE5zVjRyYVI2NUZqOTRz?=
 =?utf-8?B?NDNQekl5dnI2ck1GQUhGTWxNbGtVWE5DWVpYQWJMYUpuTEVtOFBBMzlqNDhv?=
 =?utf-8?B?eHlpV0d2OG80YkhSTnhqbVhMQjJTQ09jUWVOZUNpS0hCb0svcGZkUUhsR0VB?=
 =?utf-8?B?Mm1pWXF6NUpxbHlWNU41TGt3dVZueVhnZjRHRmZvaVN0R1crZEZtWFNuSW9h?=
 =?utf-8?B?WWhlenBvRDZjNE55RC9uUjZscTF1SlFwV1NYS0xaa2NzSlE1VDRwK0oyUHg0?=
 =?utf-8?B?NVlSc3ZyWXJiemgxc0RPWDYxSTBTaGhKeEZhSXBjUjgyL2NxakREcHNQWklN?=
 =?utf-8?B?amVsd1NoL2JtU0Y0d3R4d3RDeU12QmViWEpMMnRhdi90V1hRc3ZWN2RIM3gv?=
 =?utf-8?B?Zy9FZFAyVDhPclkydWVkaktXZmNoeCtEOHMwUXpCMU5KcVRsWmlUWkV3c1Fo?=
 =?utf-8?B?MVNlTTNMYjVjV3YvRHFDWHNteWRZR3lHY3VITUxJaVVEdHA0RW8wR2ZrakRM?=
 =?utf-8?B?TGNHMnR5TGRVMkEwUHR2SmpyLytUekZDOHlRRFplL1FMUm1XYXE4QS9oNHU1?=
 =?utf-8?B?dzV5QnFvS3ladE1saHZnaHprYzRVOC9IcG41ZnA4UWM5eUplbXFHVFRhOE1S?=
 =?utf-8?B?Si8zZEU2TXdyQ3dZMW1HbHdDemJrUXhEaDBqdHZIQk81V0MvT3lnM0pkc2sw?=
 =?utf-8?B?TDY5d3FpSmtLNUtkbUJXNTc5L08zOG1GMk9pU2k4Mms3Rjkza3JTbEhlQ1pk?=
 =?utf-8?B?VXRsVVowNGkxeEpEbjdNS0pvVTBzMkc1RTVOUWJqWlZZZldzSkRXQU93SWRS?=
 =?utf-8?B?YWZIVGgxc2t3alhJVFZIdEd3ZmIvcTRMSncvT1UybHJmMDZOL3ZHTlF1SE53?=
 =?utf-8?B?R3lYb2tTQXIzenloQk1kbTZoTjNSYVF1WFYvcWRvQ3JKUTZKdHRkUGtEWk44?=
 =?utf-8?B?RVM3anB3aXpwQmcwbzBMTGoyR1JINWZzUzNXdHJ2ZXNEcGZCREh0ajdYSWVH?=
 =?utf-8?B?U0F4S1dGRklyT0NpZ2l3ekhrU0pVODJKa3NwNktWT3dBYWNIODJyT1dEWjRa?=
 =?utf-8?B?V0JYQ1BQcEhqdGdmbkdjdFUyaWh2NXh0SFB4YytBeVFVMVNzMlhYNnRGWWp6?=
 =?utf-8?B?NS9wdzlhUWliNGhHZGJBODRhcjk1Y3lhTCtYRDNheDdyclhqb2I4cndoUW1Z?=
 =?utf-8?B?bkIydXJweVpVa1YyQUhxS2hLcDdjZ0E4K05VNkx0TE5mVFJQRkJqb2syYjlx?=
 =?utf-8?B?RDhXN2ZEaEZmQjh5alFaNHZpay80NzlCQjhrVzUwbjgrcjBEL3Npd1NhVlQ4?=
 =?utf-8?B?Rk5FcHBOTEVwM2YwN0ZuVkQxeVRxdGwzam5Sc0xtWFI2YmJHNkdkTjhOem5i?=
 =?utf-8?B?NFJFQmFUa2NNZnIzOUE5UXR4RElyZXdjRWNGZnJtZndKOHJiNTQ1ZDArOTRi?=
 =?utf-8?B?ZVZkL0gwNXB0ZTJocEtTQmNOQ1FsMHI3NWZ2SU15M2diZkkwdTFEaDE5Z2dV?=
 =?utf-8?B?K1dTMWRlZXV3cnVSQ0tLY3VtQnJIV3BERzFzQkRCUmI2MmpCOEx3Mi9xU3hY?=
 =?utf-8?B?QW5wZlpudEZGWXRmVnY3TkNZZGZRN0JPZHVuOHAvNWlYOFBiSUk5RkZrYkx1?=
 =?utf-8?B?cG54djh4ektPUW1UUUcwWUJQUitwZ0pwNnVJMkxxZHhPVVFoU2RhZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D16570BE60BC9842AA921194C780A1CA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eecb1236-173e-44af-540d-08d9e62ae9bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 09:03:43.3187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1EMur4ei5iQat3ZoR0KcJmsqH9/FTk5KdeH9g1H5UJ561EcSLG1mwVWHDrb/t3ScXz1ouZpPl1jT1wyIVpEMggjM7eE9FUWwuMYfmKDjXWJiXj2xTwEGCe0zc7J56gmU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6305
X-Proofpoint-GUID: 8RR3YaggSVw8w_owd815M_LNKWAT_3-N
X-Proofpoint-ORIG-GUID: 8RR3YaggSVw8w_owd815M_LNKWAT_3-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_03,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 mlxscore=0 spamscore=0 mlxlogscore=743 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202020047

SGksIEphbiENCg0KT24gMDIuMDIuMjIgMTA6NDgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAw
MS4wMi4yMDIyIDE3OjI1LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvICgzKToNCj4+ICAgIHJhbmdlc2V0OiBhZGQgUkFOR0VTRVRGX25v
X3ByaW50IGZsYWcNCj4+ICAgIHJhbmdlc2V0OiBhZGQgcmFuZ2VzZXRfcmVzZXQgaGVscGVyIGZ1
bmN0aW9uDQo+PiAgICB2cGNpOiBzaHJpbmsgY3JpdGljYWwgc2VjdGlvbiBpbiB2cGNpX3tyZWFk
L3dyaXRlfQ0KPj4NCj4+IFJvZ2VyIFBhdSBNb25uZSAoMSk6DQo+PiAgICB2cGNpOiBtb3ZlIGxv
Y2sgb3V0c2lkZSBvZiBzdHJ1Y3QgdnBjaQ0KPiBCdHcsIHdoaWxlIEknbGwgbGV0IFJvZ2VyIGp1
ZGdlIGZvciB0aGUgbGF0dGVyIHR3bywgZm9yIHRoZSBmb3JtZXINCj4gdHdvIHdoaWxlIEkgYXBw
cmVjaWF0ZSB5b3UgYnJlYWtpbmcgdGhpcyBvdXQgZnJvbSB0aGUgbGFyZ2VyIHNlcmllcw0KPiBJ
J20gbm90IGNvbnZpbmNlZCB0aGVzZSB3aWxsIHdhbnQgY29tbWl0dGluZyB3aXRob3V0IGEgdXNl
cg0KPiBhcHBlYXJpbmcgYXQgbGVhc3QgaW4gY2xvc2Ugc3VjY2Vzc2lvbi4gSGVuY2UgYWxzbyB3
aHkgc28gZmFyIEkNCj4gZGlkbid0IGNvbW1pdCBwYXRjaCAxLCB3aGljaCBhcyBwZXIgaXRzIHRh
Z3MgY291bGQgaGF2ZSBiZWVuIHB1dCBpbg0KPiBhbHJlYWR5Lg0KVGhpcyBpcyBmYWlyDQo+DQo+
IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

