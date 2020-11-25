Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2AC2C4457
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 16:46:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37878.70447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khwzq-0003gi-BS; Wed, 25 Nov 2020 15:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37878.70447; Wed, 25 Nov 2020 15:46:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khwzq-0003gJ-8D; Wed, 25 Nov 2020 15:46:18 +0000
Received: by outflank-mailman (input) for mailman id 37878;
 Wed, 25 Nov 2020 15:46:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NtXg=E7=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1khwzo-0003gD-0t
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 15:46:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 629c2ebc-6da0-45c1-a8c0-d228cb2f5e48;
 Wed, 25 Nov 2020 15:46:13 +0000 (UTC)
Received: from AM5PR0301CA0014.eurprd03.prod.outlook.com
 (2603:10a6:206:14::27) by AM9PR08MB5938.eurprd08.prod.outlook.com
 (2603:10a6:20b:2da::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 25 Nov
 2020 15:46:11 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::98) by AM5PR0301CA0014.outlook.office365.com
 (2603:10a6:206:14::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 25 Nov 2020 15:46:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 25 Nov 2020 15:46:10 +0000
Received: ("Tessian outbound d6c201accd3c:v71");
 Wed, 25 Nov 2020 15:46:10 +0000
Received: from aa55fc1f714e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3931BC6F-3E7F-43E3-9509-20383B639618.1; 
 Wed, 25 Nov 2020 15:46:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa55fc1f714e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Nov 2020 15:46:04 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Wed, 25 Nov
 2020 15:46:02 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 15:46:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=NtXg=E7=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1khwzo-0003gD-0t
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 15:46:16 +0000
X-Inumbo-ID: 629c2ebc-6da0-45c1-a8c0-d228cb2f5e48
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:7d00::620])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 629c2ebc-6da0-45c1-a8c0-d228cb2f5e48;
	Wed, 25 Nov 2020 15:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZCq383xp/5qy+M97nZfOlE0VcTD2KOnamzXXXUAHsI=;
 b=VE/9xzK1uuAsiqHOBcP+hEOGVwb2wAjRqPERNP+TEwEAGm2KRiDLS8PZoCnJITad/TLh9tbsIdvgxDqxy1Yof2GLWHMVahEd4V4AZEhtTAZiVxWDSveWnyCxyUfOpaefzFsvna8Y4QiRSvVG+JeXfcx3pQhz8Q69tzIPqJ1r+0s=
