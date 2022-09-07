Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFB65AFA6B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 05:10:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400740.642366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVlRc-00071g-R2; Wed, 07 Sep 2022 03:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400740.642366; Wed, 07 Sep 2022 03:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVlRc-0006z8-Lh; Wed, 07 Sep 2022 03:09:40 +0000
Received: by outflank-mailman (input) for mailman id 400740;
 Wed, 07 Sep 2022 03:09:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gDT=ZK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVlRa-0006yy-UQ
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 03:09:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 805a1b24-2e5a-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 05:09:36 +0200 (CEST)
Received: from FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::20)
 by GV2PR08MB8097.eurprd08.prod.outlook.com (2603:10a6:150:75::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 03:09:30 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::58) by FR3P281CA0149.outlook.office365.com
 (2603:10a6:d10:95::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 03:09:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Wed, 7 Sep 2022 03:09:29 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Wed, 07 Sep 2022 03:09:29 +0000
Received: from 380f7bb3f62b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F9A47109-8776-4C56-9B67-B19185259512.1; 
 Wed, 07 Sep 2022 03:09:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 380f7bb3f62b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 03:09:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB9828.eurprd08.prod.outlook.com (2603:10a6:10:45f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.13; Wed, 7 Sep
 2022 03:09:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Wed, 7 Sep 2022
 03:09:15 +0000
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
X-Inumbo-ID: 805a1b24-2e5a-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EKspQJ7IzGCOmnCXD4bkOAEuldb2lPX5LlPdvkP2zUM8YQ5L/QpElGlMhA+WgMMPnUmmro0i0/myvLVhkoIPnxNZAQYu8ZdZZXzlQ64KvSEkfTlmHSOgPoZ37PXhGIdxn2WssccEJtBcSCF61vai6po6of6vqRCi5YFwZqTw5POZNh1IPNTUEcKbIDtpyBN/JLhkXI4eEgGzrI8UKBayoa/vEQiCd+VneLRCNHp9fXB1MeRM+HnoGPf+t4FcIBoZ06I/NDIcAxwBro9XuuGMe/Ue/acVjnO4uBJChJYDalOH+eePSos1HTA36B4eT742fKXnBrCYgJg9ql9E6FgEeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvDLjZV8x2Ckt0IlK6yzfNZtsY7rtC/+LV3YMoaR5Yo=;
 b=ixfPXI253ejPEj4FwkjtT6ozGB+8LvU0IgrY8Q8lWFpUQ3dnwIzeaHeqQ1yLJD3ndq1CGjNRcQm26INHLnjMjSezwDEK8uQuvHWcX8Sc4ds2Pkd+BuG7f6sg5MNCAY2wif57R+/3ZUXoHZEEcisjijgxh3fAVqBZmrHg0+OaSimHuzGgQ6hzOoUBz3iYWHnWh90GlhXUtII1dFDxfTilJNA6N5MLAcW3EViuXe4OBDq7mJN18Z58UE907Zv44QIj9KCNSc3u95jUeZ+VUhupWeiGN8lEI/leqi5Us//rSoeh9u17my67uKfPIjoHWUq5paxmqjyqGM+hifjExx7asw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvDLjZV8x2Ckt0IlK6yzfNZtsY7rtC/+LV3YMoaR5Yo=;
 b=Q54ZWhTgptMIASh1zClf8pOD66YU5767NS/WlaaJS2hLwPAIwMcGdobWMpgPDalCYIVewk73UZqvAMx9/dkx9+l3keeFDAvcsypuBwj07eH3CPnoOAq3RQVVJfFBZ0xm4gWk1ky8QPoAV2t+dt2OPQoh6JDJKPsBh6YbMwhbqrA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqH/fTjCNZ/EWh2jKbJKg4BTwIvEI87d1q/SyUYa1oDpFSR9+yyXnKLO4Yv4kW6YvQ9tZgDZjzT2QyhX6BDgo/D3fWB1YVe16hz+LXoXcW64KRk4cvQzIwQ3QG60nOWPfSX9qMwjqd4TlaYoUD6INNODt4Q2ucWSX8zCmll1lSZBXP8nT+9ikBbsfP7UiUUIxUED67hHmpiRolTucJB3vJMdcOp/yLRmF24K95G2HV4Yd44fDvUWp057x6pgYxN2jN2067zyoSY+KDSebI8r3wf7qL1c7niJgqKn5heVds7/G7VOaF72tlgKxgk4YiYsBZR+uV50pEJs++YBECVRKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvDLjZV8x2Ckt0IlK6yzfNZtsY7rtC/+LV3YMoaR5Yo=;
 b=oWO0e/rGDGofh4x7hi9zwd3Ohld/+mB6J7pAMc5wzUzC4qBiHksCAFuAP4SkvRzTDyaxf45ZYwPH3DcUk8b5iLJ+8Cl2myFqiZMu4/RbUZzA9eptNQKfHc75LaZ2Fm7Eb0j8ti9uHVPweXRHIwTCfgq99aposzqtt0DdoNZvA1jPSLmVwzMkVQhKZu9H761T/VWjWiF/qEYIUEiNJbHY6GHVEBJzF3QlEPaxJRsuV3QpciWx8dHIS8ttfGB543XkoCGbaypKcvdXfVg+OuC8UrIqZ0EEp01huGIwGeSzk6gmblVV1iJkR7KodQFv8NLG8UtaW0FwRvQA2TfWyZXG2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvDLjZV8x2Ckt0IlK6yzfNZtsY7rtC/+LV3YMoaR5Yo=;
 b=Q54ZWhTgptMIASh1zClf8pOD66YU5767NS/WlaaJS2hLwPAIwMcGdobWMpgPDalCYIVewk73UZqvAMx9/dkx9+l3keeFDAvcsypuBwj07eH3CPnoOAq3RQVVJfFBZ0xm4gWk1ky8QPoAV2t+dt2OPQoh6JDJKPsBh6YbMwhbqrA=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Marc
 Ungeschikts <marc.ungeschikts@vates.fr>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>
Subject: RE: Xen 4.17 release: Current status before the feature freeze
Thread-Topic: Xen 4.17 release: Current status before the feature freeze
Thread-Index: AdjA2VmJ6EcVoZ5cTOOgVSRHep4cQABjJclQ
Date: Wed, 7 Sep 2022 03:09:15 +0000
Message-ID:
 <AS8PR08MB7991136AB6CFEA9568FF0A6492419@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB799103D2B44302893AE39A97927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB799103D2B44302893AE39A97927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EC1756BEEB58CD4BA2EC50FA58518809.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 597f4a35-f234-42c6-4ff3-08da907e6148
x-ms-traffictypediagnostic:
	DB9PR08MB9828:EE_|VE1EUR03FT016:EE_|GV2PR08MB8097:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sdoWOrmNhKdICSKQAC/Ykl3AE7OfdMDsUhZhnIzwttI9UrIVBasbZ315ig4kxS445OlHC3kvruaihoUJNPt8jWr5RnjTURDU6begoQEVmXjo3/gUrFkthSu50DJ55OWmMuB0W2DUjV2CLWjNZv6gDWJc7CQOwdeuUamLpo14VNoT5T06Wy0nVsdIrHIr1I+BwXEittI9//AcOgWOZlpu3YWYpU3A5+yuEjaBUnzoSuZ3dKrRQvLA7go/+TVGzpVzW1nztji/BjHrSgkrnCtQhTe9qhTDBv4ShUdXOfr4Ze93T0cXMxPOGpvLVZe7VFwFhe5oI0hIQ96lLOlYj22Fn2PD+dF2RkPEKW0rwmXyJnpw47qsHuhk3U3JhmBiF80pmMto39kxX96IyZMcMdK1jefiQiiuv84VQRi9tkNfAnbracaQXE9CpS2GUKAkUTqdA3Nwo1QeJnzGOMnB4iNl1Vn3alW3xNDP2vL5e6K3vcYpnBxkhEfESvWEkiJKUzMWSsJAl9oLwXFlhBKiDrX8cTWhgNs6tfa75vB5SWcRWAo0fwwDWErAe6VqDWJJm4Cgefrn7l5xl54tB1x+ZvEGcd16gtZSTgFGisTp1H5c+iSQtyPn7IQWhiiLHvMuNS5JOH3q+LoIycf7KM3BBcidnfvi66FY3CLw5aSjv8i+7chIjB18Hj7o1TEeuhxnR5YzOuYaRkC1jV4xSRtBWPHkeU/mUccXB9onJOQMlrxDUljukO7QF6sBDsLiwbM3aYNaXe21Aq5Jz4Fi5wNpZq6w3yujY7s54/8Z58681lPWHWdESZZVSM1a/8Ut6Qf5ANuj+i9YqnCErsafGi0boiHD6RIGHTZSOqmrZzceimoPDYo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(8936002)(7416002)(5660300002)(186003)(2906002)(110136005)(55016003)(26005)(9686003)(41300700001)(7696005)(6506007)(33656002)(86362001)(83380400001)(52536014)(966005)(478600001)(71200400001)(38070700005)(8676002)(64756008)(66476007)(66946007)(76116006)(66446008)(54906003)(66556008)(316002)(4326008)(122000001)(38100700002)(134885004);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9828
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a9caf962-a561-46fb-4e6f-08da907e58e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wp9jbpCfrKQbfGzpZQUC+B/gzdecL+r6E5RXNnj2YlBMSa+lFqWWxArKNWFP8/ikZ4kkIE1VCEKkzIHORFmadVIRx1DZroyNOYD8+q3dj4B3q75qwgDCziG3Uu6QLe+Wgcncb95zlcaxWwbMl9/QyT4NKv3Oqh59IoEH3SQrA1lMf5CKt5JZYni/wwi7oPyCDBg+vkxaDgbeGdLV5qer28gMyPkYKLSKsxMoDGTbo3WKWd6dDx7QF02wZo96bMm97dBjRIgwn39+mDwJYszC+ySQ8FGuy4OD55oQbsBaYjxf3pLHTZkQStvJJVtm3lOWoHOgy4UssWKifJfA7UV+hWaLEdU2JUc4GKRSn2Arvn3pwWLIDUzx1IW2jE8qRJaTtkeXI4rYNHwGTkEyRH+vOE1+xXfVqKxj0Fsc4Va1GSIY8cXuV8pxwyG+QXgXzhyi8Rko4YiVo+7TViiRs0PXisHFb+7Oe+AUkRjbt0YVrBMV+oYp/Q+ppWVwZ2N1DAgG57dOAPZsyWb93+U6UWyURD2ISuOzYDSLxnK/No0MUkrLQFFeRInG5dmwWDuFLaxdGUychgdIMd5j8Zp/M4+Ov2HlvlZGh/znQRlvsZrcoeQBR1C4A/JObYA7FkOpxgfIl5FQSHh73q9caXo3U69xGonU/4a2vvT/7mUO/G+fy+hgQoNkS2Q0OARaK8enh3gzqcWUzRa7xmwpTbySSGQuK490muhhRjgKyrm4v63KRn2ilr3yMQ5r9dDm276KqxnOC9ZI2p2a6FttmUXfzg9VhjbC4U3lVlr1Xw8QkZHqNKg5a8BgvgcrBuWubzkYQ1zL7rvM8CD+LKr53UPpj3LMZmPohQn6prQjI5rJgvsRaz0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(136003)(36840700001)(40470700004)(46966006)(8676002)(966005)(70586007)(83380400001)(70206006)(4326008)(33656002)(7696005)(6506007)(478600001)(47076005)(107886003)(2906002)(40460700003)(26005)(9686003)(336012)(8936002)(186003)(52536014)(5660300002)(86362001)(41300700001)(82310400005)(81166007)(316002)(55016003)(82740400003)(40480700001)(54906003)(36860700001)(110136005)(356005)(134885004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 03:09:29.7660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 597f4a35-f234-42c6-4ff3-08da907e6148
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8097

Hi all,

> -----Original Message-----
> Subject: Xen 4.17 release: Current status before the feature freeze
>=20
> Hi all,
>=20
> As the feature freeze date is around the corner (Sep. 9, 2022) and we are
> currently summarizing the series for the release, here are the list of se=
ries
> pending in the mailing list. Please add the ones that I probably missed.
> Thank you very much!
>=20
> Also, as agreed from the September community call, the tracking of Xen 4.=
17
> release will happen both in the mailing list and the Gitlab. I will send =
the
> Gitlab link once the work is done. Thanks!

Marc and I have created the Gitlab boards regarding the release.

The general board:
https://gitlab.com/groups/xen-project/-/boards/4673887?milestone_title=3DRe=
lease%204.17

For people's convenience, we have created boards for each class -
The blocker list:
https://gitlab.com/groups/xen-project/-/boards/4723605?milestone_title=3DRe=
lease%204.17&label_name[]=3DPriority%3A%3ARELEASE%20BLOCKER

Arm:
https://gitlab.com/groups/xen-project/-/boards/4723207?milestone_title=3DRe=
lease%204.17&label_name[]=3D%F0%9F%8F%9B%EF%B8%8F%20ARM

x86:
https://gitlab.com/groups/xen-project/-/boards/4723261?milestone_title=3DRe=
lease%204.17&label_name[]=3D%F0%9F%8F%9B%EF%B8%8F%20X86

toolstack:
https://gitlab.com/groups/xen-project/-/boards/4726525?milestone_title=3DRe=
lease%204.17&label_name[]=3D%F0%9F%92%BBTOOLS

Misc (common, driver, CI, etc.):
https://gitlab.com/groups/xen-project/-/boards/4723491?milestone_title=3DRe=
lease%204.17&label_name[]=3D%F0%9F%92%BB%20MISC

Please inform if you find any issues. Thanks.

Kind regards,
Henry


