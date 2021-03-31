Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCA134FF18
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 13:02:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103881.198155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYbU-0008Pm-9S; Wed, 31 Mar 2021 11:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103881.198155; Wed, 31 Mar 2021 11:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYbU-0008PL-4Z; Wed, 31 Mar 2021 11:01:40 +0000
Received: by outflank-mailman (input) for mailman id 103881;
 Wed, 31 Mar 2021 11:01:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NSS5=I5=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRYbS-0008PG-Lq
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 11:01:38 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0faf9e6b-a84b-41d3-a062-93f5261adafe;
 Wed, 31 Mar 2021 11:01:37 +0000 (UTC)
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
X-Inumbo-ID: 0faf9e6b-a84b-41d3-a062-93f5261adafe
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617188497;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=Dtb4SWVY/ALu2efMJsjgL3lkR/P7PyQK5Gppvr6xvqk=;
  b=Lk4DUCvzUeW9BdO9UIJuKwpuAOo8ANVGHo5RfeUaDn9QRixPOFBo5flL
   zLMmVbWF0M3BbpjTk7U+Z06FSVgw8dvY+ZHpTFYxRSDEWEVfa9TF75Fzj
   dgBS9xw4MPKox3glTW62Qb8s+SbefDMJDKIDeMVE5c+Jnk0q/AF2acYUn
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fnu1kk8YrtbCA1MlrcghGbH+dJK6HxNyok4A9gsmn3vEt/Od545pQV4TX8WC0qJ66/mqpvuQa1
 2hlAHR+UFwFJSwjJjEvGarhCtcFOm7ySKj3QPyVch8tTT8nqpTNO5ZF5BQJJARJgr8mXdWFygn
 /zPmxKgHGt+tGG9hAYZrkDMj479HoWWXCGnBfMHfnXJmkOF5z7YUgsHogYkFIoL01kfU6Dsr8n
 rbiUOLA6yGcRbkiKtaGsaLgsMJlDPP6qkj42Vckau+mQTksheZ2JFfwxHiCsEotQR54AnjRkS1
 1sI=
