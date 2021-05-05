Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B153373638
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 10:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122910.231875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCpO-0001Ec-Be; Wed, 05 May 2021 08:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122910.231875; Wed, 05 May 2021 08:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCpO-0001CG-80; Wed, 05 May 2021 08:24:18 +0000
Received: by outflank-mailman (input) for mailman id 122910;
 Wed, 05 May 2021 08:24:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EPH=KA=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1leCpM-0001CA-H6
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 08:24:16 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.40]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 945539bd-16c6-48d2-9239-eb6777d24de9;
 Wed, 05 May 2021 08:24:15 +0000 (UTC)
Received: from DB9PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:10:1d9::25)
 by AM9PR08MB6949.eurprd08.prod.outlook.com (2603:10a6:20b:410::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Wed, 5 May
 2021 08:24:13 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::fc) by DB9PR02CA0020.outlook.office365.com
 (2603:10a6:10:1d9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Wed, 5 May 2021 08:24:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 08:24:12 +0000
Received: ("Tessian outbound 6c4b4bc1cefb:v91");
 Wed, 05 May 2021 08:24:12 +0000
Received: from 808178e91026.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4EA06257-E2A8-4520-83C4-2FC3C7E8D7BB.1; 
 Wed, 05 May 2021 08:23:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 808178e91026.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 May 2021 08:23:57 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR0801MB1837.eurprd08.prod.outlook.com (2603:10a6:800:5a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Wed, 5 May
 2021 08:23:55 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4087.044; Wed, 5 May 2021
 08:23:54 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0022.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:151::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Wed, 5 May 2021 08:23:52 +0000
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
X-Inumbo-ID: 945539bd-16c6-48d2-9239-eb6777d24de9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLj1KErLubGEIgEAZCiajMWTSDygZEm45i9MOc+y5ZM=;
 b=ObBqz8zsK5fUyo4JUb8P00AbVNfVt7JbFD3Nzyrptxywz23Z/UiLjo97a/o7yhnIjbG1wK0/WEPVX6e3X67xE/M8UCzFBrwN0AuuteVFHn48yWKZh2/CZ2epzBS2gSOQu7Nia+Oiy/SuTrSINBL5DKysAxlk71T0N/rCE9N3g5Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0a342d0a4d3ecca7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdmQPg9MKHC/UdmdyqG1V988jloFTh/Tyfum+DQ42wVbxiqq5eDWXDIVeYtwJ098hYwjCvvA+NVmWCISvvHw3Q/TpffG+bRO88HzlxdNe/POmyo6ImBjoVhYrZOzEy1LklNkMcnna/xrpJr7Xba+kBFYLALvmi8x5ln3X1MGFxvWEiM1uPXU2EV+zdaJuPb4W8neJ+/ixtQRXHc3dr+XZ5B98Z2t5pPXY96UxoiV4aGFYdbprPiT26RxkScvz3ITa1oEvU7L+bUJuLAfK2pnkfFTKqagApKBJZ4LCh4sKSpxG/iPbnfKJRcQhdQKBEfDlke7Q2fKbvAtjNG48W4uSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLj1KErLubGEIgEAZCiajMWTSDygZEm45i9MOc+y5ZM=;
 b=Ag40m6+E651rzRStrWG2WOYbxq6IuKbSNGrtMEfFZ54NYpeKtlk2uJX7aOVJwF+teVHNtiyIG9HBYMxXUB61845dQl2Pk6Q82v6MFdGZif5CnNiMQURM7FXcY+FA4kTaStQDcnp2onbVDzTSUoLExE3yIT1nXWGszA7w+D24RYH9l0NSoVLDkLIkHnopKeSFnnxMy4XR5mgYy1QcrpjiRIPI425UgEQyp5ljIxuIXDq6Ca42wrm2m0cTh2+jlVY80eoLw2E5sFWa1bP9pmK929KMeNeXAPdwgCA2NlBx11lc6fB74pehjHPaZPgWy3TngQz9nL5DsQJzvIIVpI3yFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLj1KErLubGEIgEAZCiajMWTSDygZEm45i9MOc+y5ZM=;
 b=ObBqz8zsK5fUyo4JUb8P00AbVNfVt7JbFD3Nzyrptxywz23Z/UiLjo97a/o7yhnIjbG1wK0/WEPVX6e3X67xE/M8UCzFBrwN0AuuteVFHn48yWKZh2/CZ2epzBS2gSOQu7Nia+Oiy/SuTrSINBL5DKysAxlk71T0N/rCE9N3g5Y=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v5 2/3] docs: hypercalls sphinx skeleton for generated
 html
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2105041527550.5018@sstabellini-ThinkPad-T480s>
Date: Wed, 5 May 2021 09:23:47 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A27C1DD-F549-4B0D-8027-FB3D3D697981@arm.com>
References: <20210504133145.767-1-luca.fancellu@arm.com>
 <20210504133145.767-3-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2105041527550.5018@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::9) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0bbde0b-8aa7-4613-f891-08d90f9f2a0c
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1837:|AM9PR08MB6949:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6949F183ABD1509B27246F3DE4599@AM9PR08MB6949.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JsMCKxEJRfWwB1/WGvzL5cq/ZOQJccXWby8JGAo1NMqChqMaO+EvjArv2YAOUcSZTp5eMWpkvigFFAC/W7zHFUCbQMan2PpEFTxTW9od5s+cMQbNd76nFEzqjJ2RLAbjwHT7T4f9/8P0IuJOyIo00+0P1XeGmTwr9wMbjzBJ+YrR+S2YaInnvtL7uN32hQnNErVelK0pPFhBIzMTjadhuYeBGnqeOZzmixUonZNn+QQAzBwc2BLA18Ze8LhuZzbSIka81n+TlRSrjIpQRyew2YXvz2cdqyAPy5Ip0k8rjjz12lSxmbVUdx8bapn6Jp+jz68rXE5tr3lMnDoMc/vA2Zg3+Cp/X+jNcqaawnZFR716PJ3wN4+WvE1KHdj0zTpDBCx50Xli/ax1h5F+8/t2uS2SfBZ7snV4wks+MT/yDRVZZxYKayRHqP8Y2BPH/fD4ZHiBy36d/7gvrd4q7qmEbVkWi6VdX8suTPgUo1DiPI/jyXHurw8fvcn561+lI44eRUbHWw4ElOKcxogshVA5XQt0l2qR+UPSwT0JqPkvdn4Nplv7YdvjJulXknwz5y5aKl0dj0pp75zKnOaCcvnuOn2wXouwlEKxQMpM1BVU1ZX3pBddtPTKc0N9d+Mr8ZkgVimwCaWm/mIOz5cmiRbjhRjM6+1SDSI0RgbhwHV3s9jXa1TJLDhORuDImIhYNN8a
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(396003)(366004)(376002)(136003)(346002)(8936002)(5660300002)(2906002)(33656002)(4326008)(186003)(956004)(2616005)(44832011)(52116002)(38350700002)(66556008)(66476007)(478600001)(6486002)(316002)(6666004)(26005)(6512007)(53546011)(36756003)(54906003)(16526019)(6916009)(8676002)(86362001)(38100700002)(6506007)(66946007)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?T3p4OEkxVVlqZjJUNlNYMUdrWXhVN0JCbXluNTJLVzV2Q0x0VnlYU2Y3WG9n?=
 =?utf-8?B?V1pkeUd3MzlDVDFncXlvK0N6cmhBMkVrYllXSDZ2WXI0dGdWREJRc1B0elZU?=
 =?utf-8?B?citobk1TelBhR1RVUTVOYWlIaU5oWEwwMVNMQ0tmbS9VWlcva0h4Mk8wbXFj?=
 =?utf-8?B?RXNaV1YzOFYxenhwV094RW1lMVc0bDdXMC9XK2tCTUEwUmZSVmdwTDh2c1d0?=
 =?utf-8?B?c2J4aTk3WEdmbEF4ZXZ0UE9GRFJmM1BDQXZOdWEzTHRLTDc0WTB2K3B6OEZ0?=
 =?utf-8?B?and1djNJZWd4clMwWXdDQ0NiemZNbzVFRUFjT0JJdXZDUm5RQUN2ZnhBZUM4?=
 =?utf-8?B?VnJ4dnR5U2xzZHN4UkNGSmY4dVJBeS9CTnJKcnYvM0hXWGlOeEZkYmNSQm9i?=
 =?utf-8?B?VS9SSDg5YlIrNU1qZjlxNE5HZEtUYnFsd3laL0RUV0FtUjg3b3IyTWdxWkMw?=
 =?utf-8?B?UVArSDRKSXN0eXFVTS81VW4xcWhUZm9VYzZlYy9UcUFrUWlNWGtQVmJTVGo4?=
 =?utf-8?B?WnkwWklldTRYUnZFTVB6T3pLNmg1N2UrakplYTFQZEVtWjlnTVpGVnROYit4?=
 =?utf-8?B?K0gyWGZZUVpjVUdGWTUyUFVkYVprVHhwcWZHOHZySnREd1ZPa2N1ZFVRTGJP?=
 =?utf-8?B?a0VLODR1QldiWlVrK0pxcnNpYzVTeFNXTnJLTHVGT3dVNlpNVnM5NExOZ1or?=
 =?utf-8?B?bUNENFM4RWRQUEFXRmc1ckVpRUQwR3JZSmVRWVByZ2swcTRyZjVEcnJFeWtN?=
 =?utf-8?B?aXAzMDRwdXZNYUhqR3dTUFU3ZDhHN2pyQ0xldVV4TmxLWFA1VEdrV282cHcy?=
 =?utf-8?B?WTBqb3YvRDNnTWY5SEFSSi96czFsK1BSOW9oeEw2MTk0QUVVRkhJeEZFYWdo?=
 =?utf-8?B?TlIrS1hkS1BqRERIWlVBaG5aWXJlWVR6MlVoWkZoWnhuMzBER25ucmpIZnlS?=
 =?utf-8?B?blhrS2pPRnpVUzRBaituUitMbHpjamFWcTFDY28wMVQ1U2ZiTEsvWUJtQzNC?=
 =?utf-8?B?cEdqeVArQVZJcFNVYkVvYU9yR0ZOcmUrbEdVWkdTODh1ejNzeTgrTW9tbC8r?=
 =?utf-8?B?NmNGSWswYndob21DNHlUYmZaVXRuejU3TXU0eUI1Y21nbXdzNjE4NFhOS0Z4?=
 =?utf-8?B?OXZZczVMVzZwNjdobjEydFRhNXY4YjVsUnF4RW0wa1czeHo0Tk5BTkVDQk96?=
 =?utf-8?B?Nm5nSEVBR25IS0RqUFN2b2tHQTNBcFlGZnpUZmgyUzRQZE9oZER5VnZraWNs?=
 =?utf-8?B?UTZBTHhVTWlhRlB4VVQ4ZmZRQ1lnK241bFNLS0h5SWloNWRxWXJYUUxJb3kw?=
 =?utf-8?B?akM1YTJGZERjb3djOHlRZUUzdkc5OGR1R2E3L0ZqRDZkU2hobm5vbTFyb3E3?=
 =?utf-8?B?WUt3MGRPWWNPa3J3TzVZUHdkZHJaWEVxQkRqTjF5dUFuMkc3T0FvRnlmTTZB?=
 =?utf-8?B?OVk4d2RaeGI3cSs5SGJrVlJUYVU5WHFnZUp3aHFNTFYrZWpTdU1td0o1VU82?=
 =?utf-8?B?NUYzMHdaYzhzNmZHQ3JDdEtSbnBLTlUrWlAxQmxNd2pFeS8wbGd3Y2k1Nnc5?=
 =?utf-8?B?WU1JaDNFVXM4c0JJWld4R2FRam03NUZwMkFSU2F0KzBheDlrazY0Z1ZXVkN5?=
 =?utf-8?B?SkxUc1hKcjIxZ1J5Z2xON0FrRkMwTEhDeU8rUmFQNlpkcWF6aFdGVUc1MWpI?=
 =?utf-8?B?MFNyWllibkoreFAwYmZvUWVNS2tPZFg0SXFEbW1JVVNvdFpVampYRFh4dnlO?=
 =?utf-8?Q?FREuj+f8gPkXOygg9hULyiigSokhcCD063Cev0x?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1837
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f1c9e332-ae0f-4716-8fdb-08d90f9f1e78
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EHyBEcwmr3F++waHpHEkoy5yC90nfBlOvxGQEUSGOQiVeLwhMZM9GC+d1UaK/7JFxFam7UDnM6qovPtbyTv9mrTOoU76oSTMNPIoDtO3zQyJ/UBHJ+FrWwQHQ850iVTYhfie5rvVYnRDLw5OHWbfjmcD5WUiuxH9tA8/mEyYslSQWwSVKzXER+8ddwQ+Bmqq6HxzFV6AwRTL0ndhN5mXqnxN4xRY+3rSmp2jU6IrdAl8ofWh0gFmQtIOmPq0x7gZ0BNDLj2a3bhFn4Y31FXTnGqxGe1hAyMLwq/NXbqP/Atb47/+NsSeVzba80UhB69UT2q3VuV8zKxmElGTWMPe4ig4uxfX0NF5FO1pzgV1CD8HstCSFNwsg8Oe89X1xOCwutFwYEbE30irHo/Z//8G3x8FQ+mkBWvo5oyW5y+KmvaXvOrjtBgO7EQ9NW/1wt/F7J02noJDmvQSDdoCoGjk+9iwmGWpJmHSN6qqIkyEUYhhj4UY5cnda0o443hPcIRzoxZM6Tfh4XkYypWGqiwvUe3KCnKoVP/6/N1thcRNewUIQd6Vve66rX55X+ENIp9IOYkUnro9USASIQRlG50+rX6OsSO6lcBgBpgL8BlzvA0OoZwNmdcGkOkG4DdRj+LdPgxbYkq7DeOdmUeORFzinA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39840400004)(346002)(136003)(376002)(396003)(36840700001)(46966006)(81166007)(186003)(6862004)(956004)(47076005)(356005)(16526019)(6666004)(316002)(53546011)(6506007)(36860700001)(5660300002)(2616005)(54906003)(6512007)(82310400003)(86362001)(336012)(478600001)(36756003)(26005)(33656002)(2906002)(8676002)(8936002)(44832011)(70586007)(70206006)(4326008)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 08:24:12.9285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0bbde0b-8aa7-4613-f891-08d90f9f2a0c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6949



