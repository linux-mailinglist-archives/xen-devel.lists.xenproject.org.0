Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C674F3D60
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 21:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299256.509810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbp4g-0000ow-Ta; Tue, 05 Apr 2022 19:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299256.509810; Tue, 05 Apr 2022 19:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbp4g-0000m5-Ou; Tue, 05 Apr 2022 19:42:46 +0000
Received: by outflank-mailman (input) for mailman id 299256;
 Tue, 05 Apr 2022 19:42:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUJf=UP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nbp4f-0000lz-H3
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 19:42:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f1d395d-b518-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 21:42:43 +0200 (CEST)
Received: from AM5PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:206:1::28)
 by PR2PR08MB4825.eurprd08.prod.outlook.com (2603:10a6:101:27::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 19:42:33 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::8b) by AM5PR04CA0015.outlook.office365.com
 (2603:10a6:206:1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31 via Frontend
 Transport; Tue, 5 Apr 2022 19:42:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Tue, 5 Apr 2022 19:42:32 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Tue, 05 Apr 2022 19:42:31 +0000
Received: from 4f127f0ff89c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF6DA651-7D15-4782-94A1-002F48C99F82.1; 
 Tue, 05 Apr 2022 19:42:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4f127f0ff89c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Apr 2022 19:42:25 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by PAXPR08MB7106.eurprd08.prod.outlook.com (2603:10a6:102:204::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 19:42:17 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 19:42:17 +0000
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
X-Inumbo-ID: 8f1d395d-b518-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebm6VtDbjwvYZQXog6NpVotRSsTpdSEoA7ajvOxoidk=;
 b=7aLqH7trEgCCRYT9ub9yK4yQ9Mss3/+PP3xYgIpJADg0aAAv1cQfgb5jFrhg4fsO1wOibTBJCsEdxiFZsQzL7Jsn3gmnkHrJ/EvhKCS4Fs2aUvYnbH6KvqyqQGAe1FWq2aWvJ33kARBQ8RjiG5IY1Cu6gJNgaiLYdjZ6+kHMP9U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 838c0a2e266dd0cd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lp6Ny1qfewWNy37nSjifpLbLLToBOA03rEcXXVDBsqNFMckQA6WzY3DJE1oOJ4LoSEcZsjqCuTtNoCVa2/t8cQ0vCnPMFTZr2UCN5M0jmBe84VjutcHUlgoAn6Kk1XdlfCVLy8LCV4qJQAXt2f5SzGKUdj9ACGQRr1tl7bI5UhUD25RBJoqHhdafe0E3vYJsfKwoX6WCE7LUntvG2jHVWAlb/HtKOmqAgfQKLjpffqMIqXXbo/M9c6rZrVNMAEzFVa5SLZ+uM7JXhNgXDpjFFOCezQO0+Z9sTsOvuuh39osl9SC4iQ8rmFibgCNPgSyJ3CNCIz0ufUJgzwbRtjHuJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebm6VtDbjwvYZQXog6NpVotRSsTpdSEoA7ajvOxoidk=;
 b=azz9E7O7pa+EQN+z44YhNxvYu9Qu/x1HBYf0dKub53gSCWw879uuE8esdcc4wMUb9GH/mfmhIHYAqoiXyaeO0jsb9wfdFVM1CDz4v9r55U3i5IbhqWRtoelpr/RpnMmslh+eBZMkcD26Kfpu25O5MIu3audv/QTsQNWVoyp+pEYkYFAx4TNeJ8qu06rmIwxluANoDOnDdEvRw//uDgw/6eloAhK+TxRtcKVVkeQHcNSFKk09r8F0yUcYa/Q5qHoYbACqwqYUuZCn+JZ69GmNwV4S4RMyCYPLJK+QR5ctIODMs8xieheln8/UGV6FXjUKBNAoB3rqCcpvv6HVRWNqxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebm6VtDbjwvYZQXog6NpVotRSsTpdSEoA7ajvOxoidk=;
 b=7aLqH7trEgCCRYT9ub9yK4yQ9Mss3/+PP3xYgIpJADg0aAAv1cQfgb5jFrhg4fsO1wOibTBJCsEdxiFZsQzL7Jsn3gmnkHrJ/EvhKCS4Fs2aUvYnbH6KvqyqQGAe1FWq2aWvJ33kARBQ8RjiG5IY1Cu6gJNgaiLYdjZ6+kHMP9U=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Demi Marie Obenour <demi@invisiblethingslab.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] Grab the EFI System Resource Table and check it
Thread-Topic: [PATCH v2] Grab the EFI System Resource Table and check it
Thread-Index: AQHYRh5pIZEBfe5HzkWcQzrtRd3oyazfnIKAgAIb/wCAAAXCgA==
Date: Tue, 5 Apr 2022 19:42:16 +0000
Message-ID: <ADA1764C-C67F-41A8-9CD3-8C421188A5FE@arm.com>
References: <YkeHXFvgB3MwXnuR@itl-email>
 <989D1F80-2CAA-4432-8780-E0104B28A634@arm.com>
 <alpine.DEB.2.22.394.2204051220520.2910984@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2204051220520.2910984@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a56e6d4f-1479-4447-40ae-08da173c6d36
x-ms-traffictypediagnostic:
	PAXPR08MB7106:EE_|VE1EUR03FT046:EE_|PR2PR08MB4825:EE_
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB48250C2659FE07B1AE0E0439E4E49@PR2PR08MB4825.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iRTBHiIRHHzj7kcYM4L/eRWa0SykxoAbfLkLP7+qDqBsrDa3/om7qVr7mEqfkWnF/o1Qaz6rlosjtKZc1PN0hn5Mxixd7ZaJzL8vFJHcubdViqo/UkvlFks2hweIsqhF3eBvDvZXxZPrB1mWdO9RCrjTUI67roMtnS2YfethcM5tx0DxZ2FUIDlKyDx+N+MP3zJeRHW1IZo3My4uT0Z62jpvwdvfWfFfnCC1Uch+Rme5KwWpNZtE4XfM11WE9z5JCi5Dds3Hjd8+C2/bItehphSEIC2kdvmRKjWXnlV1fPNd6PpENC9BIY0yVriTG4vKwVBPIBtECbtvBLjOO/nZpHjjNgXEKFCS4S1TNgyNpzVTq+zC1MpviyKgwOgoOUVX3FYNZ/U61pBFBnbcpuXZU53XurOLhVKADG19Z/C6LAyhtV8/ffD+GhK9g2tOq6o6kVo0fX+OOFyXcBPhC/zjhyU9sUkaqzp705UcMfQZYkfoa/hCscxuuq1RZtjpkA2LOHZm0PYbAFi9pIaSsc+WHPkEFZYy+dp8oQuxI1Ew/ZmoG2XLm4s4qwDj517sNe8wAVmrRpwsw45AvaPWhLUKlWnzo//b3V3dreF6x11XyZ7AAzpOA4RcQZ62/pWnOibBJPDGV13MbcUjANyIk5Vnb3lR/UbxnkYdyUNjjNGqq9MQRX5+R8JfPPU6FUfaLNoPzYBfEHQjDAkhDJqaO1JVF01MeQ445wRw9U3h69MyMLW1ftUq0UjvD+q2pVxEqSlyESKa6bt2pzcgUzlyrTzcQzXtFP4Ql5Y8gEVA5Ac/ECup1aC8IciLWEt0CiygGKN3uSux87tHUH+DZkw9/F01cA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(71200400001)(8936002)(33656002)(36756003)(86362001)(5660300002)(38100700002)(64756008)(4326008)(66476007)(66446008)(66946007)(122000001)(38070700005)(2616005)(54906003)(91956017)(53546011)(6512007)(6506007)(76116006)(6916009)(508600001)(6486002)(966005)(83380400001)(26005)(186003)(66556008)(8676002)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B68014681F6254198709803C10DAC95@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7106
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1902330b-f475-46e7-c8f6-08da173c6415
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ld/2khqUtg4oU3WkZrqPINE2YIsLrwcMW796WI27VUWYyC82GM360jGAmjwpVw8ADe24TRz+utFoyLrf+N0gCKzwOYuA6hXduJhfCI5SP2xE7YtMAr3yKOKMVrdlikRULc4eoBxGbbX4MHLf85tZrPyAe7Ywdub2U4ZX9GMH7cYIM6zESfCTIzRRou4/N7pxAij+QfNHDppmJ+Igajj6dgUCVfeQ+Q6Un4riQ/S+7M0poPCLYvmr+vtbC38lW6pt8d0PCdUrwSIiBzo5Ogovs4yHF1WsP0QdP+jH6rujz0D+4MVrHY+ZccZAQYXYn8C8iSzCgxC+Kg+WK/JUUoaO2Kwg8m3f80azQRtoV12sPZ6q0Z9bi/6tNB0QYf0MWoNMIYj6M0WErk1tvgzfsFA3wpGg4DYXjKYvT/4OL0Ofk/hmAkxtgzJpE1grN4htRx+pSHtV45BRA2en9fpGtnz9ak05p7CWB7hGUYt8jG2Pwhrzqoc1rP5NRrOHv9s+ZfZAEOcun7sHwaVbNwfWyYg3FPM0/HyozSQ3Q7OSIM2aAZlRa+G+xBZEX59YEi07L8DZyXCjKuJpMBZl5OyrUHgi0HJJeh9+ck70bj+86PnFkZc0wBRAD7HI6gJF/p1hffTGmE1aBzyUqPhd72SS+OdsHUkgN88mnS37wYuXeyc/O5b1XLaFcoA8hb2c38CVgUSQo+H1SVsBD2DaE/nxI6NjQM9Tva7N0oCD8jgNrUCZQnbLAlGlSomr+acKWtcD3MiXW0q8t384Nw56zDs9NeDnUQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(33656002)(53546011)(5660300002)(6512007)(83380400001)(36756003)(6506007)(356005)(81166007)(54906003)(2906002)(316002)(6862004)(508600001)(36860700001)(70586007)(70206006)(82310400005)(6486002)(966005)(8936002)(26005)(186003)(2616005)(47076005)(4326008)(40460700003)(86362001)(8676002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 19:42:32.3001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a56e6d4f-1479-4447-40ae-08da173c6d36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4825

DQoNCj4gT24gNSBBcHIgMjAyMiwgYXQgMjA6MjEsIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIDQgQXByIDIwMjIsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+Pj4gT24gMiBBcHIgMjAyMiwgYXQgMDA6MTQsIERlbWkgTWFyaWUg
T2Jlbm91ciA8ZGVtaUBpbnZpc2libGV0aGluZ3NsYWIuY29tPiB3cm90ZToNCj4+PiANCj4+PiBU
aGUgRUZJIFN5c3RlbSBSZXNvdXJjZSBUYWJsZSAoRVNSVCkgaXMgbmVjZXNzYXJ5IGZvciBmd3Vw
ZCB0byBpZGVudGlmeQ0KPj4+IGZpcm13YXJlIHVwZGF0ZXMgdG8gaW5zdGFsbC4gIEFjY29yZGlu
ZyB0byB0aGUgVUVGSSBzcGVjaWZpY2F0aW9uIMKnMjMuNCwNCj4+PiB0aGUgdGFibGUgc2hhbGwg
YmUgc3RvcmVkIGluIG1lbW9yeSBvZiB0eXBlIEVmaUJvb3RTZXJ2aWNlc0RhdGEuDQo+Pj4gVGhl
cmVmb3JlLCBYZW4gbXVzdCBhdm9pZCByZXVzaW5nIHRoYXQgbWVtb3J5IGZvciBvdGhlciBwdXJw
b3Nlcywgc28NCj4+PiB0aGF0IExpbnV4IGNhbiBhY2Nlc3MgdGhlIEVTUlQuICBBZGRpdGlvbmFs
bHksIFhlbiBtdXN0IG1hcmsgdGhlIG1lbW9yeQ0KPj4+IGFzIHJlc2VydmVkLCBzbyB0aGF0IExp
bnV4IGtub3dzIGFjY2Vzc2luZyBpdCBpcyBzYWZlLg0KPj4+IA0KPj4+IFNlZSBodHRwczovL2xv
cmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyMDA4MTgxODQwMTguR04xNjc5QG1haWwtaXRsL1Qv
DQo+Pj4gZm9yIGRldGFpbHMuDQo+Pj4gDQo+Pj4gU2lnbmVkLW9mZi1ieTogRGVtaSBNYXJpZSBP
YmVub3VyIDxkZW1pQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQo+PiANCj4+IEhpLA0KPj4gDQo+
PiBJ4oCZdmUgdGVzdGVkIHRoZSBwYXRjaCBvbiBhbiBhcm0gbWFjaGluZSBib290aW5nIFhlbitE
b20wIHRocm91Z2ggRUZJLCB1bmZvcnR1bmF0ZWx5DQo+PiBJIGNvdWxkIG5vdCB0ZXN0IHRoZSBm
dW5jdGlvbmFsaXR5Lg0KPiANCj4gSSB1bmRlcnN0YW5kIHlvdSBjb3VsZG4ndCB0ZXN0IEVTUlQg
YnV0IGRpZCB0aGUgYmFzaWMgWGVuK0RvbTAgYm9vdCB2aWENCj4gRUZJIG9uIEFSTSB3b3JrPw0K
DQpZZXMsIEkgcmVhbGlzZSBub3cgSSBzaG91bGQgaGF2ZSBhZGRlZCAqYW5kIGl0IHdvcmtzKiBi
ZWZvcmUgdGhlIGNvbW1hLCB3aXRob3V0IGl0IHRoZSBzZW50ZW5jZSBpcw0KbWlzbGVhZGluZy4N
Cg0KQ2hlZXJzLA0KTHVjYQ==