X-SBRS: 5.2
X-MesageID: 41996257
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ilwXOqGVbMYrr2MwpLqEfseALOonbusQ8zAX/mp6ICYlFfCwvc
 aogfgdyFvIkz4XQn4tgpStP6OHTHPa+/dOjbU5F7GkQQXgpS+UPJhvhLGM/xTMOQ3bstRc26
 BpbrRkBLTLZmRSoM7m7GCDfeoI78KA9MmT5Nv263t2VwllZ+VBwm5Ce2WmO2l3QAUDOpYjDp
 qb4aN8xwaIQngcYsSlCnRtZYGqzbD2vaj7ah0LDQNP0njtsRqU7tfBYnyl9yZbfzRTwaoztU
 jp+jaJgJmLgrWA5Fvx90K71eUypOfc
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="41996257"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9ON4SsJZ9aQ1lqRGIHKqfbr6YngS6N8h32nP7Cx0MH0t8g4xIL1/00Fy5XRTJfXxVo6bC8tzApEfWb5Vdmm7BjEOFs06hZvwU5sO8WCeE4HrP1lFTsLwuinenEO5kYXN/IE9UeFeslcvt2dBYHdTIJYY7Yv4KRvA0FrcrVosC8PTvRSd4zbaEBu+TCImZQzZi/7AE/IW2Pg8PiUe/DYtCX16wwFJN4mDCTmHvzWQc0RQh5fDfv4C+e7f+FqS+C0R8U8oA/KmZDS7c6pOAjMAoL1GEppvKoAx7+1MRPGE5ZkJU2ai+9eSj3UzNKp1j00LZYW6Sr45J407OUNgZ686g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dtb4SWVY/ALu2efMJsjgL3lkR/P7PyQK5Gppvr6xvqk=;
 b=QHIYOrpX3lqVBqyD83WXvMmoUDhenrvvfjkwLm+UGJsvF+jTNLV3IDcI/XDWmL67llWx+owNIeT746xNH+VHckh1IIYpCTiTKroppXp3DZeUFbUXz5wDB8fG1wcLUbkhl0/QXCu4Qjh8Xo+8m6EpAOdjOcWCqiJQO/X/hwdSiXxlvNo/i4y4MwPyzJCRg6JEaKhuixm3qI9Lo2S3KySSbw8Ub2QJxc7qgPwyPMDEdskv366dMnIwAQskMJafFs9T4ONZXm9xZhOQt8rE0uWR/fevnQAdfT7g1QkrxXOm1q2i6SKJNhv0KHbafvUCDkG3MlTeq4e+JyIlVznS77abvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dtb4SWVY/ALu2efMJsjgL3lkR/P7PyQK5Gppvr6xvqk=;
 b=Lz4SxG9dONJV4plzcz9WSpJI7ojrT/+LppZ+aLkDApe7/LhxpsGHhMBcqTQKlqAGBD3D1peBKIj2E6Yyq5r05IqCktInnehJTi9Dm4FWQLHI9hiprwlEL0zPYvEuarr1Bag4ABsMcTIaHaSMt8P0YARB9SBSp4cHCS2mxVuPqK0=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com"
	<intel-xen@intel.com>, "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Sergey Dyasli
	<sergey.dyasli@citrix.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, "Kevin
 Pearson" <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, "Matt
 Spencer" <Matt.Spencer@arm.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, "mirela.simonovic@aggios.com"
	<mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dornerworks.com>,
	Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Ian Jackson
	<Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, "David
 Woodhouse" <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ash Wilding
	<ash.j.wilding@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>,
	=?utf-8?B?UGlvdHIgS3LDs2w=?= <piotr.krol@3mdeb.com>, Brendan Kerrigan
	<brendank310@gmail.com>, "Thierry Laurion (Insurgo)" <insurgo@riseup.net>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Deepthi <deepthi.m@ltts.com>
Subject: [ANNOUNCE] Call for agenda items for 8 April Community Call @ 1500
 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 8 April Community Call @
 1500 UTC