Received: from AM5PR0301CA0014.eurprd03.prod.outlook.com
 (2603:10a6:206:14::27) by AM9PR08MB5938.eurprd08.prod.outlook.com
 (2603:10a6:20b:2da::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 25 Nov
 2020 15:46:11 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::98) by AM5PR0301CA0014.outlook.office365.com
 (2603:10a6:206:14::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 25 Nov 2020 15:46:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 25 Nov 2020 15:46:10 +0000
Received: ("Tessian outbound d6c201accd3c:v71"); Wed, 25 Nov 2020 15:46:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e147afdba466d563
X-CR-MTA-TID: 64aa7808
Received: from aa55fc1f714e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3931BC6F-3E7F-43E3-9509-20383B639618.1;
	Wed, 25 Nov 2020 15:46:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa55fc1f714e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 25 Nov 2020 15:46:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMd/Wm90SaMsJdmKe/WRyd/h3CGvfy6swOAX8M4stUEOGy0+hx9Y8QAahExR6pkKEl2iiH0iW5M/IvLWzkTdtxyeOEC1SBjbPHFzlY0OVnFawCbCOrojl+9CCRtJw2B159DcSlb1Wp2CA0h8Fw4+qQmK486f1kcTJ+OJBuJOtlvnrek6oRVxuQnZ90sGNQ4jpSja47J6NA6DD1IKRm5yTAwZEZpnhXJOsuY3cgEMk4IzGStULGExjRwuqacLEUxCefaw+3DKdDv9hKGJY1uv5iwUB6sMHhHoEujZbjBB25ms5Z6Tn+/Y7utiWHVOhA4QHKABuATa1sbjBmhUsFX5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZCq383xp/5qy+M97nZfOlE0VcTD2KOnamzXXXUAHsI=;
 b=SRF8pYVW8tFPA90MJhTkLH9PV2MI9tc9LDl1pXtSCwatTQkDY9yLxXnMrXJQ89AABmlGw7e/hsjB7ODfLVPJZwnv6s2qS+/Ul27C9rC90zqxkZbzFFvDA2H7thqt/Ffz8Qkyo8CG5UvZt93yI78U9Sls87vMGPA/W9cQM63yj114O0mwglYLNcGwHyh2j13mFVdGWT5PjQKwOBHkLEvnK8m57AjvwWHFzasO/mntneYhR6PqQDG8FEg1WIRFqB0w4ByzbkyQsRRGH6M1Vclk5eXCxfP9spW8W6BKlPSfZ8WSBt9PKsFz6bkkrZE6Qmq+lVmAODr4s3nHbo8m5BbGIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZCq383xp/5qy+M97nZfOlE0VcTD2KOnamzXXXUAHsI=;
 b=VE/9xzK1uuAsiqHOBcP+hEOGVwb2wAjRqPERNP+TEwEAGm2KRiDLS8PZoCnJITad/TLh9tbsIdvgxDqxy1Yof2GLWHMVahEd4V4AZEhtTAZiVxWDSveWnyCxyUfOpaefzFsvna8Y4QiRSvVG+JeXfcx3pQhz8Q69tzIPqJ1r+0s=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Wed, 25 Nov
 2020 15:46:02 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 15:46:02 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/libs: Simplify internal *.pc files
Thread-Topic: [PATCH] tools/libs: Simplify internal *.pc files
Thread-Index: AQHWwzpU13+Sxy8T80ynkBYhTAz0lKnY/bGA
Date: Wed, 25 Nov 2020 15:46:02 +0000
Message-ID: <617F2A46-68AA-4B80-8903-656027892933@arm.com>
References: <20201125144928.22778-1-andrew.cooper3@citrix.com>
In-Reply-To: <20201125144928.22778-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 83d4d2b1-66da-4294-8359-08d891593b95
x-ms-traffictypediagnostic: DBAPR08MB5798:|AM9PR08MB5938:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB593802286CC964B09BC6C2D29DFA0@AM9PR08MB5938.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 r6FTJYl6iGbIoPYTZ46pgcnd20VHQ2AhrA5t/RSH8+WyCcDyUcay3F6KE8stilkVmQeVOX54Ee+KuoDZmZGaWCu1kzZPFGyteqzrj3b9YTJuE3tC6Npt1GxUrCGuQ4dgE5NXdo9kLGwWw3B37wTsoRtb/5iU5A3efmsTouvtFNjIdu0f60bDfnk1i12QtmcfgEdqcZDKP4BcWsD9akbMELmsB/Ek+6OCS0oUxEeNRfLb55RBVl3sdpVpeQlvlq6LUITDWT4pLuLO7NPO0fnccgi36ia0W+6pjmerk1vwv+ygReuR0+VAKqwnSUiq9GuKuFCBfotw4+KTSc6Iw+ZkFw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(33656002)(316002)(6512007)(66476007)(26005)(186003)(64756008)(83380400001)(8936002)(6506007)(4326008)(6916009)(2906002)(66556008)(66446008)(66946007)(53546011)(91956017)(76116006)(2616005)(5660300002)(71200400001)(86362001)(36756003)(54906003)(6486002)(8676002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 ToRhXidCjLoPMnm+5VTs+HcRbCe6Eke0RBqFzwickIZDur7vclqI2GJjObcWyCc6ro33e0forZNkSqs7B0mAQsgBaZ2Jgeiuzs4TQKtDEZpMsSLu+FOZjebpZJ/DFvss7fuiMuG26VMtf2F5sAa6W1iMhO3YIp8AH4ue+QZL4E7qyTGCrL1x5I19GWLVQ2+Eu4jb9dnrSVU2xaoz0NI5L2ExvZrcUELFA60ZbDqryHdWOKk60jXEDE1iD+ZxFZCv50dMyqxo7gMkPk4cKkzgcIX5fWpJSyZTSePGSi55a7HC8TqO2JIEmIpw6dqcfjFBjRCj6sG48/0AIRD7nMPoweKZlrUHfaSdLiTtqBvAmfS4BEC49eCu1jFvzPh/uR1Ld+S4ISMvoGSUHQcnWOGs7mh1FzmwbxLC+mmVDqvesVuVnZX5ffr3e5WI6U+lFiA/2VwALWPC7YQ5JfG6S+520dwJnK1yADHlmJxQe1VsPKdj4MYAyIun2Ra+yBaww/ohq1F2858ubB+KZxiPZg3RHGdgjnaCs0VRt5R1iRdDHcUQyUWBa4dobiY0mRhAkwDe/uZLskpySCblN17b8cogRsB+GRl7+UCMDRnkEYnWl9QBHVxbdS7mRbK6zKxuQHox2O6VDNkZGXgm2wIWkzfat+jKDZgQQmjbD2ETmaP7jFI367sam4P1F3VwhWezhv5ZRSwoNKtF+wAhuUO6tlZDD14O1daZgq5X4FOwD7nx18MIz2a9BS+tVMHRYIaetMHtqvMLqLPm93M6QtN091oH3H+GDMHwNNRJDdSkRz0YBhuQXsPlwS8i92uteVuJC74cBCeucPSuOOQvSrgnbeJcMjyG8qWakjgP+keekwfgSPBw5FTGyGy+NQZ571Dd3eKxM53inLLZjzZhlnBy7wNpVQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <091995734B069540995914F43F2B9738@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5798
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	326bd53f-11f4-4167-7eee-08d89159367a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XHdCWg0VV4PC243pqUShAlqwVpeiq5WwcTRp7StSo1pUjEncx+1Cf8d1Lwf7ORd/OF4iZC3UTuRGKWcNns4NqhkuSaWeSw0ukfyMfDr2lVh3LRxMmzkECzMJgOiYlpOHmtMYxMKErKkgDkY89I92jbetf0oPhhMgW2KJev4agZcUf0OXHd3uRoYXcidjtjdeHavCxM46EW5u/3Ie+f43qvGsBNPo9CPokroJV8a8JGp+643ihF3mYYFj+Eyb1TOK7aFw5jWCe2HPQQ8ax0mb4MP8+aKNsosI4bwfQg2exRcf64d2+C1MMxhiVW3Z3bAH8h343/rfFm/v8MEHHz9nF0KLK0xWfwwmTrP/5HKCX9d32XVCZnzbvBJqbSQmvqeBn7g/hS8/ynOa+9KEXvyz2A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966005)(6486002)(83380400001)(107886003)(6512007)(36756003)(8676002)(5660300002)(356005)(478600001)(4326008)(81166007)(6862004)(70206006)(86362001)(70586007)(2906002)(8936002)(82310400003)(26005)(33656002)(82740400003)(47076004)(6506007)(186003)(316002)(2616005)(53546011)(36906005)(54906003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 15:46:10.9836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d4d2b1-66da-4294-8359-08d891593b95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5938

Hi Andrew,

> On 25 Nov 2020, at 14:49, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> The internal package config file for libxenlight reads (reformatted to av=
oid
> exceeding the SMTP 998-character line length):
>=20
>  Libs: -L${libdir}
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/evtchn
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/call
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/evtchn
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/gnttab
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/foreignmemory
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/call
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/devicemodel
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/ctrl
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/store
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/call
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/hypfs
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/evtchn
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/call
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/evtchn
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/gnttab
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/foreignmemory
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/call
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/devicemodel
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/ctrl
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/guest
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/light
>  -lxenlight
>=20
> Drop duplicate -rpath-link=3D's to turn it into the slightly-more-managea=
ble:
>=20
>  Libs: -L${libdir}
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/call
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/ctrl
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/devicemodel
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/evtchn
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/foreignmemory
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/gnttab
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/guest
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/hypfs
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/light
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/store
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toolcore
>  -Wl,-rpath-link=3D/local/security/xen.git/tools/libs/light/../../../tool=
s/libs/toollog
>  -lxenlight
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Nice reduction of the output :-)

Cheers
Bertrand

> ---
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Wei Liu <wl@xen.org>
> CC: Juergen Gross <jgross@suse.com>
> ---
> tools/Rules.mk | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/Rules.mk b/tools/Rules.mk
> index f61da81f4a..5d92ff0699 100644
> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -184,7 +184,7 @@ $(PKG_CONFIG_DIR)/%.pc: Makefile $(XEN_ROOT)/tools/Ru=
les.mk $(PKG_CONFIG_DIR)
> 	echo "Description: $(PKG_CONFIG_DESC)"; \
> 	echo "Version: $(PKG_CONFIG_VERSION)"; \
> 	echo "Cflags: -I\$${includedir} $(CFLAGS_xeninclude)"; \
> -	echo "Libs: -L\$${libdir} $(PKG_CONFIG_USELIBS) -l$(PKG_CONFIG_LIB)"; \
> +	echo "Libs: -L\$${libdir} $(sort $(PKG_CONFIG_USELIBS)) -l$(PKG_CONFIG_=
LIB)"; \
> 	echo "Libs.private: $(PKG_CONFIG_LIBSPRIV)"; \
> 	echo "Requires.private: $(PKG_CONFIG_REQPRIV)"; \
> 	} > $@
> --=20
> 2.11.0
>=20
>=20


