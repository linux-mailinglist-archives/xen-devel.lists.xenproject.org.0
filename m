Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8328A622818
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 11:10:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440806.695002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osi2L-0002p5-59; Wed, 09 Nov 2022 10:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440806.695002; Wed, 09 Nov 2022 10:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osi2L-0002mE-1h; Wed, 09 Nov 2022 10:10:25 +0000
Received: by outflank-mailman (input) for mailman id 440806;
 Wed, 09 Nov 2022 10:10:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIzN=3J=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1osi2J-0002m8-Sz
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 10:10:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60054.outbound.protection.outlook.com [40.107.6.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8d2034c-6016-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 11:10:22 +0100 (CET)
Received: from AS8PR07CA0056.eurprd07.prod.outlook.com (2603:10a6:20b:459::25)
 by PAVPR08MB9747.eurprd08.prod.outlook.com (2603:10a6:102:31e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Wed, 9 Nov
 2022 10:10:19 +0000
Received: from AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::aa) by AS8PR07CA0056.outlook.office365.com
 (2603:10a6:20b:459::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12 via Frontend
 Transport; Wed, 9 Nov 2022 10:10:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT023.mail.protection.outlook.com (100.127.140.73) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 10:10:19 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Wed, 09 Nov 2022 10:10:19 +0000
Received: from f52282481c89.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F4651B1A-EF6D-4FDF-888E-8D086F2EC046.1; 
 Wed, 09 Nov 2022 10:10:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f52282481c89.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Nov 2022 10:10:13 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VI1PR08MB9959.eurprd08.prod.outlook.com (2603:10a6:800:1c1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Wed, 9 Nov
 2022 10:10:10 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%6]) with mapi id 15.20.5813.012; Wed, 9 Nov 2022
 10:10:10 +0000
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
X-Inumbo-ID: b8d2034c-6016-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kg8IFAVEfNfFCBG/bEU+zjizMh3chWlbwB24dhLh8ynufMIy1XJHoJLAoIumtwaTStr2omVwz5bV/NKMrTDn4Wh6y4l4MULyOKQJrB8efD+9ZA5D6G8tVc3ZpUxqRQ6I2sE6usYX1hcr4u54MTE7p2S8208M0x5kEcESsnelBuONfDpFt6UAC9hBIoboy9OBrtQ5kbKsSm6gLJwWTv6easJILbnbGEUxe/1345lMUVcmlJExAGxtcGaA0dO2DKTQ987I2FbuqlQBYXM4rQS3m49VtSTY720+cgpYOKZcIBUnLRE+B6ZI+XmESPHajUJ8iyhtjNoMaSi/9VH4wUzVjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7KOwHGezCjhItd6i0Hy/vun2FBA+HxEjTeZbTd+yUc=;
 b=Or2pRFfRnrLWGaIXla+tOouVOBQNfXu8JCBGg/RK5UrrsjvfocN0d09sD76sGZbROq+I0GIKInl3bvYQzbT8+XRnsIiX5PKTB3/LfW5wPLyjafueRNiZ3VXezvRviSYiD8azp4lDvsFAQ0c8o9r4wbNgMljQEgMvBU6fIpCMqbejrzSiUOJNKFsFM8QWV2ZBXBYSYYW2I6cRhjS0x6EKN6u2aYDSEeHm4y9W9lnXTZJwtB9TCAeRRDgLk5d2kX69Ddd90renFTYnkMjyHIgloxl4xo8oIJo9gF/IcT/WkRbn3TKSzhlebUiy0OxDt4a0h19FCBvjK66FEcUJryxZ6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7KOwHGezCjhItd6i0Hy/vun2FBA+HxEjTeZbTd+yUc=;
 b=YZfdI0bapwlMNk0bmUyYkk2+C80fSIY63efEAYsC9CpWFwZvP3PyegqM+0MEC+J0Utvk1lwPzCqB9PLN/s0qs8EjKDvxzs+2jg9Opjas8q38QOpAvSEbYz5m0ydCkQeS7x4ZvwNUvy2UbokqUVR3vQCzemUx2CIep5FXJ/myQ90=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gk1Ds5nUbpWQ5yiI417DXoHIiVaANzjZ2/ll0yB6ahlieemNPyNKODW6gE7Q+rWU6YDQ0GbeVGFg9RK845KltKYyO+t/DIVtJ49voRs+SyQ0HmCMk4IYZB6/qGq6j2Rm9xTkvQL9PhYkode/+tS9ZRqUzfp4snzFAOrwTo17jJ/3AAGerR/U/txJaP1Zciy7CfTzcSyZBL9p5N/yImJMNO8HC14314Gi9wku/4ysaCgxsUkpKtkBYEBq5MH0pfQBRoj5ueymmp8p0VPWUkjxjdEOB92oIZWrIuo44utar39Y1+QpRRO7zND9TpyxoWbxRMI2irFKOcNOYGo7hSEB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7KOwHGezCjhItd6i0Hy/vun2FBA+HxEjTeZbTd+yUc=;
 b=dHkF6Aie8b9aAPZqEwsLZ/Ot5tXR6M/zEb0s5zWnY3lDjcftCboGLi0oS1u+tLQok55Du11BV5aM1jg/iXz/v5C8WbVzJavQyhXg88BF4MQHzaTuSMsz3EzjSC/V2yDJL6ZWf9tni09tP1081/dUygk8k4WB8xCYhlk+Juw3IGJnaVswP5dJSkNLKs7SoTmHLWNNzXNx6ahUsnqaVtCsYeJ8cUyWbI6s4fffAARoD4ge9QAsItitwXlr38X3cecRi2gTnr1KWfTk3+WITUFMcIT4YN9BVQrrjrZYuHT6PpL+HlRt9oMFtQSfQ1hSnfeaF1NVB4xmoaI+Nl8qKd8hyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7KOwHGezCjhItd6i0Hy/vun2FBA+HxEjTeZbTd+yUc=;
 b=YZfdI0bapwlMNk0bmUyYkk2+C80fSIY63efEAYsC9CpWFwZvP3PyegqM+0MEC+J0Utvk1lwPzCqB9PLN/s0qs8EjKDvxzs+2jg9Opjas8q38QOpAvSEbYz5m0ydCkQeS7x4ZvwNUvy2UbokqUVR3vQCzemUx2CIep5FXJ/myQ90=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 5/6] xen/x86: move NUMA process nodes nodes code from
 x86 to common