Thread-Index: AQHXJh01Lcq41mTG202PuZUd4eityw==
Date: Wed, 31 Mar 2021 11:01:32 +0000
Message-ID: <C05CE6DF-0498-429E-A2D0-88514FA77E99@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f86529b-5ad7-4cd3-093f-08d8f4345857
x-ms-traffictypediagnostic: PH0PR03MB5927:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5927CB30F77AE1A565E45612997C9@PH0PR03MB5927.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +qv7LuI9Vp4TIBXzXYVBKFpiDLt86Q4jcPzBVz2u84ffh+2vSwzvJTX6bY5iO18QYPOn3DvWnqRTCgKm2PJeoWksdLO7kFaYooFeV9PMo0hotESO5UI3TtfzxjYjG/K8z1MyzWRswjs6Ozf8ytlgiq6Nv1KHZCa0Y/4yJdi3Hb8IVDWpOYPWMBr3P0L5OdR7Tpl6Y6ykBycT4ksnivR4q6Z/7hMTjQhs+veQyL0lIQ0d62UadIk0eRe4eUhYQ7VV4JbDdxbBQJqoaw9Bgv5+7KAPD23iXAytRrsGlCGbccx02/r64ilyyoaNGuOJ/Qr8O6hcy2GmX53PbX9wGTACSG+L9KcYdsExRylVS3C6xehTQcINvKDAOqmz9ZY2MpPOOqI0Om0DXSeSoc4c394u/C7Yr8lW0Nt5k/UgfH+GNtmLAU+Wd1d+pTGXw/lcaG0mqDSk4zY6iDypnerTlaqX2SEQDFiOqH+FFIglpV0fpoBQU28N3s42k18kvQF2xX+tsLppP/vXFpZlt6vuBFdVY48k+ng9GlsR2PlSaD/9ayPpDg/62/G0wcT5zyAb5Kyqcur6H9ptxvjwwWmOwZXrWkcO7C4TvMWeKa88tl2sNl4QT6kZeMGinTETv3rtiaeJ6/syRGe818G/tq5MVk7Hh7VTsBEOxHiB/VznHfGpU35d6VWRCiYozskdpY8gdpUZpu819piUyCOorrKIvY6eIh2AKwVjc9OVKyimc1RQhWx0SoiyUJfBOBlRfj97EeOK6tWvK2s6TS+i+UQxYoiP2PmC+VRRepqvBVajWJ6kzhk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(8936002)(26005)(83380400001)(478600001)(66556008)(8676002)(64756008)(36756003)(6486002)(966005)(66946007)(6512007)(38100700001)(4326008)(2616005)(186003)(66476007)(6506007)(86362001)(6916009)(7416002)(33656002)(54906003)(316002)(71200400001)(76116006)(2906002)(7406005)(91956017)(66446008)(5660300002)(221023002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?KzE1aTVkWEdkNnVkQzdxdTFNWHVqNzVGMjNRRTg2aHk2eUlRd3h2WWVhL0k0?=
 =?utf-8?B?N1hEYUlkMk5xRVF6YllNZ3BRakhFdTRmcGtFQlZ4cjZ0NWV4aDVHMGMrbloz?=
 =?utf-8?B?UjgwSmhjMmZyMlJjVEZ3RU9pTFhHd2EzMXg3L1N2OGcxUVNCMlZydG9uVUl3?=
 =?utf-8?B?V1JOQXB5T0o1dlpEdGFYa1pPUjUvdHdBSWovQVNmN0tKNjNwS2dISXhzb0h2?=
 =?utf-8?B?VXN3ejc4ODlPYXVhZ2NnYkFVWHh0Z1QzcFY0MnVEWHgvZFlhM0V0TEplMXRK?=
 =?utf-8?B?WVI4WmI5b2hTM3J3UE82SkE0cTUva3RqR0krb3E2VGxRcm1Jd2dOOGlTbThl?=
 =?utf-8?B?TXZpMGpURzN5aEZoY3BPTkFkTHZyVzliLzh5dmpoZFNEUXlTOFcwcVdaQVVh?=
 =?utf-8?B?RnVBOW5PY2NFRmNKbnNkN2NPa3A2bnVYVlZHekJGNmdOaC9hN0xRa2wyV0J6?=
 =?utf-8?B?b2pJUmhnSU5zNjQ5c2JXM0NkcU1jYWVZUFRYaE80cjhRRk00U2JwVGpMaFY5?=
 =?utf-8?B?RFhZVW5tN08rTzJTMTl4SHpCc3Q1ZkRqWUZwcGd5aUQ4clp1MHVxTlVRUkRt?=
 =?utf-8?B?UzVTR3cvSGRRR0xjaGl6bnJWYXZSYWVLWEwvbGp4Q2NGVkVCbWY4cjVXYjdu?=
 =?utf-8?B?QVhCZWJuL0dsWmV4c1pVV0xYemlScGxoZDJpOHplbFk5M0FJUExWZUgvNE5X?=
 =?utf-8?B?SzdhYkIvaW5aZVdYSDUvbDcrT2VreEIvbFNNUElkNmYrSWI0RUxodnM3aElZ?=
 =?utf-8?B?Q2p4MDNMRk4vd0FJQU9TaC9vVGgydXZLNDNHSC9FUHJhYnB2VWVEa1NLZjMv?=
 =?utf-8?B?bHZsRHZOVHBEay9YUXpIQnZWeGhaanJkTkduU3dNelRTbGFuaWVNck9ndmxY?=
 =?utf-8?B?dTFWRW5QWWp3M1Y3S213UEJjZzZrTXA0UzFNL2lOY1pDYTQvM0ZLRWZ1c08r?=
 =?utf-8?B?Z2JHRHVJOEJKVit3OHJKMFZKTW5GRUJQYzBVVFZkR09ad2VyUlpBUDlQUW5S?=
 =?utf-8?B?RkY4MW1GMTlqcmR5aHpuSTRTamNyN1R6dzBFcml4NS8xMk5CU2NIcU9DTWdr?=
 =?utf-8?B?RWFxSzJLbStvbXIwdURzRnhnMytXcHpDTmpVekRVTDI1ZWRoNzdFd1lkditq?=
 =?utf-8?B?TjcxOU4yK2hDS0plcHA0UnQvZVNKZW5Qc1VBSWkwVTJoRVZlNks2Y1JDRXg3?=
 =?utf-8?B?bTNMZEVNcy9jVFlYNUpEdlhXNUpid3psbjVUYVQrdUh5RnNvT05HSnRNUUEv?=
 =?utf-8?B?ZGlLR1VKckJFRmIyT2JCdjJDbkxubXdINWlJd3gzZVhPbU41aktOZVNnWnNq?=
 =?utf-8?B?ZXhNV2JKM2YrVkkxb2tBTEE0NUF4Z29OK2QxcjBIdy9EN3UyL2RkcWhKdWRt?=
 =?utf-8?B?ZmZoRUpid2svbFpLb0NERGxFZzUwZ0lTNGQzYzFkNEJSd2FOUGwveFVDQTZR?=
 =?utf-8?B?TmY3NzhHTTJIU29lbUFuTjhsQXJHVVQ5a1NkVzdaQ2hRQysvK0l1N0ZvbHJ3?=
 =?utf-8?B?bDlZOEY3Qkw0TktZUzF3UHdLcWhjS0ZqbFRNTUVIbWQ4WC91QXpXb2JqWDUw?=
 =?utf-8?B?UG9SWCtNdWl1WjJpdUtTOTBkRTh6cFhYMzZtY1hqT3J2LytlT0VMUHNobnBE?=
 =?utf-8?B?NXFtZGV2S0pZVDdlcGtPZkFqZHlIY1lZb3dEUmw2NjdwNHZLWG56VG5nUDZ2?=
 =?utf-8?B?d2RmeGJ4NENGVGtRVE91aXE2OVN1MjM2ZVhHOFFTL3g4a1plWGR1TG1zdW9h?=
 =?utf-8?B?ekZEQmZvU2FZdG5rQ0h6VnN2WVhGNm9ZSXJEbWVNOTltNXQrbnkzMFd1b0t5?=
 =?utf-8?B?MG05ZVpDTG85QmV4dUN0dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44E976E338C80841856ED2414D692AA9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f86529b-5ad7-4cd3-093f-08d8f4345857
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 11:01:32.7683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G+C9BgCGa0raDSsXwmin/3yObBQVxkeePj1JF4qt/ddz6hxM2YiaYQOBsWBdlYKZVdz0W3N247GUc8gd8rRLY1wWQZ2DIIMsPRVBFjX8GIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5927
X-OriginatorOrg: citrix.com

SGkgYWxsLA0KDQpQTEVBU0UgTk9URSBUSEUgTU9ESUZJRUQgREFURS4NCg0KVGhlIHByb3Bvc2Vk
IGFnZW5kYSBpcyBpbiBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFkL2VkaXQvSzFmYjRH
clVGM2xIOXpRcklrbDgrSFRoLyBhbmQgeW91IGNhbiBlZGl0IHRvIGFkZCBpdGVtcy4gIEFsdGVy
bmF0aXZlbHksIHlvdSBjYW4gcmVwbHkgdG8gdGhpcyBtYWlsIGRpcmVjdGx5Lg0KDQpBZ2VuZGEg
aXRlbXMgYXBwcmVjaWF0ZWQgYSBmZXcgZGF5cyBiZWZvcmUgdGhlIGNhbGw6IHBsZWFzZSBwdXQg
eW91ciBuYW1lIGJlc2lkZXMgaXRlbXMgaWYgeW91IGVkaXQgdGhlIGRvY3VtZW50Lg0KDQpOb3Rl
IHRoZSBmb2xsb3dpbmcgYWRtaW5pc3RyYXRpdmUgY29udmVudGlvbnMgZm9yIHRoZSBjYWxsOg0K
KiBVbmxlc3MsIGFncmVlZCBpbiB0aGUgcGVydmlvdXMgbWVldGluZyBvdGhlcndpc2UsIHRoZSBj
YWxsIGlzIG9uIHRoZSAxc3QgVGh1cnNkYXkgb2YgZWFjaCBtb250aCBhdCAxNjAwIEJyaXRpc2gg
VGltZSAoZWl0aGVyIEdNVCBvciBCU1QpDQoqIEkgdXN1YWxseSBzZW5kIG91dCBhIG1lZXRpbmcg
cmVtaW5kZXIgYSBmZXcgZGF5cyBiZWZvcmUgd2l0aCBhIHByb3Zpc2lvbmFsIGFnZW5kYQ0KDQoq
IFRvIGFsbG93IHRpbWUgdG8gc3dpdGNoIGJldHdlZW4gbWVldGluZ3MsIHdlJ2xsIHBsYW4gb24g
c3RhcnRpbmcgdGhlIGFnZW5kYSBhdCAxNjowNSBzaGFycC4gIEFpbSB0byBqb2luIGJ5IDE2OjAz
IGlmIHBvc3NpYmxlIHRvIGFsbG9jYXRlIHRpbWUgdG8gc29ydCBvdXQgdGVjaG5pY2FsIGRpZmZp
Y3VsdGllcyAmYw0KDQoqIElmIHlvdSB3YW50IHRvIGJlIENDJ2VkIHBsZWFzZSBhZGQgb3IgcmVt
b3ZlIHlvdXJzZWxmIGZyb20gdGhlIHNpZ24tdXAtc2hlZXQgYXQgaHR0cHM6Ly9jcnlwdHBhZC5m
ci9wYWQvIy8yL3BhZC9lZGl0L0Q5dkd6aWhQeHhBT2U2UkZQejBzUkNmKy8NCg0KQmVzdCBSZWdh
cmRzDQpHZW9yZ2UNCg0KDQoNCj09IERpYWwtaW4gSW5mb3JtYXRpb24gPT0NCiMjIE1lZXRpbmcg
dGltZQ0KDQoxNTowMCAtIDE2OjAwIFVUQw0KRnVydGhlciBJbnRlcm5hdGlvbmFsIG1lZXRpbmcg
dGltZXM6IGh0dHBzOi8vd3d3LnRpbWVhbmRkYXRlLmNvbS93b3JsZGNsb2NrL21lZXRpbmdkZXRh
aWxzLmh0bWw/eWVhcj0yMDIxJm1vbnRoPTA0JmRheT04JmhvdXI9MTUmbWluPTAmc2VjPTAmcDE9
MTIzNCZwMj0zNyZwMz0yMjQmcDQ9MTc5DQoNCg0KIyMgRGlhbCBpbiBkZXRhaWxzDQpXZWI6IGh0
dHBzOi8vbWVldC5qaXQuc2kvWGVuUHJvamVjdENvbW11bml0eUNhbGwNCg0KRGlhbC1pbiBpbmZv
IGFuZCBwaW4gY2FuIGJlIGZvdW5kIGhlcmU6DQoNCmh0dHBzOi8vbWVldC5qaXQuc2kvc3RhdGlj
L2RpYWxJbkluZm8uaHRtbD9yb29tPVhlblByb2plY3RDb21tdW5pdHlDYWxs

