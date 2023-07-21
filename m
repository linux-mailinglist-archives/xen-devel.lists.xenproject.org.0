Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC10E75C911
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 16:08:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567565.886801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMqnf-0007Ep-0G; Fri, 21 Jul 2023 14:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567565.886801; Fri, 21 Jul 2023 14:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMqne-0007C1-TA; Fri, 21 Jul 2023 14:08:06 +0000
Received: by outflank-mailman (input) for mailman id 567565;
 Fri, 21 Jul 2023 14:08:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=So7w=DH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qMqnd-0007Bv-EC
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 14:08:05 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffc09f3c-27cf-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 16:08:00 +0200 (CEST)
Received: from DB7PR05CA0072.eurprd05.prod.outlook.com (2603:10a6:10:2e::49)
 by PR3PR08MB5786.eurprd08.prod.outlook.com (2603:10a6:102:85::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 14:07:56 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::d) by DB7PR05CA0072.outlook.office365.com
 (2603:10a6:10:2e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Fri, 21 Jul 2023 14:07:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.28 via Frontend Transport; Fri, 21 Jul 2023 14:07:56 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145");
 Fri, 21 Jul 2023 14:07:56 +0000
Received: from d12412e26dec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E2086BE4-027C-4DBC-83B2-CB295A6596F9.1; 
 Fri, 21 Jul 2023 14:07:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d12412e26dec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Jul 2023 14:07:50 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB6577.eurprd08.prod.outlook.com (2603:10a6:20b:355::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 14:07:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 14:07:47 +0000
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
X-Inumbo-ID: ffc09f3c-27cf-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sx3dnexRw5NDd9Tu1cAgD+pc9Q6SBtS4JugeJb3CAA4=;
 b=5dvbqkqnFsgsxAQixI7puzMmPp6eoeegjO09+L4hoX9DHAQ3ntoJ/GpCna+WagwY3h/ixoodLyO3SYcoRa3romIlDYzmyOUZWqXkR/n2VwXO+zf3scLmTJMMEiYOoKHgrzlb+3dCVY9hzSOFs9Tj+ojuZxi2AY3R0hUFfmQp1ag=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4bb054820abf7023
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YD6806nosYnbLE6o5V5suJSaTDqBz1hSQEW1l06h0YVc3zmkSHku34PJHvc9sL2QcwL4ZCB0sATex6AMOzFL28Ic5RvrhBKSPo+K/bDGJbKs1q8Qd9fbBrvRwLm7uG0uOmzyqBRrSoWcnh6ObrZBxNbNDLpPLFY0vreisXfHjxX+RA41VAR3tgC4y510FvjR3JB9QP1VDBOgzVaziNBh93zpqOV04EdInXuRqu6X2mFyWouNwz0cICp83KKeau94hGgkW6dNSDi8ayw4JGZDMVYR1P7CVHe0phwjFwa9/uxSkIUIbGDydlT22ULJCmt3VGkbA1FkwWCxKuMA8pYhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sx3dnexRw5NDd9Tu1cAgD+pc9Q6SBtS4JugeJb3CAA4=;
 b=WVXmG9xoi+JB4DEn2ug2JppOYJNWLjqThMK6yKhHv0Nya0ZvogQhQf47BvdJVtePdkb7y7TKJwpR/hb4XBQ40KMpsmc880U7kwZI6/5WGU6ZtpD03jYnf2iIy+ZMQKP8/Qsn9gx6k3aDg0COvKFhAeR9FnGNLKOJzwPQap9+yi5aGfNerkBltjtx2MILmKlswWhEEn7GsNg7X2ehS8rhLMaxHdeFGAVI+Ge1QLu0+eTRLdZzAjz/1WBcCrX9K/0IzuCBeIphi9ke6dP90+KTpQcH4wUbsUWy/o8qny/juvZjBql6Mfrn+ObsYjluzXULf4dupt5tUiTUocq2E3DDmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sx3dnexRw5NDd9Tu1cAgD+pc9Q6SBtS4JugeJb3CAA4=;
 b=5dvbqkqnFsgsxAQixI7puzMmPp6eoeegjO09+L4hoX9DHAQ3ntoJ/GpCna+WagwY3h/ixoodLyO3SYcoRa3romIlDYzmyOUZWqXkR/n2VwXO+zf3scLmTJMMEiYOoKHgrzlb+3dCVY9hzSOFs9Tj+ojuZxi2AY3R0hUFfmQp1ag=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Thread-Topic: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Thread-Index:
 AQHZu6nFJdPelAC9nE2wzAZF/5qPkK/D6iMAgAACsoCAABzbgIAAHFKAgAALbgCAABCjAA==
Date: Fri, 21 Jul 2023 14:07:46 +0000
Message-ID: <8ABBDFFB-AE3C-4A8F-8AAA-F0C5EB99C2C3@arm.com>
References:
 <a44f74559f52d1fa90a3f77390e7d121c9cd848e.1689926422.git.bertrand.marquis@arm.com>
 <cb7b53bc-2440-8619-61ce-39c967b56eb7@suse.com>
 <DFD07AA0-E7E2-400B-8961-A646E5531DF7@arm.com>
 <6b24847c-5cd2-877a-bc72-16bb732e0ca2@suse.com>
 <C63A942A-AC5D-46CD-81B3-50B6376860E7@arm.com>
 <47ab1431-6a0b-6e74-92ec-8495c6bf8fbd@suse.com>
In-Reply-To: <47ab1431-6a0b-6e74-92ec-8495c6bf8fbd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM8PR08MB6577:EE_|DBAEUR03FT028:EE_|PR3PR08MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: 86168117-52df-4598-8eb7-08db89f3e1eb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 B2IwZ5Kl+jpVEGxv54Z4JLdzGW9jfbK5HcPR5vHxORcgacZoVLiuTSiWeWIbwxMXFEMPWMIcNIwaH8ZqpfMxNz41SwHc5CVxiIpjmx/mD1GfL+2n5CoH/X8a4lspDDrk2aOixuSaLasDNso1aNH8XX3LpWAzOfkstjKHkh6F/UmhDl4/pCPRhGxNWsPoJc4Bui4KvghHEFvBphzTT5aREUBGBociEpTOS7+8oJh6BrL6BiTLGPyxsYtC+KTz0Wk+Dvsi6ibAHUQEx5l3pB2w3tbFL7jOy2CBjl3aglSpfrG6pBUP3PdeL9yNickhMU6x8UVrMIB7DaKo9AAOsJ19IYgeisSK9u/dp7AFqBevVZ3+iaaJkU0QkZGaFE81FvfFDHLwjzwDfmRUonQre0Xd2UT+C6x5v83olMplhjMu0ar587BXFgsoqOyVVgnONK+Z9vYISgXwgMQhxSQwoE/ZaWVk+y8PJ5xgOSiEmg/E5afSZvlTeWQaxsFanbLlx11MY8qPWyVct9u+fMessjcmH7aVOe/bi4qDttiuaxhDnvHZ2Gz8pQjMIbyq0Q03A/qcxpOeK8ELXTLR+hC3aIoKRNwIzuS7wPzSj09Qfjj+I/iquj/uk0Qf29AVhM17FK5op5GxMx7Bg/7c7d5fGx/SlxmDbctq5yQ1L331ITSz/ACWhUlLVz20o+zAzb+MumAH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199021)(6512007)(122000001)(38100700002)(83380400001)(6506007)(53546011)(186003)(2616005)(26005)(2906002)(33656002)(8676002)(8936002)(5660300002)(36756003)(71200400001)(6486002)(478600001)(38070700005)(4326008)(66446008)(66476007)(66556008)(64756008)(41300700001)(316002)(66946007)(54906003)(76116006)(91956017)(6916009)(86362001)(76704002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0D41B5E83E0C2D4AA3DC234E8FCB1216@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6577
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	651c4c3d-86c9-4e7b-1d8e-08db89f3dc5c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uz67tALfyDObGETzFkBvKL7T6Fol+WndbNyTj8DsTX7ZWHaZ3/4R1gq4fl7/4emZ4kujTIfK4yk1h6ewBxiUWbrbbWn8kVn5U+MMCQ9jtXA+QWaFaumfcWL2GWhjkIKffewR6kgj8+HhHapNpngRqj8nxoipCAWRXe/d3oMrAVFXTrJc9k8SCIXov1QCjaB9BWsvQ6G6RwTP98d4dpjlnAwNQlHQ4pDyclbMVy96SV/OhugOC+lRw6q0srhcvHM51UD72k41a/Jg5Ai3XLiD1zrgzhBSEBofO61v7Cl+tTdrFzp5v6UO37YKbZGvhe5COcIf03DGMc4xQ9FvqUoADgt41Pcqcw7aCrT05vICVyjcqiF/0RNac24cP2jeIPtXOxewsThiUrecZH0Ln3Xm/3X4m0iEm9IVWyEkYcWGZU1SH+7zgLfyARgD4e4SA+UAaetX4n3Nhd+XG4h9/jKEfm8Ocg0euW2iA8NA+g/XDNV1od37RFKGxWDBJzQVMXSashUCxv7uWTSnGvu+RFMsMPkz7JV52LbVlKjKGhi0iNxJp6g4x9kKrQ6ZTiIekzCRRLzOjZgCRTc6DWUuF0UPbvG8l7lDxoOn6W2GpHueY9/A6hv5J7TqJk+FK7DzzMLFhEMlQ3i4AOnAJ1e6+KGZVVHU3qGqKtunGENhdTvCPIpEONOU4VxZsZyjVPwkKynF/VcpDDS2KUJc4Ldp5iEdrfPuSQkewnhV6pZbmIsTYcgffn/tP5UwJmGNHzRH5LIjIwgue3cXhLShqIAvSxjROA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(136003)(82310400008)(451199021)(46966006)(36840700001)(40470700004)(6486002)(6512007)(478600001)(54906003)(336012)(53546011)(186003)(6506007)(26005)(2906002)(70586007)(41300700001)(2616005)(4326008)(316002)(6862004)(5660300002)(70206006)(8936002)(8676002)(82740400003)(356005)(81166007)(33656002)(36756003)(86362001)(40460700003)(36860700001)(83380400001)(47076005)(40480700001)(76704002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 14:07:56.3270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86168117-52df-4598-8eb7-08db89f3e1eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5786

Hi Jan,

> On 21 Jul 2023, at 15:08, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 21.07.2023 14:27, Bertrand Marquis wrote:
>> Hi Jan,
>>=20
>>> On 21 Jul 2023, at 12:45, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 21.07.2023 11:02, Bertrand Marquis wrote:
>>>>> On 21 Jul 2023, at 10:52, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 21.07.2023 10:02, Bertrand Marquis wrote:
>>>>>> --- a/xen/arch/arm/tee/Kconfig
>>>>>> +++ b/xen/arch/arm/tee/Kconfig
>>>>>> @@ -1,7 +1,17 @@
>>>>>> +menu "TEE mediators"
>>>>>> + visible if UNSUPPORTED
>>>>>=20
>>>>> With this ...
>>>>>=20
>>>>>> +config TEE
>>>>>> + bool
>>>>>> + default n
>>>>>> + help
>>>>>> +  This option enables generic TEE mediators support. It allows gues=
ts
>>>>>> +  to access real TEE via one of TEE mediators implemented in XEN.
>>>>>> +
>>>>>> config OPTEE
>>>>>> - bool "Enable OP-TEE mediator"
>>>>>> + bool "Enable OP-TEE mediator (UNSUPPORTED)" if UNSUPPORTED
>>>>>=20
>>>>> ... you shouldn't need the "if" here, and ...
>>>>>=20
>>>>>> default n
>>>>>> - depends on TEE
>>>>>> + select TEE
>>>>>> help
>>>>>> Enable the OP-TEE mediator. It allows guests to access
>>>>>> OP-TEE running on your platform. This requires
>>>>>> @@ -13,9 +23,13 @@ config FFA
>>>>>> bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
>>>>>=20
>>>>> ... you could drop the one here. I think.
>>>>=20
>>>> visible if is only for the GUI/ncurse display but the if is required
>>>> to make sure that a .config file cannot set CONFIG_TEE or
>>>> CONFIG_FFA if. UNSUPPORTED is not selected.
>>>=20
>>> Is what you describe "depends on"? "if" controls merely prompt
>>> visibility aiui.
>>=20
>> So you think that having  CONFIG_FFA without CONFIG_UNSUPPORTED
>> would be a valid configuration and the if is only here for the gui ?
>>=20
>> I tested that with the following procedure:
>> - use menuconfig, select UNSUPPORTED and FFA
>> - edit .config and disable UNSUPPORTED but keep FFA
>> - build
>> - CONFIG_FFA is removed from .config
>>=20
>> Now what puzzles me is that i did the same but removing the if UNSUPPORT=
ED
>> for TEE and FFA and i have exactly the same behaviour.
>>=20
>> So it seems that "if UNSUPPORTED" and visibility all behave in the same =
way
>> as depends on which i was not expecting.
>=20
> Hmm, maybe that's a bug in our variant of kconfig (we didn't sync
> for quite some time)?

It could be but if it is the case and we update we might end up with
people getting UNSUPPORTED features in where they would not
have been before (because the build is cleaning up .config).

>=20
>> So what should i keep or remove here ?
>=20
> My understanding so far was that "visibility" merely hides all prompts
> underneath (but then I use the command line version of the tool, not
> menuconfig), so it largely is shorthand for adding "if" to all enclosed
> prompts. Therefore I think all the "if UNSUPPORTED" are redundant and
> could be dropped. But then I'm also working from the understanding that
> "depends on" would behave somewhat differently ...

If that is ok with you I would rather keep them so that making one of them
SUPPORTED one day will not end up in wrongly making the other one
supported to. The visible if i added was more to "beautify" a bit when
unsupported is not selected so that we do not have an empty menu.

Cheers
Bertrand


>=20
> Jan



