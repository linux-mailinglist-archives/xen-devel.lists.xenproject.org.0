Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F605584333
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 17:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376935.609994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH5ac-0000zD-AR; Thu, 28 Jul 2022 15:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376935.609994; Thu, 28 Jul 2022 15:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH5ac-0000xA-71; Thu, 28 Jul 2022 15:38:18 +0000
Received: by outflank-mailman (input) for mailman id 376935;
 Thu, 28 Jul 2022 15:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9qS0=YB=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oH5ab-0000ta-37
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 15:38:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b6aa726-0e8b-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 17:38:15 +0200 (CEST)
Received: from AS9PR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::17) by AM0PR08MB3940.eurprd08.prod.outlook.com
 (2603:10a6:208:124::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 15:38:03 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::60) by AS9PR01CA0009.outlook.office365.com
 (2603:10a6:20b:540::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Thu, 28 Jul 2022 15:38:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Thu, 28 Jul 2022 15:38:03 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Thu, 28 Jul 2022 15:38:02 +0000
Received: from adfd7411e47c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A49613F-5FEA-4337-A960-422E9036FBB4.1; 
 Thu, 28 Jul 2022 15:37:50 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id adfd7411e47c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Jul 2022 15:37:50 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com (2603:10a6:20b:41f::23)
 by DBBPR08MB6124.eurprd08.prod.outlook.com (2603:10a6:10:202::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 15:37:48 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::e582:2499:8676:9dff]) by AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::e582:2499:8676:9dff%7]) with mapi id 15.20.5482.010; Thu, 28 Jul 2022
 15:37:47 +0000
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
X-Inumbo-ID: 4b6aa726-0e8b-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ElMhYn4mWNtF3SB6IaPLu9MN9yFvJVOrOxx1r/ZJNu4Fwr9CXXxonywp6qTHMyUQyvUtnTNrj5Vmizc2XAKKj64yAkHg1J0K3CyxD+QSgt2ddlHT1Zly98VZpzOpWrVnIPoNexG6XgoYeUVXVHNnnkaICgA1Pzqkgg/IB/E7z5TLTEAYbkAcE3TlgIpds0BguHiQ07ox1WpGRQGYeyMkcSqUNxOfQJbJUlLfGrfjfvkGEp0+4bS6bVKyPi0a+Wew/GHcn8G4aZ682oUjdZE4rvTvNeYydEfabC5B7+D6l2H1bPjxkPoqQU/yy61fjNstlEXHc58UPhRBVL/u4nb/dA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUSvrrqj1h4rtA4Pq/sp6Cnh8ley9aSPxp0ZG0cWosk=;
 b=Wey519HkBG5pujsqc8Qt0ffIpoqZaUtu+w1iK+SHYOC3gZhWsncsStgxnCE+HaeTWKkh6f0E9j7rm6xa117NGFIXNuYPO4c4DSwG5saSxlPvGPupc14CgLiCHpYRE5YVYuMQWY5hdyw9Ke3EC41bEx46qz3gBVecc5P28Aaw5UXjH2D9LERE5OZWTTZ6kHTJkv19cv34FK1WGOn8ln+en1rETLWvisgqbhGGPaZIhchBpjjFPGvtW9/olxy/P/RKWRC8521evMcUWjF/rt7lnP6qHsxPW45HqXaFYBbhNu+N5GE2g5fDlfsGYTmX6jqnyloa2V1+jxzWphzIPZo1bg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUSvrrqj1h4rtA4Pq/sp6Cnh8ley9aSPxp0ZG0cWosk=;
 b=pq2tnD6pn4HmDKUoxGysTt2xLftln8n7GLVjt9mBWrD74mh1lsvMYntyIdbsM6gZtZx3kRUAafxeZUiQKee3Dbk5hh6LPjfhyujLNKR7BVf99mb2YJqlfqnVYMz1pRox81RI7Iz47xQkvgBhM/MGTcC+and62GifEOC8z0CpvI8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 933ab0fa02bf032a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8w10Ke/oPWpifRh5VgKZAMqKBHGhSBsxJOiDoh4f5sKZ3Bs/1bZUK/rYtUf84uHCW7L6KkdZIIubc0NkuyUUktXLq/8kuA4+Ow+mb7TliF4JqKkhTqDuIJF5gH8AcC/G5aeggnoB0ep1RyzRZ8w/FlsX771rQur90ev2MNbq2JAqP/eKE/CGsZL41/WZxaRl9S6RqlhCldTflfRomxVV8r+BfGhGsXx1AjQeDdOXhe1yy5ldvDCzVChbAtn49ZXVIWuYGYwq4JHjIi71fzhAwAcoHQjTq4+Ea8PwJYUemKuiUJeMjTo5dVyDA3aJcOrg84WAReWBEaJAioTVFMrZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUSvrrqj1h4rtA4Pq/sp6Cnh8ley9aSPxp0ZG0cWosk=;
 b=etcNy3al4/GhcmyGeHlo3P/4hxb6XG6jApO3NrnwsVh1Sb6T/Ma+1nk3tZ9Xr1C5IGMaEncblVwUcGLHX4/E/immRAeFNTqr/q8y9+EKpclyYyZ2Eq8zX8ryrsKURPka9GPitrMkP0JuIOGjIalvxv5y8zCYnzVNoJQHyePHO7j0tqs0uFAYKDrUwvzeF4VxKTNpH33Iem1Ls5/qsdm/FC5IMEaKX9rmXREZPUsNkKd9uo8J252VlNK5H+fn0ewkt7hy+U00CoMbwKt8pxURD9ArxolnbU5o0Wp4P0mYVc1n2DLZZqN4+2xakcVRNUpF9+gjJEgJlVHmf8/HsVZaLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUSvrrqj1h4rtA4Pq/sp6Cnh8ley9aSPxp0ZG0cWosk=;
 b=pq2tnD6pn4HmDKUoxGysTt2xLftln8n7GLVjt9mBWrD74mh1lsvMYntyIdbsM6gZtZx3kRUAafxeZUiQKee3Dbk5hh6LPjfhyujLNKR7BVf99mb2YJqlfqnVYMz1pRox81RI7Iz47xQkvgBhM/MGTcC+and62GifEOC8z0CpvI8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
	<jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Topic: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Index:
 AQHYhkXaSSR0QDc2DUiowhnmyNd/Sq1bgqiAgB3xuACAAai8gIAA1/CAgAA2U4CAAAT8AIAABuwAgAAKeYCAAAnjAIAAC4AAgAAEsgCACtZcgIAAFXWAgAGspoCAAAsFgIAAI8AAgAf9PoCAAwMegA==
