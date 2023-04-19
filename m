Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFE06E740C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 09:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523203.813036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp2Ij-0007mb-SO; Wed, 19 Apr 2023 07:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523203.813036; Wed, 19 Apr 2023 07:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp2Ij-0007jj-Oy; Wed, 19 Apr 2023 07:32:25 +0000
Received: by outflank-mailman (input) for mailman id 523203;
 Wed, 19 Apr 2023 07:32:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUCI=AK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pp2Ii-0007jd-EY
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 07:32:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7d00::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52930091-de84-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 09:32:22 +0200 (CEST)
Received: from DU2PR04CA0028.eurprd04.prod.outlook.com (2603:10a6:10:3b::33)
 by AS8PR08MB6583.eurprd08.prod.outlook.com (2603:10a6:20b:33f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 07:31:55 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::ba) by DU2PR04CA0028.outlook.office365.com
 (2603:10a6:10:3b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Wed, 19 Apr 2023 07:31:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 07:31:54 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Wed, 19 Apr 2023 07:31:54 +0000
Received: from eee6270813dc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C96D62AB-B61B-49B4-9463-F4971291F570.1; 
 Wed, 19 Apr 2023 07:31:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eee6270813dc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Apr 2023 07:31:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB10324.eurprd08.prod.outlook.com (2603:10a6:20b:5e7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 07:31:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 07:31:36 +0000
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
X-Inumbo-ID: 52930091-de84-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhW/DpWlQYOySUClXSe+IdtcoIJA9DmLjpE0ZxwRwNE=;
 b=r1VKvZxMjSj3KKvsuV7lJCr/khhWCq8AI5jvTETalmsZ7w4ekW7zD7WhPBADge3z0up6/U8aqlcXVpPFFWImSoz7LngDxbJjD7TLAe436pALBrKvSbOz/y37RelH60yPuqeyruC1RywReKcEz9rlGDUhs+BXjZCSqQRPhj+uj+8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6475b652457a3906
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOL79pecvbqJISECt2TKxSLd97MVFm5KxKfuysRYUnSmSoyy4TCOU5heCA+vt3XPDAvJLU8MZPwGw8c7w73mpBu07S43Zde6N1SncAgVnUcHAURu+L0HGObsBkLaBE44nO8z2lWJBxCoOytkmuCLgv9N6JxkHXfeJwTq1MTa/uRLfyMtJhsUI7loMdXPl1YGfRzcOW4aujd/t71mjGo5jL2tUDxI3THF/BvPAx1O6xw9hR5fr2XUctnoLxlW8mNmozFbuRWM+Ppqmh/zkfI9oyBfsvSxQHIj8V7HIccjhqBgW+wL34zGgyK0EmtBA1Npd4Q2VMJBCYKFv5OD3Vnb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhW/DpWlQYOySUClXSe+IdtcoIJA9DmLjpE0ZxwRwNE=;
 b=B4VcA2L0zeH4xnnB3yNTh5JxkrlWWVYWItWA1lrK4aoBpj4MsObM6rtk5dCaawXeSEKC9O++BCKWywR7D7kymO9hFxd6zU9tBBvfMRHGBASOlZ/mqcFAqAazaiSHYZTGg9KhVkn9rl2mLJEqMQ+ICwoY5Fwl8Yu4ufEdVsd06BhaGfIhj+O8/FeaZ12A7W01arT1UuO7ZbKooSJOleVwk4acPNzl3EWgb5fHfECo5y9OT4kT9Z0vgqTGTQKBMdXs07EZaFz6eU2zsLyQ43cujJfmCLPYSzVviWe2w9M8tkbw8a6wxVOnpeOMxW5oDbnBqOmxwkPYT0RgME5b1kJGvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhW/DpWlQYOySUClXSe+IdtcoIJA9DmLjpE0ZxwRwNE=;
 b=r1VKvZxMjSj3KKvsuV7lJCr/khhWCq8AI5jvTETalmsZ7w4ekW7zD7WhPBADge3z0up6/U8aqlcXVpPFFWImSoz7LngDxbJjD7TLAe436pALBrKvSbOz/y37RelH60yPuqeyruC1RywReKcEz9rlGDUhs+BXjZCSqQRPhj+uj+8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>,
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>, Community
 Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v5 00/12] SVE feature for arm guests
Thread-Topic: [PATCH v5 00/12] SVE feature for arm guests
Thread-Index: AQHZbSQqKlfgrZX3xkqta7+H+1gq3K8xFMoAgAAUHYCAAQ0QAIAAEaQA
Date: Wed, 19 Apr 2023 07:31:35 +0000
Message-ID: <C21BD176-AD46-4379-947F-4271D3EE05A1@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <08BE4F94-C4B5-4B05-AD92-61C5C5D24F39@arm.com>
 <bdb1b5e3-c3d9-1c39-f7f7-8f48157ba7b3@xen.org>
 <4cbaaf12-bd11-ca04-eed1-f8848290a692@suse.com>
In-Reply-To: <4cbaaf12-bd11-ca04-eed1-f8848290a692@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB10324:EE_|DBAEUR03FT048:EE_|AS8PR08MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 44af45ec-8ee0-4aa3-93b9-08db40a8268c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7Yl22+g3vZ3fvdiLBJHEg0Q0oMNxWRCcV+VZOYtpS7wsuza7AaOfCWyOdprvPUkrCf35YuSUwbZh6Hcg+XZLF6Q4yHciGp0VwQ/kXR2+LszkLwRucM/lM79uv7VOY7JQzc4OE0HdX4PuHVBnWIg/mt4a/naDk8YLlgqgo0fPJz0WH/ZrEFWowN+ff9p/gRlBbF8JU9G47jldbwbgUZomLSYVdgEjvvL5tEaeMQW1boFwRwcJ2x42Ie7hm4va9l9L1cEL/zChGNK5AEGVaT9BVVImjMJUqadIS/0ngVyzoXlfYLdIO9K8QfDQ+T0Yj9QRhKvISwGVMYEe1BE0yDqDbSR1UqCeA7uGK2j3TA6Hbq7wHVdOQU+DYtl14q3QKsC6MMznOVbFyafaWmx0Uc4PkwZs2ddEvAaUXKQ9hlIXrMX4UGOMQp3348jh5YX+QrSHzfocj+ZHiRagq6dIszCstH9QXVhw728K7LvLtdvIXTpfBS74VtgCCp4VaP8Y4K8YapZSBqUjU/TP+ofB7e0WB8weAtnf3sHmKCR9F0AHg5twQvtQttUT5A91FwtXto/aehnGblCiOhT9Eo94pVw78NIYWYBgA1ZetkFA6OfsMVWFP2iYKDRfjoJz5fGLXNTdXym95okYQOW2sqUsAZf16g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(38070700005)(2906002)(8676002)(8936002)(38100700002)(7416002)(5660300002)(36756003)(33656002)(86362001)(6486002)(71200400001)(6512007)(6506007)(54906003)(478600001)(2616005)(83380400001)(53546011)(66946007)(186003)(76116006)(91956017)(316002)(41300700001)(122000001)(66556008)(66476007)(64756008)(66446008)(6916009)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <42428FC86BEB154282AB2FC610EBD04F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10324
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc98c86d-d4e5-4782-b176-08db40a81ada
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CeV5b90Fy6DMd61QXl0C7vwvwAfeB4oMNGsoIyD4MbJsFmPUS+Fa/m9zRquJOR+866CWa62bfoXFXn8/EgnKOkefPm292sz+GnBfUcINjL6YgXKVMr7GBcM7s8AyUIV49rO4jEAnAP0BjwOXK9WYbe+JqtZfa/j9MBpJR0wApvO5+pdPaJtWUzaN6+awJfISjqsaH6hab4zAQ/I5REzLOR+7mwJG0fBqNsu+h/E7/nNdgZKNO3Hr08bJXDcy42wWusY398sg/QxAxIKu2n9lsGUIJIvxUtKPhjgSVALG+ddTaqmfojb0/0HgzoBuZzWggo7yGgUNDPSMjlD+TpkKV+wr4foxpDxHJ22Ks8s8fdSOOoEWGXszFCA0SJLqXOOzPTFZKcLMx01qEvAkGlQDcwORlgYhoYcYz46wAWF2RGuyidtiOcbUSGoMzWfVU4y3EBucDHCfhld3sGFZYNhNv5e675xaFqi/MxXYbNSzOukyexIR15N0zHN8a9+sXJmOng6UCFqEl9/1Lv1gLMHp1LPZu17sjnL3dBV1S7WQCnV3IpSCNtBFNu0O4Ty4zV2aB+rkDCgD9ZoRWkHTm4JjljysGrgiNChh3ZDavhazXQoK1RA0iJrPiMTDbqww6Zb7hG0FoontgOisQ6FyRMb+oJ0wo5EZ5O6FI0iz3sjjj9rQZgRsIAPw4MjerYhJuJeGmV9rjg26d6hCWMfNzY4dkA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199021)(46966006)(40470700004)(36840700001)(33656002)(36756003)(356005)(81166007)(82740400003)(82310400005)(2906002)(47076005)(36860700001)(83380400001)(336012)(2616005)(6862004)(8676002)(5660300002)(86362001)(8936002)(41300700001)(26005)(186003)(53546011)(6506007)(6512007)(316002)(4326008)(70586007)(70206006)(6486002)(40460700003)(40480700001)(54906003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 07:31:54.8331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44af45ec-8ee0-4aa3-93b9-08db40a8268c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6583

Hi Jan,

> On 19 Apr 2023, at 08:28, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 18.04.2023 16:25, Julien Grall wrote:
>> On 18/04/2023 14:13, Bertrand Marquis wrote:
>>> On this serie I would like to open a discussion on how to handle the ve=
ctor size
>>> and the corresponding command line / configuration / device tree parame=
ters.
>>>=20
>>> In general the user must either give a vector size it wants or has a so=
lution to
>>> just request the maximum supported size.
>>>=20
>>> In the current implementation if a size bigger than the supported one i=
s provided:
>>> - we silently disable SVE for dom0
>>> - we silently disable SVE for dom0less
>>> - we do not create a guest when done through tools
>>>=20
>>> This is not completely coherent and i think we should aim for a coheren=
t behaviour
>>> unless we have arguments for this status.
>>=20
>> +1.
>>=20
>>> Is there any good reason to silently disable for Dom0 and dom0less only=
 ?
>>>=20
>>> I see some possible solutions here:
>>>=20
>>> - modify parameter behaviour to use the supported size if parameter is =
bigger than
>>> it. This would at least keep SVE enabled if a VM depends on it and coul=
d simplify
>>> some of the handling by using 2048 to use the maximum supported size.
>>=20
>> My concern with this approach and the third one is the user may take=20
>> some time to realize the problem in the xl.cfg. So...
>>=20
>>>=20
>>> - coherently stop if the parameter value is not supported (including if=
 sve is
>>> not supported)
>>=20
>> ... this is my preferred approach because it would be clear that the=20
>> value passed to Xen is bogus.
>=20
> I did say earlier on that this comes with its own downside of preventing
> boot to complete for no real reason. It's all Arm code, so you're fine
> to ignore me, but in similar situations elsewhere (sorry, don't recall a
> concrete example off the top of my head) we've aimed to allow the system
> to boot, for the admin to then take corrective action if/as needed.

But a guest depending on the feature will just crash later when booting.
This is making the assumption that guests are all able to properly adapt
to different hardware possibilities.=20
This might be the case when you have a full Linux but if you consider an
embedded use case, if something is activated due to command line parameters
or configuration ones, it should not be expected that those are ignored I t=
hink.

There are definitely 2 different needs here, maybe we need to have somethin=
g
like a "strict" switch to allow both use cases ?

Bertrand