Thread-Topic: [PATCH v7 5/6] xen/x86: move NUMA process nodes nodes code from
 x86 to common
Thread-Index: AQHY5EtSdgmFSeaU8UGG/Ef8aqU5eq41XS4AgAEIj3CAAA1igIAACvYA
Date: Wed, 9 Nov 2022 10:10:10 +0000
Message-ID:
 <PAXPR08MB7420D8AD3D912FC00F5A282E9E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221020061445.288839-1-wei.chen@arm.com>
 <20221020061445.288839-6-wei.chen@arm.com>
 <b957bbc9-20a1-fadc-5865-e4a6ff274a93@suse.com>
 <PAXPR08MB742052EC98548796B21998379E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <64dfe9e6-8d92-8be9-c987-28d507ac617f@suse.com>
In-Reply-To: <64dfe9e6-8d92-8be9-c987-28d507ac617f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F892AB311CF3BB47855219407928B622.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|VI1PR08MB9959:EE_|AM7EUR03FT023:EE_|PAVPR08MB9747:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e16487-6f58-4704-36a2-08dac23a9b29
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8xyATiqu6U9tR044CTcrDe6swQxXUsvED4k+iM+711eK0NQEjY6TDdbf6TbQghvKSnN0bGKbTSTiHDin5tVteicsaI9eJAJNMPef4OmNlD5Y2JZShYte08Vd2If+Ug0qAHhd8NhIL0718/wcWokNY7wH1VzE4GDtGZCWgzg0tMsFrLJURfxgZ7iWJLRx0Xd+qKReCHCItnfplewnjTWwWdk7kO1d0kaUfonANsPZAgFZ/pJ0gtFZbH1ojhkJrZBCkHVnqsX0u6vD2K/y8UUgrdxZNZw9/xQYhREruya3Plk17t2t25wOx9wxJbHcIitdC7SjG/qLi6Ghyhb+BrIYnDa18mtmASaeRQJXpnENKV9k7mh+KMs/oO1kyzZH/pqClM1feV9fT3JiI691rpw6pD1itaJ1FQv+YH2SOtpDPFNM0JHptR91Ogr1agdbX9WTuXWMTCwp8cRHGSfe6/JGYHVhMd3YvSG2ESGqcW4nvMvNNKC+IlaiBVsy+H8QBP1GnuZE/lw5AfsoIk99HQLEZLJgAM9tXuO73J8oI7wff5S8CX0OsiBaGmLFeyb0NHh1MaaoMzoFHRF/FktueujLtRXMqcDqQZFy1HDyH3CTngKnZUlZRGlfWH6FSYMcFi4fEXqqcLX38RSjtSobY6vbDuexw6aKe5XC4cdryFy0zivu6JhRsDlVld1FeoS1pcgrr2KQujvoQ/lVJ9Cc5yLTJ8M7ZhuCnPb/ZuetdYpCwJuppxEUfMDKRTgUnZ5Dws5u/ErQhdOCgL6zZVvW/qV2wQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199015)(38100700002)(66946007)(8676002)(33656002)(122000001)(86362001)(478600001)(41300700001)(38070700005)(83380400001)(66476007)(186003)(26005)(7696005)(66556008)(9686003)(52536014)(6506007)(4326008)(76116006)(316002)(5660300002)(66446008)(6916009)(2906002)(54906003)(53546011)(64756008)(55016003)(71200400001)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9959
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	85ca0c80-36d7-47ef-6af0-08dac23a95c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TUnnBMaxpasvpqkbSAb1BAGJ0pEkwqZthT5ABJj+/dIU9A+1PsoY+mRq5gqRSSZnTNhuwhSECWgfzrzpXZDR3ayB2bPb+rTuOYuYJtcpce9/jEwG1FPfgnWOgT5oFuCNcQrecYHfaO0csurpS0qmeImQqcVuSsuSoCUoLWH6RfxbZjp7YXEFYu6YpR8tmf05s6N8Cl3A5rN96I6NQBxMfLqWERYkyN0feScXHG8mYVwDdaYunCd3FYU/Kt7iPd8gxosvhHMoqRiVWTq88wbEeL9oGgbR3aUP15+ng3HkCVngZ6MrZvusLAjZdYL1rzX+j/R7D2CrzbVJ/dq6ADeQovavDUflMhC4SJ/4NSSyf9bcNjVvc7iJg2Mk62/R3M60NbzIHoangHN5Bb7A9GxxVYnP++Vt7E1qtkX5wvhXO7BkzrWRBm4l5sEgmhPmKEVpw2USN5nj6BOgqMiKbj0v4ehj50h36o/b1uvL3hp0qq4WYUFK5rdjKkkoA+dW8lnOAC6yLs2L8Ifp/nFA7EdjI2pb4CypcMzAZptERU5pnpPWigO9yNW6K2Y5/PDdDtvcoI14BZRP7kyDDjDD3pXWiUMpOG1iE0tp6C7b78WMWvK0q0iGBI38EAmQqfDgmmN3vm4GNlOXqT8j1deZO1W7er+ZY3nWZv4hdI+oovOpmrEqKzXa34oBv72LBJWfEwc/jiyDMcqUI1QPtOU2QWbnVclRc8B7hlbYbZeNCPjh98k9RjZRxymHtxsSLgM9PhHUCZlu/lDnNjglvG4MRwSzaA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(2906002)(478600001)(36860700001)(8936002)(6506007)(7696005)(356005)(81166007)(82740400003)(83380400001)(47076005)(54906003)(316002)(82310400005)(26005)(4326008)(55016003)(5660300002)(8676002)(40460700003)(86362001)(6862004)(9686003)(336012)(52536014)(53546011)(70586007)(186003)(41300700001)(70206006)(40480700001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 10:10:19.2938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e16487-6f58-4704-36a2-08dac23a9b29
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9747

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDEx5pyIOeaXpSAxNzozMA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9y
Z2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjcgNS82XSB4ZW4veDg2OiBtb3ZlIE5VTUEgcHJvY2VzcyBub2RlcyBub2RlcyBjb2RlDQo+
IGZyb20geDg2IHRvIGNvbW1vbg0KPiANCj4gT24gMDkuMTEuMjAyMiAwOTo1MSwgV2VpIENoZW4g
d3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogMjAyMuW5tDEx5pyIOeaXpSAw
OjU1DQo+ID4+DQo+ID4+PiBAQCAtMzQxLDE1OSArMjQ3LDE0IEBAIGFjcGlfbnVtYV9tZW1vcnlf
YWZmaW5pdHlfaW5pdChjb25zdCBzdHJ1Y3QNCj4gPj4gYWNwaV9zcmF0X21lbV9hZmZpbml0eSAq
bWEpDQo+ID4+PiAgCQlweG0gJj0gMHhmZjsNCj4gPj4+ICAJbm9kZSA9IHNldHVwX25vZGUocHht
KTsNCj4gPj4+ICAJaWYgKG5vZGUgPT0gTlVNQV9OT19OT0RFKSB7DQo+ID4+PiAtCQliYWRfc3Jh
dCgpOw0KPiA+Pj4gKwkJbnVtYV9md19iYWQoKTsNCj4gPj4+ICAJCXJldHVybjsNCj4gPj4+IC0J
CQkJfQ0KPiA+Pj4gLQkJfSB3aGlsZSAoZm91bmQgJiYgc3RhcnQgPCBlbmQpOw0KPiA+Pj4gLQ0K
PiA+Pj4gLQkJaWYgKHN0YXJ0IDwgZW5kKSB7DQo+ID4+PiAtCQkJcHJpbnRrKEtFUk5fRVJSICJO
VU1BOiBObyBOT0RFIGZvciBSQU0gcmFuZ2U6ICINCj4gPj4+IC0JCQkJIlslIlBSSXBhZGRyIiwg
JSJQUklwYWRkciJdXG4iLCBzdGFydCwgZW5kIC0gMSk7DQo+ID4+PiAtCQkJcmV0dXJuIDA7DQo+
ID4+PiAtCQl9DQo+ID4+PiAtCX0NCj4gPj4+IC0JcmV0dXJuIDE7DQo+ID4+PiArCW51bWFfZndf
bmlkX25hbWUgPSAiUFhNIjsNCj4gPj4NCj4gPj4gLi4uIHRoaXMgdG8gYmUgaGFwcGVuaW5nIHRv
byBsYXRlLiBOb3QgYmVjYXVzZSBJIGNhbiBzZWUgYSB3YXkgZm9yDQo+IGN1cnJlbnQNCj4gPj4g
Y29kZSB0byB1c2UgdGhlIHZhcmlhYmxlIGVhcmxpZXIsIGJ1dCBiZWNhdXNlIG9mIHRoZSByaXNr
IG9mIGZ1dHVyZQ0KPiBjb2RlDQo+ID4+IHBvdGVudGlhbGx5IGRvaW5nIHNvLiBBZmFpY3Mgc3Jh
dF9wYXJzZV9yZWdpb25zKCkgaXMgY2FsbGVkIHF1aXRlIGEgYml0DQo+ID4+IGVhcmxpZXIsIHNv
IHBlcmhhcHMgdGhlIGZpZWxkIHNob3VsZCAoYWxzbz8pIGJlIHNldCB0aGVyZSwgcHJlc3VtYWJs
eQ0KPiA+PiBhZnRlciBhY3BpX3RhYmxlX3BhcnNlKCkgaGFzIHN1Y2NlZWRlZC4gSSd2ZSBpbmNs
dWRlZCAiKGFsc28/KSIgYmVjYXVzZQ0KPiBJDQo+ID4+IHRoaW5rIHRvIGJlIG9uIHRoZSBzYWZl
IHNpZGUgdGhlIHNldHRpbmcgaGVyZSBtYXkgd2FudCBrZWVwaW5nLCBhbGJlaXQNCj4gPj4gcGVy
aGFwcyBtb3ZpbmcgdXAgaW4gdGhlIGZ1bmN0aW9uLg0KPiA+Pg0KPiA+DQo+ID4gV2hlbiBJIHdh
cyBjb21wb3NpbmcgdGhpcyBwYXRjaCwgSSBhbHNvIHRob3VnaHQgY3VycmVudCBwbGFjZSB0byBj
YWxsDQo+IHRoaXMNCj4gPiAiUFhNIiBzZXR0aW5nIHdvdWxkIGJlIGEgbGl0dGxlIGxhdGUuIEJ1
dCBzaW5jZSB0aGVyZSBpcyBvbmx5IG9uZQ0KPiBmdW5jdGlvbg0KPiA+IHRoYXQgdXNlcyB0aGlz
IHByZWZpeCByaWdodCBub3csIEkgdGhvdWdodCBpdCB3YXMgYWNjZXB0YWJsZSBhdCB0aGUgdGlt
ZS4NCj4gPiBCdXQgb2J2aW91c2x5IHlvdXIgY29uY2VybnMgbWFrZSBzZW5zZSwgSSB3aWxsIG1v
dmUgdGhpcyBjYWxsIHRvDQo+ID4gc3JhdF9wYXJzZV9yZWdpb25zIGFmdGVyIGFjcGlfdGFibGVf
cGFyc2UgaGFzIGJlZW4gZG9uZSBzdWNjZXNzZnVsbHkuDQo+IA0KPiBBcyBzYWlkIC0gcGVyaGFw
cyBub3QgbW92ZSwgYnV0IGNvcHkuIFRoZXJlIGlzIGFuIChleHRyZW1lbHkgdW5saWtlbHkpDQo+
IGNhc2UNCj4gd2hlcmUgc3JhdF9wYXJzZV9yZWdpb25zKCkgd291bGQgbm90IGJlIGNhbGxlZCBh
dCBhbGwuDQo+IA0KDQpHb3QgaXQsIHVuZGVyc3RhbmQgbm93Lg0KDQpDaGVlcnMsDQpXZWkgQ2hl
bg0KDQo+IEphbg0K