Date: Thu, 28 Jul 2022 15:37:47 +0000
Message-ID: <329C928A-92B2-43EB-8972-52DAEF5258EF@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
 <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
 <758779b3-ef39-aa95-15c9-9b84b952e80b@xen.org>
 <3b42f9ab-383c-694c-cef0-5d24531e556a@suse.com>
 <019c5cb4-7e6a-d822-3c02-e3199d499106@xen.org>
 <93E40C29-DD1E-4C9B-936B-45ACA69BBD66@arm.com>
 <d868fab2-c55a-7e2c-cd54-6dc3eedbbf26@xen.org>
 <BB3ECBA1-A028-44A0-A6BB-5D6BD009C095@arm.com>
 <ee0a62af-fa79-3699-7652-d976a8690995@xen.org>
 <99D4D342-5DF7-4F85-A311-4D03967D77DB@arm.com>
 <b98c14d6-d788-427f-3fe4-b36bc85aae59@xen.org>
 <E290A20A-D6C7-4154-A0A4-3FC91C479B25@arm.com>
 <c673e9df-02b6-4f90-aca9-dc2ad9d3f922@xen.org>
In-Reply-To: <c673e9df-02b6-4f90-aca9-dc2ad9d3f922@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0273724e-8976-43c5-6da1-08da70af28c2
x-ms-traffictypediagnostic:
	DBBPR08MB6124:EE_|VE1EUR03FT055:EE_|AM0PR08MB3940:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7eCxtFFwHx96HUDIKM9j83bcnDJGCYy1e1F8LOImMO3p/Ee83eO0f9xYHQwTBePyXW07DgKoQPD1JScStL2cMkBshzATAZs49n0HZx+8tWmyOxw+EX5Ld07vgz9FfZ+Fe77U2zG8erM7B2WCnD81QZYryKgd73sZjADtaSNAQAvEfi9OOMiXIVwejl3SFsh4jaoWqBOwgo7YB0RJWp3uAYV9CUmeh98bw0UFPOTkGVl9bZSHpzOwOzfnF4chd+elxTyPcj76ViFWwzC9wEr5O2Xp27tZAYUc4z/GvsnXE9s0GgWiftHo0mjYCNLHNzCJ1UjK8KKEgIwIJMSYET9LZV47eky3zF6ukARozniXT/UFNehcyclhq/qvoT8JZ2tajSdG0XSv5yWykSYTSjyNU5K1DvWW+/0dmkWfVzp5hllXvRqyEuV2nhF+UIPY82m+gj3G4m2BVuLx9Vfg6NdjIZIeLbNskiZl9kqH5HNsplrrywWNM2FUuNiXKBuPNz7Ao8OoAjri5EE61QTA842ubsP06o2iNEtx71P3X+MCWkgOxzGq80CjQHZwWTsENQ9Eh0moEGZvnw8zkzLMnBbkWhCno4gZvTzqFCUejoUU3nxI8XvqtdHN18kUbsIkA8SHCAZwo8TemL3SgwytHcbhQLqkBhcIA2Dvm4nxqtZUoFEVznMvkktRTl0sDuBc5CS/8Mpk+AKrtRSIgf/2l2vh2XgG6fLqrBwI2TkAqlMMHGM5xX4hHFVtE4ttF/t3EWy5p/zPC96+UM0oWwZuXZHYjy5T+ODdzD4IwbP/7hFH9jxvNXQd8DyNHQC0YEWwITY3ICv4d62hsRPrQM1rQWDe1w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7165.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(84040400005)(122000001)(66946007)(83380400001)(316002)(36756003)(38100700002)(6916009)(54906003)(186003)(53546011)(6506007)(2906002)(66476007)(71200400001)(66446008)(64756008)(91956017)(86362001)(8676002)(6486002)(33656002)(2616005)(8936002)(4326008)(38070700005)(5660300002)(478600001)(66556008)(26005)(76116006)(41300700001)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEC424DFF8DC754D866ECAD9118E80CC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6124
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f31ec8fe-f935-4a49-272b-08da70af1f8f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LMf9Ud0iHcfmEcGK6e8QLFXb4lQ+Hvtx/03dGCJrBCfcDzz8kHkksaJoLdFkzHiWyEYKDAZTiGwxHyLBHOiUEmAXWdAUkd2CPORy7/kZoqU5GdwOKYyTGWoLFAohQaFM8xxGeFQJwRX5rgFjF3W8LVrUHQCkmGe5jlJ48676A6EV3qSqIE1zT6ZtNcs/SIAqv+r2HfH3S87Alyd6GttxafqPyGTNenFc7yUKZb36jge+T9G30YzjSg/pwyfM7GOtKfWbVDzzbXW1vYej2+i/ijwjv8ZgLKo9Wh4B8dAAzXRGYOKdSMBCBxOYrZUMuYfi2BgbvDCQFbi4yovLsAa0ok0jJHSyGzNSX7VNVUrZ4LtzaqSHNoSwowvvE/72SVzasQz7sm9vgcR1UI9ykmWK1cF6n1iWwHAH9avp24NOXMk9AgRhOS/gB9TlyrVyd6jnMfFypolEXvV72EoB6IAERGBpAa7k0eVUr0CLlO63efZ1qH2Nlh21E/gFA7easdQaByuyGl4F0w3cUMFiiBDQHgatjf+CHY8m+XPEIq9oSzpWbzSwVketk1n5ReH72if96wkWSXwx/wq5Bv7jDphlLs7IRH7JLCR0QFNhje+b1BSIxpvFlMSbJW0ZnPAcf5VOkFB8d0yo5QDHBlE2Q0ajJAnGN1E4kyMoLniJ8OQvtyCQA8KCnqnRBemfnb/DQAjSLRmp3eXrE7feh+yZRmD9uGcXJr00j52riCmnq4Ma9EpqozYIlgduGbOMA6GvNhhxNT9RzsRIDaMh9khIAZizI9LKpzpzX8rMzAR3rBis7JNewemSTC3JPMGMYiBt+u2D
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(136003)(346002)(84040400005)(40470700004)(46966006)(36840700001)(2616005)(82310400005)(41300700001)(186003)(47076005)(86362001)(316002)(53546011)(36756003)(6506007)(5660300002)(83380400001)(40460700003)(336012)(356005)(2906002)(4326008)(40480700001)(6486002)(6512007)(8936002)(6862004)(81166007)(82740400003)(54906003)(33656002)(26005)(70586007)(478600001)(8676002)(70206006)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 15:38:03.0358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0273724e-8976-43c5-6da1-08da70af28c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3940

