Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00EC5544DA
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 11:26:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353627.580579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3wd5-0004bw-Q9; Wed, 22 Jun 2022 09:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353627.580579; Wed, 22 Jun 2022 09:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3wd5-0004a8-Ke; Wed, 22 Jun 2022 09:26:31 +0000
Received: by outflank-mailman (input) for mailman id 353627;
 Wed, 22 Jun 2022 09:26:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UqP7=W5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o3wd3-0004Zj-Lv
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 09:26:29 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6499cf8f-f20d-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 11:26:28 +0200 (CEST)
Received: from AM5PR0701CA0014.eurprd07.prod.outlook.com
 (2603:10a6:203:51::24) by DB6PR0802MB2198.eurprd08.prod.outlook.com
 (2603:10a6:4:84::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Wed, 22 Jun
 2022 09:26:23 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::8e) by AM5PR0701CA0014.outlook.office365.com
 (2603:10a6:203:51::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Wed, 22 Jun 2022 09:26:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 22 Jun 2022 09:26:23 +0000
Received: ("Tessian outbound 5b5a41c043d3:v120");
 Wed, 22 Jun 2022 09:26:23 +0000
Received: from 46301a3343a8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 38379565-F31B-43F2-B646-1183F330EA5F.1; 
 Wed, 22 Jun 2022 09:26:16 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 46301a3343a8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Jun 2022 09:26:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB3123.eurprd08.prod.outlook.com (2603:10a6:208:5b::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Wed, 22 Jun
 2022 09:26:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 09:26:07 +0000
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
X-Inumbo-ID: 6499cf8f-f20d-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hMRaKdwBC3zDZiToGjRRM3kqG+PqhuluIIoF7EQW1K9NYXTUbi0IuJ9GW3oy9KwzXgf5f7l9QQ1+MorLE066wjZNzuJLAO8STjqVSGXHdBToiJ8pYnPTyfqlCtuYsNYy+IAfz0foc0lgwuAbFSiV53veuSZirNMPOZBssiX8TcMREOVr3Pts6bXuecfJets6u9ehhPayyffFUVD4KVw4yqNNcU44BT0hphvjrovZWED/sTXy0jtue4FZmL6e6lBFT1kgXQJrIgNympUUFsc99WHsZ7h/iama5lg+wxuAV4TLtJOCo2HAJDA/0U/Rmp63jtYv5ZzMQMM9vPpyAw8MUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lz4VetPnBLpKEZ6MbxjV+9xPr+XxcPib2X3D0MCIlf8=;
 b=dm2XES0JOdwv+Lr0w31bEEo4hqZ9qMzwWEf1PWKWIQ/2Guv9ek2yNIBcAG+yl0NRqjoO8JEiUfXcSGrau/CdzgkajKYrsmUjIdeMlOu0n//CsJR0K58blUoO6vZJoxZ3uTKyI5u7fVKqgtrMbVydEz7wEdkY1JslGJZLiTaZtDBz7Wt/aJH1U4DthV0YWyrpNbMHb2BEztwRmq02PYEmKhzKMfPO15qii4+bNvXcynZO3OQwYBLuxigGrTLnHnQxHhcJBTVyYwjWCMipviWdAdJWL5Z/nbYmgF+FRCN+PYY8UKrKiSxv4R5597fxqASvqlUDqPdvWbwVBGQ8GzGRxg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz4VetPnBLpKEZ6MbxjV+9xPr+XxcPib2X3D0MCIlf8=;
 b=8Mw/Y9bdJNHco1uqmCOZ6nd1tpLp5mSRKkF5xhv/jM6wdMdHm61BR05G+R5567ZY1pjGHv1DYdX7l0B0tZPT9O1lq/GxkV4LMcXIMKS0apZfEKcY3y/9jqjlBkbAG9k4k5IwFqEhpGoUgnUPLlJIqEOxN08Zcbfe10ncbfCtF14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed165d5ef3ab6385
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1I43oV6ndHjbvMUzXhXOfRwJlv7J/DkFkBlq8WhHfasGZLIEDh2HXpUyZhZVU2OCPkY1oNKhYJpZI/OwLH1Y0AfZetXF352cGiqasNg/cz7BSLdtlGcCZo3beKYcnyuGZXEZb1LXmo98fCrvrL1ALGZdwmwcEX75yiJIWXhpocy7YO0AMjsM8bLMapNDI0DGFyGtw+15VLR5yvkKhP7R8T9vofkfT0fJTNvCyXZtZ5Q/gYb5miJDtsl36yM984xRjz3QXM7UN1KbtlwlapB1OjlN28agzyUfz0fCEGquLpfnraDzG20ZXJXk/CNBks0lxVSq17oGmBvlsyAs+MCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lz4VetPnBLpKEZ6MbxjV+9xPr+XxcPib2X3D0MCIlf8=;
 b=LTp/9fCZXh1uh5+KahezbwxnKAb1j9FyRy2lM4T5uQWhk53NTpvtbvPxJnrpCuIts08Y5A0PhmL6Z/JpOUuVrRkykrHjCBWXBMLHNaSJHoKdGvhm96HIQBCmMiFK6R1N3q0riLyTWpw/Z1DKuNYFBtLmshjCsCt3M/xOnsxdrs+5CSwV88z9u9EQNhm08ZneNoA6sG8/uGqPLbht5knL7J6IZiMWkcnIqaswavJDjk1//MlP8jP5Q4v7JwhU3pkmSdxHpPHAOuEty6Sys/m/tcuOPsRZmq/mp6uufORYNdts5yfRleiChc08o4G5qgUqt7Y3Bqt+Nui6gcrUuWJuOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz4VetPnBLpKEZ6MbxjV+9xPr+XxcPib2X3D0MCIlf8=;
 b=8Mw/Y9bdJNHco1uqmCOZ6nd1tpLp5mSRKkF5xhv/jM6wdMdHm61BR05G+R5567ZY1pjGHv1DYdX7l0B0tZPT9O1lq/GxkV4LMcXIMKS0apZfEKcY3y/9jqjlBkbAG9k4k5IwFqEhpGoUgnUPLlJIqEOxN08Zcbfe10ncbfCtF14=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3] xen: Add MISRA support to cppcheck make rule
Thread-Topic: [PATCH v3] xen: Add MISRA support to cppcheck make rule
Thread-Index: AQHYfKpzLyGOfeb87kCDJ/BIB2eZQa1anOUAgACd+AA=
Date: Wed, 22 Jun 2022 09:26:07 +0000
Message-ID: <FE2CD795-09AC-4AD0-8F08-8320FE7122C5@arm.com>
References:
 <82a29dff7a0da97cc6ad9d247a97372bcf71f17c.1654850751.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2206211658480.788376@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2206211658480.788376@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ad3ebfc9-5e19-4aee-66bc-08da5431460e
x-ms-traffictypediagnostic:
	AM0PR08MB3123:EE_|AM5EUR03FT027:EE_|DB6PR0802MB2198:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB21989567F2A634C62FA6F3419DB29@DB6PR0802MB2198.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BKGq4haIyPvsZLSEK5GikNR5ddbOw2U4LCK2per6Ek0h2BOZo7K5UQ6MB3rVL536rjSgLld9n6IPCRVCgY4XQbxNR/H9xezCxPHQIGxnP3DHymmeqGL2uwPn3tvcnHlRT1jhNmszFCVTNspV3efwbFBeJboncwrEw8lMVKJcI7AcVBmPRcCA6nJ4CZP1AK0R+NplADKl09TLaNL0WVCuyZdr6GmdcQ+C2tAzB+RVDm+NKUPSRRhYX++0LVwogBdR5YScB3wBOqzUn6F3/Onb33PNafuqlD8LVN0B4FXrOL1QmwyEAeliAFIiSWjfo+0M2NrBhAi4BlWyvB9o7myvF9ku5Rb6T+28tDIrXvz4rL6K6jppKvLfOIysq9J3Lb+saJD2BJjVjPblMrQoZxHSmO053JljiOtvPa2zFV8M/eOLQV52I9w2H8V1cC5zzoh9ComlYZTEBqN1vdWvKG88Zzp8ZArKw7fuYp47ySNU16kBqe0LvSfS2E+y3rnLGkJXuc69va8/m3VTlWJ0AEAnK1XztCoPqjFQbsAX7kzWsS4vX9I1XuzTFDZsJCMccr8Fl61sr8vC8zrlBThS1JSlZcv7vop+6NLwFb21hi1T9kXjd68S4qkYYYBBzw0W3OQHCfeF2wGfEC0p2Q3K5rHvHQPMzvZpOymcz8Tgj18A7+n0xDqUE9aC+HnSBWz5q0q07J/I4JPNEeR/ttvevN7bY5o6vgUgW140QXAM4rqxUtKuujr/JW0hFxeLv9FOZyd5ckv3wn01M1emORn/ZdrYlzCmX3ENZ2YtfSgbFizlA7M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(2616005)(41300700001)(71200400001)(36756003)(76116006)(66556008)(4326008)(6916009)(8676002)(66946007)(186003)(6512007)(64756008)(91956017)(66476007)(54906003)(66446008)(316002)(38100700002)(2906002)(86362001)(478600001)(6486002)(26005)(53546011)(6506007)(8936002)(38070700005)(83380400001)(33656002)(5660300002)(30864003)(122000001)(45980500001)(579004);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BAD2DA6A5D51894695EBD847514B758D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3123
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e86fbd0f-4562-4b3d-f211-08da54313c88
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FuxtiyIqFAkMJhJy3aKyr3q5/qIzK+UdDte+TNut5eEhLsrrFQ2c1gU2eT4+xJdRbHaJ9VXcNjOPv6XbGRdYczcGakOBG1AQOmarGjqibKEVWJHiC9FNfCBvy4H0rQcR8alzdSIjFRfysck7UcwZ7Sgp5uDjhCoCX4cPe5Tf1G6Gx8NhrBmKGpGyUCQP4duCqKmD8jsCH/zFOCsJmwUJpd7hUNQ4sZwi3EzAn/AwvmvAk1pk3NCBl6avCKrfe8gRIGRrbzQKbVZnVY6vCiltSskiFHH8HPweHZU1mWD9IZ6UI1WiqsRWwidqgOaz+M2kdqChdOZrD7piKFcdiqLHozu/KPGX8feDxa+kG8EuK1xUZpJJcp8wF0hQezp9xjxs3AFdrkjE7Rx5esgQeasDbWfG5qPdEP3mc5LkbrTDluJxzkS3aeLWajEtmpcwN6nZrbuHyPvZEJZ6qdQWZZlwOHWCRplIgajmHhVZypMo1Xoo4dVFdvsw839SjITf7CRjeBGk9IVdbEQ+SXk1dNJBAdeHbpX03FI9uWtcfrVgQet9eluDeSr9mhRuq+G10NQWqSFL5ATbemu4jB/Rb2LK0nRKiERHllf//WA+o1XG4u4RsUfGYF6Y4WWVcdOcj/9S0ydqF6H3Z2ZilLxGDM69LwQQlDMtg9Sq7MLaJoJBrukvVCwOQ+UFfvg0nq7mxWON/UZsalV9es6pOBxt5mD0EuetxcywhuNhhQc8ePZUlaUeP+bbELzmswXMR+v6pHZGj87Pdall5YLp4TSo5mi2dw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966006)(40470700004)(36840700001)(53546011)(26005)(41300700001)(336012)(2616005)(82740400003)(186003)(70206006)(6506007)(81166007)(47076005)(356005)(83380400001)(6512007)(36860700001)(4326008)(36756003)(40480700001)(8936002)(86362001)(6862004)(33656002)(30864003)(8676002)(478600001)(2906002)(54906003)(40460700003)(316002)(6486002)(82310400005)(5660300002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 09:26:23.1044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3ebfc9-5e19-4aee-66bc-08da5431460e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2198

Hi Stefano,

> On 22 Jun 2022, at 01:00, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Fri, 10 Jun 2022, Bertrand Marquis wrote:
>> cppcheck MISRA addon can be used to check for non compliance to some of
>> the MISRA standard rules.
>>=20
>> Add a CPPCHECK_MISRA variable that can be set to "y" using make command
>> line to generate a cppcheck report including cppcheck misra checks.
>>=20
>> When MISRA checking is enabled, a file with a text description suitable
>> for cppcheck misra addon is generated out of Xen documentation file
>> which lists the rules followed by Xen (docs/misra/rules.rst).
>>=20
>> By default MISRA checking is turned off.
>>=20
>> While adding cppcheck-misra files to gitignore, also fix the missing /
>> for htmlreport gitignore
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Hi Bertrand,
>=20
> I tried this patch and I am a bit confused by the output
> cppcheck-misra.txt file that I get (appended.)
>=20
> I can see that there are all the rules from docs/misra/rules.rst as it
> should be together with the one line summary, but there are also a bunch
> of additional rules not present in docs/misra/rules.rst. Starting from
> Rule 1.1 all the way to Rule 21.21. Is the expected?

To make cppcheck happy I need to give a text for all rules so the python sc=
ript is generating a dummy sentence for not declared Misra rules to prevent=
 cppcheck warnings. To make it simpler I just did it for 1 to 22 for main a=
nd sub numbers.

So yes this is expected.

Cheers
Bertrand


>=20
> Cheers,
>=20
> Stefano
>=20
>=20
> Appendix A Summary of guidelines
> Rule 2.1 Required
> All source files shall compile without any compilation errors (Misra rule=
 2.1)
> Rule 4.7 Required
> If a function returns error information then that error information shall=
 be tested (Misra rule 4.7)
> Rule 4.10 Required
> Precautions shall be taken in order to prevent the contents of a header f=
ile being included more than once (Misra rule 4.10)
> Rule 4.14 Required
> The validity of values received from external sources shall be checked (M=
isra rule 4.14)
> Rule 1.3 Required
> There shall be no occurrence of undefined or critical unspecified behavio=
ur (Misra rule 1.3)
> Rule 3.2 Required
> Line-splicing shall not be used in // comments (Misra rule 3.2)
> Rule 5.1 Required
> External identifiers shall be distinct (Misra rule 5.1)
> Rule 5.2 Required
> Identifiers declared in the same scope and name space shall be distinct (=
Misra rule 5.2)
> Rule 5.3 Required
> An identifier declared in an inner scope shall not hide an identifier dec=
lared in an outer scope (Misra rule 5.3)
> Rule 5.4 Required
> Macro identifiers shall be distinct (Misra rule 5.4)
> Rule 6.2 Required
> Single-bit named bit fields shall not be of a signed type (Misra rule 6.2=
)
> Rule 8.1 Required
> Types shall be explicitly specified (Misra rule 8.1)
> Rule 8.4 Required
> A compatible declaration shall be visible when an object or function with=
 external linkage is defined (Misra rule 8.4)
> Rule 8.5 Required
> An external object or function shall be declared once in one and only one=
 file (Misra rule 8.5)
> Rule 8.6 Required
> An identifier with external linkage shall have exactly one external defin=
ition (Misra rule 8.6)
> Rule 8.8 Required
> The static storage class specifier shall be used in all declarations of o=
bjects and functions that have internal linkage (Misra rule 8.8)
> Rule 8.10 Required
> An inline function shall be declared with the static storage class (Misra=
 rule 8.10)
> Rule 8.12 Required
> Within an enumerator list the value of an implicitly-specified enumeratio=
n constant shall be unique (Misra rule 8.12)
> Rule 9.1 Mandatory
> The value of an object with automatic storage duration shall not be read =
before it has been set (Misra rule 9.1)
> Rule 9.2 Required
> The initializer for an aggregate or union shall be enclosed in braces (Mi=
sra rule 9.2)
> Rule 13.6 Mandatory
> The operand of the sizeof operator shall not contain any expression which=
 has potential side effects (Misra rule 13.6)
> Rule 14.1 Required
> A loop counter shall not have essentially floating type (Misra rule 14.1)
> Rule 16.7 Required
> A switch-expression shall not have essentially Boolean type (Misra rule 1=
6.7)
> Rule 17.3 Mandatory
> A function shall not be declared implicitly (Misra rule 17.3)
> Rule 17.4 Mandatory
> All exit paths from a function with non-void return type shall have an ex=
plicit return statement with an expression (Misra rule 17.4)
> Rule 20.7 Required
> Expressions resulting from the expansion of macro parameters shall be enc=
losed in parentheses (Misra rule 20.7)
> Rule 20.13 Required
> A line whose first token is # shall be a valid preprocessing directive (M=
isra rule 20.13)
> Rule 20.14 Required
> All #else #elif and #endif preprocessor directives shall reside in the sa=
me file as the #if #ifdef or #ifndef directive to which they are related (M=
isra rule 20.14)
> Rule 1.1
> No description for rule 1.1
> Rule 1.2
> No description for rule 1.2
> Rule 1.4
> No description for rule 1.4
> Rule 1.5
> No description for rule 1.5
> Rule 1.6
> No description for rule 1.6
> Rule 1.7
> No description for rule 1.7
> Rule 1.8
> No description for rule 1.8
> Rule 1.9
> No description for rule 1.9
> Rule 1.10
> No description for rule 1.10
> Rule 1.11
> No description for rule 1.11
> Rule 1.12
> No description for rule 1.12
> Rule 1.13
> No description for rule 1.13
> Rule 1.14
> No description for rule 1.14
> Rule 1.15
> No description for rule 1.15
> Rule 1.16
> No description for rule 1.16
> Rule 1.17
> No description for rule 1.17
> Rule 1.18
> No description for rule 1.18
> Rule 1.19
> No description for rule 1.19
> Rule 1.20
> No description for rule 1.20
> Rule 1.21
> No description for rule 1.21
> Rule 2.2
> No description for rule 2.2
> Rule 2.3
> No description for rule 2.3
> Rule 2.4
> No description for rule 2.4
> Rule 2.5
> No description for rule 2.5
> Rule 2.6
> No description for rule 2.6
> Rule 2.7
> No description for rule 2.7
> Rule 2.8
> No description for rule 2.8
> Rule 2.9
> No description for rule 2.9
> Rule 2.10
> No description for rule 2.10
> Rule 2.11
> No description for rule 2.11
> Rule 2.12
> No description for rule 2.12
> Rule 2.13
> No description for rule 2.13
> Rule 2.14
> No description for rule 2.14
> Rule 2.15
> No description for rule 2.15
> Rule 2.16
> No description for rule 2.16
> Rule 2.17
> No description for rule 2.17
> Rule 2.18
> No description for rule 2.18
> Rule 2.19
> No description for rule 2.19
> Rule 2.20
> No description for rule 2.20
> Rule 2.21
> No description for rule 2.21
> Rule 3.1
> No description for rule 3.1
> Rule 3.3
> No description for rule 3.3
> Rule 3.4
> No description for rule 3.4
> Rule 3.5
> No description for rule 3.5
> Rule 3.6
> No description for rule 3.6
> Rule 3.7
> No description for rule 3.7
> Rule 3.8
> No description for rule 3.8
> Rule 3.9
> No description for rule 3.9
> Rule 3.10
> No description for rule 3.10
> Rule 3.11
> No description for rule 3.11
> Rule 3.12
> No description for rule 3.12
> Rule 3.13
> No description for rule 3.13
> Rule 3.14
> No description for rule 3.14
> Rule 3.15
> No description for rule 3.15
> Rule 3.16
> No description for rule 3.16
> Rule 3.17
> No description for rule 3.17
> Rule 3.18
> No description for rule 3.18
> Rule 3.19
> No description for rule 3.19
> Rule 3.20
> No description for rule 3.20
> Rule 3.21
> No description for rule 3.21
> Rule 4.1
> No description for rule 4.1
> Rule 4.2
> No description for rule 4.2
> Rule 4.3
> No description for rule 4.3
> Rule 4.4
> No description for rule 4.4
> Rule 4.5
> No description for rule 4.5
> Rule 4.6
> No description for rule 4.6
> Rule 4.8
> No description for rule 4.8
> Rule 4.9
> No description for rule 4.9
> Rule 4.11
> No description for rule 4.11
> Rule 4.12
> No description for rule 4.12
> Rule 4.13
> No description for rule 4.13
> Rule 4.15
> No description for rule 4.15
> Rule 4.16
> No description for rule 4.16
> Rule 4.17
> No description for rule 4.17
> Rule 4.18
> No description for rule 4.18
> Rule 4.19
> No description for rule 4.19
> Rule 4.20
> No description for rule 4.20
> Rule 4.21
> No description for rule 4.21
> Rule 5.5
> No description for rule 5.5
> Rule 5.6
> No description for rule 5.6
> Rule 5.7
> No description for rule 5.7
> Rule 5.8
> No description for rule 5.8
> Rule 5.9
> No description for rule 5.9
> Rule 5.10
> No description for rule 5.10
> Rule 5.11
> No description for rule 5.11
> Rule 5.12
> No description for rule 5.12
> Rule 5.13
> No description for rule 5.13
> Rule 5.14
> No description for rule 5.14
> Rule 5.15
> No description for rule 5.15
> Rule 5.16
> No description for rule 5.16
> Rule 5.17
> No description for rule 5.17
> Rule 5.18
> No description for rule 5.18
> Rule 5.19
> No description for rule 5.19
> Rule 5.20
> No description for rule 5.20
> Rule 5.21
> No description for rule 5.21
> Rule 6.1
> No description for rule 6.1
> Rule 6.3
> No description for rule 6.3
> Rule 6.4
> No description for rule 6.4
> Rule 6.5
> No description for rule 6.5
> Rule 6.6
> No description for rule 6.6
> Rule 6.7
> No description for rule 6.7
> Rule 6.8
> No description for rule 6.8
> Rule 6.9
> No description for rule 6.9
> Rule 6.10
> No description for rule 6.10
> Rule 6.11
> No description for rule 6.11
> Rule 6.12
> No description for rule 6.12
> Rule 6.13
> No description for rule 6.13
> Rule 6.14
> No description for rule 6.14
> Rule 6.15
> No description for rule 6.15
> Rule 6.16
> No description for rule 6.16
> Rule 6.17
> No description for rule 6.17
> Rule 6.18
> No description for rule 6.18
> Rule 6.19
> No description for rule 6.19
> Rule 6.20
> No description for rule 6.20
> Rule 6.21
> No description for rule 6.21
> Rule 7.1
> No description for rule 7.1
> Rule 7.2
> No description for rule 7.2
> Rule 7.3
> No description for rule 7.3
> Rule 7.4
> No description for rule 7.4
> Rule 7.5
> No description for rule 7.5
> Rule 7.6
> No description for rule 7.6
> Rule 7.7
> No description for rule 7.7
> Rule 7.8
> No description for rule 7.8
> Rule 7.9
> No description for rule 7.9
> Rule 7.10
> No description for rule 7.10
> Rule 7.11
> No description for rule 7.11
> Rule 7.12
> No description for rule 7.12
> Rule 7.13
> No description for rule 7.13
> Rule 7.14
> No description for rule 7.14
> Rule 7.15
> No description for rule 7.15
> Rule 7.16
> No description for rule 7.16
> Rule 7.17
> No description for rule 7.17
> Rule 7.18
> No description for rule 7.18
> Rule 7.19
> No description for rule 7.19
> Rule 7.20
> No description for rule 7.20
> Rule 7.21
> No description for rule 7.21
> Rule 8.2
> No description for rule 8.2
> Rule 8.3
> No description for rule 8.3
> Rule 8.7
> No description for rule 8.7
> Rule 8.9
> No description for rule 8.9
> Rule 8.11
> No description for rule 8.11
> Rule 8.13
> No description for rule 8.13
> Rule 8.14
> No description for rule 8.14
> Rule 8.15
> No description for rule 8.15
> Rule 8.16
> No description for rule 8.16
> Rule 8.17
> No description for rule 8.17
> Rule 8.18
> No description for rule 8.18
> Rule 8.19
> No description for rule 8.19
> Rule 8.20
> No description for rule 8.20
> Rule 8.21
> No description for rule 8.21
> Rule 9.3
> No description for rule 9.3
> Rule 9.4
> No description for rule 9.4
> Rule 9.5
> No description for rule 9.5
> Rule 9.6
> No description for rule 9.6
> Rule 9.7
> No description for rule 9.7
> Rule 9.8
> No description for rule 9.8
> Rule 9.9
> No description for rule 9.9
> Rule 9.10
> No description for rule 9.10
> Rule 9.11
> No description for rule 9.11
> Rule 9.12
> No description for rule 9.12
> Rule 9.13
> No description for rule 9.13
> Rule 9.14
> No description for rule 9.14
> Rule 9.15
> No description for rule 9.15
> Rule 9.16
> No description for rule 9.16
> Rule 9.17
> No description for rule 9.17
> Rule 9.18
> No description for rule 9.18
> Rule 9.19
> No description for rule 9.19
> Rule 9.20
> No description for rule 9.20
> Rule 9.21
> No description for rule 9.21
> Rule 10.1
> No description for rule 10.1
> Rule 10.2
> No description for rule 10.2
> Rule 10.3
> No description for rule 10.3
> Rule 10.4
> No description for rule 10.4
> Rule 10.5
> No description for rule 10.5
> Rule 10.6
> No description for rule 10.6
> Rule 10.7
> No description for rule 10.7
> Rule 10.8
> No description for rule 10.8
> Rule 10.9
> No description for rule 10.9
> Rule 10.10
> No description for rule 10.10
> Rule 10.11
> No description for rule 10.11
> Rule 10.12
> No description for rule 10.12
> Rule 10.13
> No description for rule 10.13
> Rule 10.14
> No description for rule 10.14
> Rule 10.15
> No description for rule 10.15
> Rule 10.16
> No description for rule 10.16
> Rule 10.17
> No description for rule 10.17
> Rule 10.18
> No description for rule 10.18
> Rule 10.19
> No description for rule 10.19
> Rule 10.20
> No description for rule 10.20
> Rule 10.21
> No description for rule 10.21
> Rule 11.1
> No description for rule 11.1
> Rule 11.2
> No description for rule 11.2
> Rule 11.3
> No description for rule 11.3
> Rule 11.4
> No description for rule 11.4
> Rule 11.5
> No description for rule 11.5
> Rule 11.6
> No description for rule 11.6
> Rule 11.7
> No description for rule 11.7
> Rule 11.8
> No description for rule 11.8
> Rule 11.9
> No description for rule 11.9
> Rule 11.10
> No description for rule 11.10
> Rule 11.11
> No description for rule 11.11
> Rule 11.12
> No description for rule 11.12
> Rule 11.13
> No description for rule 11.13
> Rule 11.14
> No description for rule 11.14
> Rule 11.15
> No description for rule 11.15
> Rule 11.16
> No description for rule 11.16
> Rule 11.17
> No description for rule 11.17
> Rule 11.18
> No description for rule 11.18
> Rule 11.19
> No description for rule 11.19
> Rule 11.20
> No description for rule 11.20
> Rule 11.21
> No description for rule 11.21
> Rule 12.1
> No description for rule 12.1
> Rule 12.2
> No description for rule 12.2
> Rule 12.3
> No description for rule 12.3
> Rule 12.4
> No description for rule 12.4
> Rule 12.5
> No description for rule 12.5
> Rule 12.6
> No description for rule 12.6
> Rule 12.7
> No description for rule 12.7
> Rule 12.8
> No description for rule 12.8
> Rule 12.9
> No description for rule 12.9
> Rule 12.10
> No description for rule 12.10
> Rule 12.11
> No description for rule 12.11
> Rule 12.12
> No description for rule 12.12
> Rule 12.13
> No description for rule 12.13
> Rule 12.14
> No description for rule 12.14
> Rule 12.15
> No description for rule 12.15
> Rule 12.16
> No description for rule 12.16
> Rule 12.17
> No description for rule 12.17
> Rule 12.18
> No description for rule 12.18
> Rule 12.19
> No description for rule 12.19
> Rule 12.20
> No description for rule 12.20
> Rule 12.21
> No description for rule 12.21
> Rule 13.1
> No description for rule 13.1
> Rule 13.2
> No description for rule 13.2
> Rule 13.3
> No description for rule 13.3
> Rule 13.4
> No description for rule 13.4
> Rule 13.5
> No description for rule 13.5
> Rule 13.7
> No description for rule 13.7
> Rule 13.8
> No description for rule 13.8
> Rule 13.9
> No description for rule 13.9
> Rule 13.10
> No description for rule 13.10
> Rule 13.11
> No description for rule 13.11
> Rule 13.12
> No description for rule 13.12
> Rule 13.13
> No description for rule 13.13
> Rule 13.14
> No description for rule 13.14
> Rule 13.15
> No description for rule 13.15
> Rule 13.16
> No description for rule 13.16
> Rule 13.17
> No description for rule 13.17
> Rule 13.18
> No description for rule 13.18
> Rule 13.19
> No description for rule 13.19
> Rule 13.20
> No description for rule 13.20
> Rule 13.21
> No description for rule 13.21
> Rule 14.2
> No description for rule 14.2
> Rule 14.3
> No description for rule 14.3
> Rule 14.4
> No description for rule 14.4
> Rule 14.5
> No description for rule 14.5
> Rule 14.6
> No description for rule 14.6
> Rule 14.7
> No description for rule 14.7
> Rule 14.8
> No description for rule 14.8
> Rule 14.9
> No description for rule 14.9
> Rule 14.10
> No description for rule 14.10
> Rule 14.11
> No description for rule 14.11
> Rule 14.12
> No description for rule 14.12
> Rule 14.13
> No description for rule 14.13
> Rule 14.14
> No description for rule 14.14
> Rule 14.15
> No description for rule 14.15
> Rule 14.16
> No description for rule 14.16
> Rule 14.17
> No description for rule 14.17
> Rule 14.18
> No description for rule 14.18
> Rule 14.19
> No description for rule 14.19
> Rule 14.20
> No description for rule 14.20
> Rule 14.21
> No description for rule 14.21
> Rule 15.1
> No description for rule 15.1
> Rule 15.2
> No description for rule 15.2
> Rule 15.3
> No description for rule 15.3
> Rule 15.4
> No description for rule 15.4
> Rule 15.5
> No description for rule 15.5
> Rule 15.6
> No description for rule 15.6
> Rule 15.7
> No description for rule 15.7
> Rule 15.8
> No description for rule 15.8
> Rule 15.9
> No description for rule 15.9
> Rule 15.10
> No description for rule 15.10
> Rule 15.11
> No description for rule 15.11
> Rule 15.12
> No description for rule 15.12
> Rule 15.13
> No description for rule 15.13
> Rule 15.14
> No description for rule 15.14
> Rule 15.15
> No description for rule 15.15
> Rule 15.16
> No description for rule 15.16
> Rule 15.17
> No description for rule 15.17
> Rule 15.18
> No description for rule 15.18
> Rule 15.19
> No description for rule 15.19
> Rule 15.20
> No description for rule 15.20
> Rule 15.21
> No description for rule 15.21
> Rule 16.1
> No description for rule 16.1
> Rule 16.2
> No description for rule 16.2
> Rule 16.3
> No description for rule 16.3
> Rule 16.4
> No description for rule 16.4
> Rule 16.5
> No description for rule 16.5
> Rule 16.6
> No description for rule 16.6
> Rule 16.8
> No description for rule 16.8
> Rule 16.9
> No description for rule 16.9
> Rule 16.10
> No description for rule 16.10
> Rule 16.11
> No description for rule 16.11
> Rule 16.12
> No description for rule 16.12
> Rule 16.13
> No description for rule 16.13
> Rule 16.14
> No description for rule 16.14
> Rule 16.15
> No description for rule 16.15
> Rule 16.16
> No description for rule 16.16
> Rule 16.17
> No description for rule 16.17
> Rule 16.18
> No description for rule 16.18
> Rule 16.19
> No description for rule 16.19
> Rule 16.20
> No description for rule 16.20
> Rule 16.21
> No description for rule 16.21
> Rule 17.1
> No description for rule 17.1
> Rule 17.2
> No description for rule 17.2
> Rule 17.5
> No description for rule 17.5
> Rule 17.6
> No description for rule 17.6
> Rule 17.7
> No description for rule 17.7
> Rule 17.8
> No description for rule 17.8
> Rule 17.9
> No description for rule 17.9
> Rule 17.10
> No description for rule 17.10
> Rule 17.11
> No description for rule 17.11
> Rule 17.12
> No description for rule 17.12
> Rule 17.13
> No description for rule 17.13
> Rule 17.14
> No description for rule 17.14
> Rule 17.15
> No description for rule 17.15
> Rule 17.16
> No description for rule 17.16
> Rule 17.17
> No description for rule 17.17
> Rule 17.18
> No description for rule 17.18
> Rule 17.19
> No description for rule 17.19
> Rule 17.20
> No description for rule 17.20
> Rule 17.21
> No description for rule 17.21
> Rule 18.1
> No description for rule 18.1
> Rule 18.2
> No description for rule 18.2
> Rule 18.3
> No description for rule 18.3
> Rule 18.4
> No description for rule 18.4
> Rule 18.5
> No description for rule 18.5
> Rule 18.6
> No description for rule 18.6
> Rule 18.7
> No description for rule 18.7
> Rule 18.8
> No description for rule 18.8
> Rule 18.9
> No description for rule 18.9
> Rule 18.10
> No description for rule 18.10
> Rule 18.11
> No description for rule 18.11
> Rule 18.12
> No description for rule 18.12
> Rule 18.13
> No description for rule 18.13
> Rule 18.14
> No description for rule 18.14
> Rule 18.15
> No description for rule 18.15
> Rule 18.16
> No description for rule 18.16
> Rule 18.17
> No description for rule 18.17
> Rule 18.18
> No description for rule 18.18
> Rule 18.19
> No description for rule 18.19
> Rule 18.20
> No description for rule 18.20
> Rule 18.21
> No description for rule 18.21
> Rule 19.1
> No description for rule 19.1
> Rule 19.2
> No description for rule 19.2
> Rule 19.3
> No description for rule 19.3
> Rule 19.4
> No description for rule 19.4
> Rule 19.5
> No description for rule 19.5
> Rule 19.6
> No description for rule 19.6
> Rule 19.7
> No description for rule 19.7
> Rule 19.8
> No description for rule 19.8
> Rule 19.9
> No description for rule 19.9
> Rule 19.10
> No description for rule 19.10
> Rule 19.11
> No description for rule 19.11
> Rule 19.12
> No description for rule 19.12
> Rule 19.13
> No description for rule 19.13
> Rule 19.14
> No description for rule 19.14
> Rule 19.15
> No description for rule 19.15
> Rule 19.16
> No description for rule 19.16
> Rule 19.17
> No description for rule 19.17
> Rule 19.18
> No description for rule 19.18
> Rule 19.19
> No description for rule 19.19
> Rule 19.20
> No description for rule 19.20
> Rule 19.21
> No description for rule 19.21
> Rule 20.1
> No description for rule 20.1
> Rule 20.2
> No description for rule 20.2
> Rule 20.3
> No description for rule 20.3
> Rule 20.4
> No description for rule 20.4
> Rule 20.5
> No description for rule 20.5
> Rule 20.6
> No description for rule 20.6
> Rule 20.8
> No description for rule 20.8
> Rule 20.9
> No description for rule 20.9
> Rule 20.10
> No description for rule 20.10
> Rule 20.11
> No description for rule 20.11
> Rule 20.12
> No description for rule 20.12
> Rule 20.15
> No description for rule 20.15
> Rule 20.16
> No description for rule 20.16
> Rule 20.17
> No description for rule 20.17
> Rule 20.18
> No description for rule 20.18
> Rule 20.19
> No description for rule 20.19
> Rule 20.20
> No description for rule 20.20
> Rule 20.21
> No description for rule 20.21
> Rule 21.1
> No description for rule 21.1
> Rule 21.2
> No description for rule 21.2
> Rule 21.3
> No description for rule 21.3
> Rule 21.4
> No description for rule 21.4
> Rule 21.5
> No description for rule 21.5
> Rule 21.6
> No description for rule 21.6
> Rule 21.7
> No description for rule 21.7
> Rule 21.8
> No description for rule 21.8
> Rule 21.9
> No description for rule 21.9
> Rule 21.10
> No description for rule 21.10
> Rule 21.11
> No description for rule 21.11
> Rule 21.12
> No description for rule 21.12
> Rule 21.13
> No description for rule 21.13
> Rule 21.14
> No description for rule 21.14
> Rule 21.15
> No description for rule 21.15
> Rule 21.16
> No description for rule 21.16
> Rule 21.17
> No description for rule 21.17
> Rule 21.18
> No description for rule 21.18
> Rule 21.19
> No description for rule 21.19
> Rule 21.20
> No description for rule 21.20
> Rule 21.21
> No description for rule 21.21
> Appendix B