> On 4 May 2021, at 23:30, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Tue, 4 May 2021, Luca Fancellu wrote:
>> Create a skeleton for the documentation about hypercalls
>=20
> Why is there a difference between the arm32, arm64 and x86_64 skeletons?
> Shouldn't just we have one? Or if we have to have three, why are they
> not identical?

Hi Stefano,

Thanks for your feedback, yes I can put the same sections for all the skele=
tons.
I=E2=80=99ll push soon the changes in a next patch

Cheers,
Luca

>=20
>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> .gitignore                             |  1 +
>> docs/Makefile                          |  4 ++++
>> docs/hypercall-interfaces/arm32.rst    |  4 ++++
>> docs/hypercall-interfaces/arm64.rst    | 32 ++++++++++++++++++++++++++
>> docs/hypercall-interfaces/index.rst.in |  7 ++++++
>> docs/hypercall-interfaces/x86_64.rst   |  4 ++++
>> docs/index.rst                         |  8 +++++++
>> 7 files changed, 60 insertions(+)
>> create mode 100644 docs/hypercall-interfaces/arm32.rst
>> create mode 100644 docs/hypercall-interfaces/arm64.rst
>> create mode 100644 docs/hypercall-interfaces/index.rst.in
>> create mode 100644 docs/hypercall-interfaces/x86_64.rst
>>=20
>> diff --git a/.gitignore b/.gitignore
>> index d271e0ce6a..a9aab120ae 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -64,6 +64,7 @@ docs/xen.doxyfile
>> docs/xen.doxyfile.tmp
>> docs/xen-doxygen/doxygen_include.h
>> docs/xen-doxygen/doxygen_include.h.tmp
>> +docs/hypercall-interfaces/index.rst
>> extras/mini-os*
>> install/*
>> stubdom/*-minios-config.mk
>> diff --git a/docs/Makefile b/docs/Makefile
>> index 2f784c36ce..b02c3dfb79 100644
>> --- a/docs/Makefile
>> +++ b/docs/Makefile
>> @@ -61,6 +61,9 @@ build: html txt pdf man-pages figs
>> sphinx-html: $(DOXY_DEPS) $(DOXY_LIST_SOURCES)
>> ifneq ($(SPHINXBUILD),no)
>> 	$(DOXYGEN) xen.doxyfile
>> +	@echo "Generating hypercall-interfaces/index.rst"
>> +	@sed -e "s,@XEN_TARGET_ARCH@,$(XEN_TARGET_ARCH),g" \
>> +		hypercall-interfaces/index.rst.in > hypercall-interfaces/index.rst
>> 	XEN_ROOT=3D$(realpath $(XEN_ROOT)) $(SPHINXBUILD) -b html . sphinx/html
>> else
>> 	@echo "Sphinx is not installed; skipping sphinx-html documentation."
>> @@ -108,6 +111,7 @@ clean: clean-man-pages
>> 	rm -f xen.doxyfile.tmp
>> 	rm -f xen-doxygen/doxygen_include.h
>> 	rm -f xen-doxygen/doxygen_include.h.tmp
>> +	rm -f hypercall-interfaces/index.rst
>>=20
>> .PHONY: distclean
>> distclean: clean
>> diff --git a/docs/hypercall-interfaces/arm32.rst b/docs/hypercall-interf=
aces/arm32.rst
>> new file mode 100644
>> index 0000000000..4e973fbbaf
>> --- /dev/null
>> +++ b/docs/hypercall-interfaces/arm32.rst
>> @@ -0,0 +1,4 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Hypercall Interfaces - arm32
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> diff --git a/docs/hypercall-interfaces/arm64.rst b/docs/hypercall-interf=
aces/arm64.rst
>> new file mode 100644
>> index 0000000000..5e701a2adc
>> --- /dev/null
>> +++ b/docs/hypercall-interfaces/arm64.rst
>> @@ -0,0 +1,32 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Hypercall Interfaces - arm64
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +
>> +Starting points
>> +---------------
>> +.. toctree::
>> +   :maxdepth: 2
>> +
>> +
>> +
>> +Functions
>> +---------
>> +
>> +
>> +Structs
>> +-------
>> +
>> +
>> +Enums and sets of #defines
>> +--------------------------
>> +
>> +
>> +Typedefs
>> +--------
>> +
>> +
>> +Enum values and individual #defines
>> +-----------------------------------
>> +
>> +
>> diff --git a/docs/hypercall-interfaces/index.rst.in b/docs/hypercall-int=
erfaces/index.rst.in
>> new file mode 100644
>> index 0000000000..e4dcc5db8d
>> --- /dev/null
>> +++ b/docs/hypercall-interfaces/index.rst.in
>> @@ -0,0 +1,7 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Hypercall Interfaces
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. toctree::
>> +   @XEN_TARGET_ARCH@
>> diff --git a/docs/hypercall-interfaces/x86_64.rst b/docs/hypercall-inter=
faces/x86_64.rst
>> new file mode 100644
>> index 0000000000..3ed70dff95
>> --- /dev/null
>> +++ b/docs/hypercall-interfaces/x86_64.rst
>> @@ -0,0 +1,4 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Hypercall Interfaces - x86_64
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> diff --git a/docs/index.rst b/docs/index.rst
>> index b75487a05d..52226a42d8 100644
>> --- a/docs/index.rst
>> +++ b/docs/index.rst
>> @@ -53,6 +53,14 @@ kind of development environment.
>>    hypervisor-guide/index
>>=20
>>=20
>> +Hypercall Interfaces documentation
>> +----------------------------------
>> +
>> +.. toctree::
>> +   :maxdepth: 2
>> +
>> +   hypercall-interfaces/index
>> +
>> Miscellanea
>> -----------
>>=20
>> --=20
>> 2.17.1
>>=20