SGkgSnVsaWVuDQoNCj4gT24gMjYgSnVsIDIwMjIsIGF0IDY6MzcgcG0sIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAyMS8wNy8yMDIyIDE2OjM3
LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4gDQo+IEhpIFJhaHVsLA0KPiAN
Cj4+PiBPbiAyMSBKdWwgMjAyMiwgYXQgMjoyOSBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gMjEvMDcvMjAyMiAxMzo1MCwgUmFodWwgU2luZ2gg
d3JvdGU6DQo+Pj4+IEhpIEp1bGllbiwNCj4+PiANCj4+PiBIaSBSYWh1bCwNCj4+PiANCj4+Pj4+
IE9uIDIwIEp1bCAyMDIyLCBhdCAxMjoxNiBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IEhpIFJhaHVsLA0KPj4+Pj4gDQo+Pj4+PiBPbiAyMC8w
Ny8yMDIyIDEwOjU5LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4gT24gMTMgSnVsIDIwMjIs
IGF0IDE6MjkgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4+
PiANCj4+Pj4+Pj4gDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBPbiAxMy8wNy8yMDIyIDEzOjEyLCBCZXJ0
cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4+Pj4+IE9uIDEzIEp1bCAyMDIyLCBhdCAxMjozMSwg
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+Pj4+Pj4+IEkgY2FuJ3QN
Cj4+Pj4+Pj4+Pj4gc2VlIHdoeSBpdCB3b3VsZCBiZSB3cm9uZyB0byBoYXZlIGEgbW9yZSB0aWdo
dCBsaW1pdCBvbiBzdGF0aWMgcG9ydHMNCj4+Pj4+Pj4+Pj4gdGhhbiBvbiB0cmFkaXRpb25hbCAo
ImR5bmFtaWMiKSBvbmVzLiBFdmVuIGlmIG9ubHkgdG8gbWFrZSBzdXJlIHNvDQo+Pj4+Pj4+Pj4+
IG1hbnkgZHluYW1pYyBvbmVzIGFyZSBsZWZ0Lg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IFRoaXMg
aXMgc2ltaWxhciB0byBYZW4gZm9yYmlkZGluZyB0byBjbG9zZSBhIHN0YXRpYyBwb3J0OiBpdCBp
cyBub3QgdGhlIGh5cGVydmlzb3IgYnVzaW5lc3MgdG8gY2hlY2sgdGhhdCB0aGVyZSBhcmUgZW5v
dWdoIGV2ZW50IGNoYW5uZWwgcG9ydHMgZnJlZWQgZm9yIGR5bmFtaWMgYWxsb2NhdGlvbi4NCj4+
Pj4+Pj4+IE9uIG90aGVyIHNpZGUgd2UgbmVlZCB0byBiZSBjYXV0aW91cyBub3QgdG8gYWRkIHRv
byBtdWNoIGNvbXBsZXhpdHkgaW4gdGhlIGNvZGUgYnkgdHJ5aW5nIHRvIG1ha2UgdGhpbmdzIGFs
d2F5cyBtYWdpY2FsbHkgd29yay4NCj4+Pj4+Pj4+IElmIHlvdSB3YW50IFhlbiB0byBiZSBhY2Nl
c3NpYmxlIHRvIG5vbiBleHBlcnQgYnkgbWFnaWNhbGx5IHdvcmtpbmcgYWxsIHRoZSB0aW1lLCB0
aGVyZSB3b3VsZCBiZSBhIGxvdCBvZiB3b3JrIHRvIGRvLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gSXQg
aXMgbm90IGNsZWFyIHRvIG1lIHdoZXRoZXIgeW91IGFyZSByZWZlcnJpbmcgdG8gYSBkZXZlbG9w
cGVyIG9yIGFkbWluIGhlcmUuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBPbiB0aGUgYWRtaW4gc2lkZSwg
d2UgbmVlZCB0byBtYWtlIHN1cmUgdGhleSBoYXZlIGFuIGVhc3kgd2F5IHRvIGNvbmZpZ3VyZSBl
dmVudCBjaGFubmVscy4gT25lIGtub2IgaXMgYWx3YXlzIGdvaW5nIHRvIGVhc2llciB0aGFuIHR3
byBrbm9icy4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IE9uIHRoZSBkZXZlbG9wcGVyIHNpZGUsIHRoaXMg
Y291bGQgYmUgcmVzb2x2ZWQgYnkgYmV0dGVyIGRvY3VtZW50YXRpb24gaW4gdGhlIGNvZGUvaW50
ZXJmYWNlLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gQ2hlZXJzLA0KPj4+Pj4+IFRvIGNvbmNsdWRlIHRo
ZSBkaXNjdXNzaW9uLCBJZiBldmVyeW9uZSBhZ3JlZSBJIHdpbGwgYWRkIHRoZSBiZWxvdyBwYXRj
aCBvciBzaW1pbGFyIGluIHRoZSBuZXh0IHZlcnNpb24gdG8gcmVzdHJpY3QgdGhlDQo+Pj4+Pj4g
bWF4IG51bWJlciBvZiBldnRjaG4gc3VwcG9ydGVkIGFzIHN1Z2dlc3RlZC4NCj4+Pj4+IA0KPj4+
Pj4gSSBhbSBmaW5lIGlmIHRoZSBsaW1pdCBmb3IgZG9tVSBpcyBmaXhlZCBieSBYZW4gZm9yIG5v
dy4gSG93ZXZlciwgZm9yIGRvbTAsIDQwOTYgaXMgcG90ZW50aWFsbHkgdG9vIGxvdyBpZiB5b3Ug
aGF2ZSBtYW55IFBWIGRyaXZlcnMgKGVhY2ggYmFja2VuZCB3aWxsIG5lZWQgYSBmZXcgZXZlbnQg
Y2hhbm5lbHMpLiBTbyBJIGRvbid0IHRoaW5rIHRoaXMgd2FudHMgdG8gYmUgZml4ZWQgYnkgWGVu
Lg0KPj4+PiBBZ3JlZS4NCj4+Pj4+IA0KPj4+Pj4gSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3ZSB3
YW50IHRvIGxpbWl0IHRoZSBudW1iZXIgb2YgZXZlbnQgY2hhbm5lbHMgZm9yIGRvbTAuIEJ1dCBp
ZiB5b3Ugd2FudCB0bywgdGhlbiB0aGlzIHdpbGwgaGF2ZSB0byBiZSBkb25lIHZpYSBhIGNvbW1h
bmQgbGluZSBvcHRpb24gKG9yIGRldmljZS10cmVlIHByb3BlcnR5KS4NCj4+Pj4gV2UgbmVlZCB0
byBzdXBwb3J0IHRoZSBzdGF0aWMgZXZlbnQgY2hhbm5lbCBmb3IgZG9tMCBhbHNvLCBpbiB0aGF0
IGNhc2UsIHdlIG5lZWQgdG8gcmVzdHJpY3QgdGhlIG1heCBudW1iZXIgb2YgZXZ0Y2huIGZvciBk
b20wIHRvIG1pdGlnYXRlIHRoZSBzZWN1cml0eSBpc3N1ZS4NCj4+PiANCj4+PiBJdCBzb3VuZHMg
bGlrZSB0aGVyZSBhcmUgc29tZSBtaXN1bmRlcnRhbmRpbmcgb3IgSSBhbSBtaXNzaW5nIHNvbWUg
Y29udGV4dC4gVGhlIHN0YXRpYyBldmVudCBjaGFubmVscyB3aWxsIGJlIGFsbG9jYXRlZCBhdCBi
b290LCBzbyB0aGUgd29yc2UgdGhhdCBjYW4gaGFwcGVuIGlzIGl0IHdpbGwgYmUgc2xvd2VyIHRv
IGJvb3QuDQo+Pj4gDQo+Pj4gTXkgcG9pbnQgcmVnYXJkaW5nIGZpZm8gd2FzIG1vcmUgaW4gdGhl
IGdlbmVyaWMgY2FzZSBvZiBhbGxvd2luZyB0aGUgY2FsbGVyIHRvIHNlbGVjdCB0aGUgcG9ydC4g
VGhpcyB3b3VsZCBiZSBhIGNvbmNlcm4gaW4gdGhlIGNvbnRleHQgb2Ygbm9uLWNvb3BlcmF0aXZl
IGxpdmUtbWlncmF0aW9uLiBBbiBlYXN5IHdheSBpcyB0byByZXN0cmljdCB0aGUgbnVtYmVyIG9m
IHBvcnRzLiBGb3IgeW91LCB0aGlzIGlzIGp1c3QgYW4gaW5jcmVhc2UgaW4gYm9vdCB0aW1lLg0K
Pj4+IA0KPj4+IEZ1cnRoZXJtb3JlLCB0aGVyZSBpcyBhbiBpc3N1ZSBmb3IgZG9tMGxlc3MgZG9t
VXMgYmVjYXVzZSB3ZSBkb24ndCBsaW1pdCB0aGUgbnVtYmVyIG9mIHBvcnQgYnkgZGVmYXVsdC4g
VGhpcyBtZWFucyB0aGF0IGEgZG9tVSBjYW4gYWxsb2NhdGUgYSBsYXJnZSBhbW91bnQgb2YgbWVt
b3J5IGluIFhlbiAod2UgbmVlZCBzb21lIHBlci1ldmVudCBjaGFubmVsIHN0YXRlKS4gSGVuY2Ug
d2h5IEkgc3VnZ2VzdGVkIHRvIHVwZGF0ZSBtYXhfZXZ0Y2huX2NoYW5uZWwuDQo+PiBUaGFua3Mg
Zm9yIHRoZSBjbGFyaWZpY2F0aW9uLg0KPj4+IA0KPj4+PiBJZiB0aGUgYWRtaW4gc2V0IHRoZSB2
YWx1ZSBncmVhdGVyIHRoYW4gNDA5NiAob3Igd2hhdCB3ZSBhZ3JlZWQgb24pIGFuZCBzdGF0aWMg
ZXZlbnQgY2hhbm5lbCBzdXBwb3J0IGlzIGVuYWJsZWQgd2Ugd2lsbCBwcmludCB0aGUgd2Fybmlu
ZyB0byB0aGUgdXNlciByZWxhdGVkIHRvIGZpbGwNCj4+Pj4gdGhlIGhvbGUgaXNzdWUgZm9yIEZJ
Rk8gQUJJLg0KPj4+IA0KPj4+IFNlZSBhYm92ZS4gSSBkb24ndCBzZWUgdGhlIG5lZWQgZm9yIGEg
d2FybmluZy4gVGhlIGFkbWluIHdpbGwgbm90aWNlIHRoYXQgaXQgaXMgc2xvd2VyIHRvIGJvb3Qu
DQo+PiBPay4gSSB3aWxsIG5vdCBhZGQgdGhlIHdhcm5pbmcuIEp1c3QgdG8gY29uZmlybSBhZ2Fp
biBpcyB0aGF0IG9rYXkgSWYgSSBhZGQgbmV3IGNvbW1hbmQgbGluZSBvcHRpb24gIm1heF9ldmVu
dF9jaGFubmVsc+KAnSBpbg0KPj4gbmV4dCB2ZXJzaW9uIGZvciBkb20wIHRvIHJlc3RyaWN0IHRo
ZSBtYXggbnVtYmVyIG9mIGV2dGNobi4NCj4gDQo+IFBlcnNvbmFsbHkgSSBhbSBmaW5lIHdpdGgg
YSBjb21tYW5kIGxpbmUgb3B0aW9uIHRvICpnbG9iYWxseSogcmVzdHJpY3QgdGhlIG51bWJlciBv
ZiBldmVudHMgY2hhbm5lbC4gQnV0IEphbiBzZWVtZWQgdG8gaGF2ZSBzb21lIHJlc2VydmF0aW9u
LiBRdW90aW5nIHdoYXQgaGUgd3JvdGUgcHJldmlvdXNseToNCj4gDQo+ICJJbW8gdGhlcmUgd291
bGQgbmVlZCB0byBiZSBhIHZlcnkgZ29vZCByZWFzb24gdG8gbGltaXQgRG9tMCdzIHBvcnQgcmFu
Z2UuDQoNCkFzIHlvdSBtZW50aW9uZWQsIGlmIHdlIGRvbuKAmXQgcmVzdHJpY3QgdGhlIG51bWJl
ciBvZiBldmVudHMgY2hhbm5lbCBmb3IgdGhlIGRvbTAgc3lzdGVtIHdpbGwgYm9vdCBzbG93ZXIu
DQpUaGlzIGlzIGEgZ29vZCByZWFzb24gdG8gcmVzdHJpY3QgdGhlIG51bWJlciBvZiBldmVudCBj
aGFubmVscyBmb3IgZG9tMC4NCiANCkBKYW46IEkgbmVlZCB5b3VyIGlucHV0IG9uIHRoaXMgYmVm
b3JlIEkgc2VuZCB0aGUgbmV4dCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCBzZXJpZXMuDQoNClJlZ2Fy
ZHMsDQpSYWh1bA==

