Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD15581150
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 12:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375133.607445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGHvP-0004kx-JJ; Tue, 26 Jul 2022 10:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375133.607445; Tue, 26 Jul 2022 10:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGHvP-0004iN-Fe; Tue, 26 Jul 2022 10:36:27 +0000
Received: by outflank-mailman (input) for mailman id 375133;
 Tue, 26 Jul 2022 10:36:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WF/t=X7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oGHvO-0004iH-0C
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 10:36:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbd47056-0cce-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 12:36:24 +0200 (CEST)
Received: from FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::18)
 by VI1PR08MB5424.eurprd08.prod.outlook.com (2603:10a6:803:136::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 10:36:21 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4b:cafe::32) by FR3P281CA0055.outlook.office365.com
 (2603:10a6:d10:4b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.13 via Frontend
 Transport; Tue, 26 Jul 2022 10:36:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Tue, 26 Jul 2022 10:36:20 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Tue, 26 Jul 2022 10:36:20 +0000
Received: from bc0d96d79358.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0EE2A436-CE20-4AF1-BF3E-91C05A86B91E.1; 
 Tue, 26 Jul 2022 10:36:14 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc0d96d79358.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Jul 2022 10:36:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB4316.eurprd08.prod.outlook.com (2603:10a6:10:c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Tue, 26 Jul
 2022 10:36:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 10:36:11 +0000
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
X-Inumbo-ID: cbd47056-0cce-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RqzklDDOYzlaG1jRPOSbbbNUpRP+vtW7yeAattqnhoaCwP6dGPU4EqhWQlJyRies8K038LP4DR2pLbC4s1MpgP3kWQoRvbJTQnJhqr2FKelFViwKT/CMkzzoOh5/TqwHsGbCrXzp0h/jwoes3QxEFmYDUG92/tmTYjmUOwxx0FP/kVzOjdJY0yzoISVngl/2z2DfdgUDppVBpcnZBdDoarKH9D1rJlA24u98xzYOY++OhYyF4ocv4vCMijVQlC/cTj5yBG8eXV4ex99QSfmnngTW+5JHiJXeAZ8eCydec9V2fkNmByjrn1LF0cB0zg/SqVckyUbP/6x7DJzQGW9OMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlxzfnK1CLj6Rmh5eUlspXLw61vZ68+AkKn0xuF1YZE=;
 b=WMOAK4TEiVIrcw07spRG1G0biDxCbmZl0A/itDIQeFJrzgDqzJqugqQiMLI6HaiV4KFxSXwIXSC8vxXv0zS/X4KCsWDu8hGpyuw47ASaS8U4hdFIU2ngJCw+83KHQc3asiQLMU7pOTOkRSi7GVvAN3ccZyhwbt7NS61mucKYKpLHJt49hNjxR2NIh7QyBEbNdei5MpwjkQ2iu12ZKLcvGHwjgelxLeUZibz6WLqUGZDJKiRrguW7cjN7Qr0H1VAyM1Plp7Chff1pkI9DIBQ/k/Bz9iUjb93kd2vza0v6vwOKO49nrE7ig8Fg1hQuLbI2m607zMZe1uRqTo2eF3eVzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlxzfnK1CLj6Rmh5eUlspXLw61vZ68+AkKn0xuF1YZE=;
 b=C+7bqCObP0Mvg86kS5d8NZ3J1brHNS8hgJ+z1YZ8Rp7j2Ek3sGxjiLN/Up6LO+5g27N/9T/QBfuv919cj3N392s1gfj6yXUfWu0cMzMR9E5EyE9+7e29JvSp/SD+r6ZoOV3hL1yOEQA4nZnYi/Mx+3jAOAAKy4mvxjviueSrsoY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f222279b76957e2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nc5Kew39h4bcMrINiXsDmYb3cyw62pB82Vf1x46H94gGish7fZWlLFWP7bZFl2UW9KlNIT7NkAZkBnxiSUwU3QUngR3H6lnkOpLqMr5/U+Q9/hnUASq+DFG0HKxJmQYPXkfiwh4j8r6YduQe1VJ6WJYlpWJFQBfbOuu1UH3LKPk/aSBPO/Dg+DB6a6Qc6hkcgHZ7BBUFSzHsCpCbKiYRQhJqgV76aM9BWGa0mGZNqdolZvdEhby58EVTmItpAo8LAM1C+x/a9xr2j7Gbeka3hkep21CbpwgzC1ED//bJVuScYm62H5ZvRRPRQHwefgyPc2LBZHwLD/Ge+Ebyoo+KgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlxzfnK1CLj6Rmh5eUlspXLw61vZ68+AkKn0xuF1YZE=;
 b=i95OB/g3O4vKLUlM7WXzd9EwT73+L2HwsSK68rkrEnt7w57rykiPXJ0XNm6dAgBR8ESNnvpOZrf7hG/sTuhQXh8wYFLkImbiYZmJ6psHzNDDprWg1/jKWp5q6fNPk5ei85r8eciBUP8Ewd93d10gg6R0mrq9m18wAYNMBnI38gdYlAZxFF0kSR4PEsE1TWP5i2enRxbQ/hazl6R6kgE0vEb0kE6e8PchQWZoJ6U8uFv9SBGLiHVNChLhIJH4nD/H15t5Escf/Fri4vxlaeMLzdqAARm7QbIk5+KRW9IScWDJJKeb+v1MJkctfGU6tVxNgInVI6jpUFYZHW+axhTSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlxzfnK1CLj6Rmh5eUlspXLw61vZ68+AkKn0xuF1YZE=;
 b=C+7bqCObP0Mvg86kS5d8NZ3J1brHNS8hgJ+z1YZ8Rp7j2Ek3sGxjiLN/Up6LO+5g27N/9T/QBfuv919cj3N392s1gfj6yXUfWu0cMzMR9E5EyE9+7e29JvSp/SD+r6ZoOV3hL1yOEQA4nZnYi/Mx+3jAOAAKy4mvxjviueSrsoY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: Random crash during guest start on x86
Thread-Topic: Random crash during guest start on x86
Thread-Index: AQHYoD5xXkzOB8H120+6SchUWgFyYK2PQysAgAEFgQCAACwUgIAAAc6A
Date: Tue, 26 Jul 2022 10:36:11 +0000
Message-ID: <03648C7A-D7E8-4348-B2CA-43CBAA7FC51A@arm.com>
References: <65C0A220-EC7E-4915-AC45-77D87F4E411E@arm.com>
 <7d816c9d-412a-bcee-f1ab-3b4b46051b8a@suse.com>
 <880625A9-C3C8-4D45-A4E8-BB443E9D4CEF@arm.com>
 <194eaccc-b05f-c1f2-d861-737f3a881966@suse.com>
In-Reply-To: <194eaccc-b05f-c1f2-d861-737f3a881966@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 83d2e774-21d2-4720-90f5-08da6ef2ae37
x-ms-traffictypediagnostic:
	DBBPR08MB4316:EE_|VE1EUR03FT016:EE_|VI1PR08MB5424:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MR6pQBB4flzgFGZFRhQMhzE1KO8mqv5pyFHaKYhcKZapyrsE9Shz6TLQ7JxtsxZU6uqssT8hwwEw+3nkaFVgAJCZq0DGq/wMqbayZ3aso28fLop0iOLzComZYnzl07Kf5v1SgOviwbMFSDX2NvGzc6OrdhmxnouUwIgdhLmStl0uQKf/owdZZLhfySmpGaYkCgqwD2J8kHGnhpU08cF9Q9zu0WcHPHbGP3QuBJWCip6SKIBv0OdbLx96SbjvmA0dnst933NaOkXnsS8W/bvIXWNnD/qyOUe+f44opmtEP1aUrIX/VK4CYa+XH7ElQ54FSg6CmQ/hTBcXf4B52rKllMwFxHYhTgJK1pmB4yenYTmIHBSXRrCxqf2r3+DNrWsDN6eS7o73X3MDmnQNhTOOVYjqEUXOFBuNIBNbs+rRTMPgbFB5BhFtXe2kzAy+xxfQpvq5V0gsJ+QexGBGKMsir0N2VonDIaZZU/wHkuAnDF3+mvO1gZtxXK+0QgfLt9UlD3V03u6GR26BhjChu/ZsiYwbpMiNhu8vbndnvGJ/5wgsF+PrQNL2t1XXOjf7wlgQ9FJbzlvgFtB+P/R/pNSeH+hvCOYLH4Dx8adwsijuWj4TXFlbQ6hVlbFPB/449Fuoo88DVF37j7F1EurWmAIOGQzr8b74ARJbRclrQMGHh4i6y25WJla0bdbZdX6izZVSo817q3CFu1uyao5TAt05bS9sKAQN6KoB55MdKFAEHr0El0u2IZmYvuZ3wcJO9rdkagHNalCcDszb3psG8Hhef6oKW2VLfjp9w3eYF2qjapfhZbhhf92/JXH/9TIEA/w8x3RMCWep4GH9qiAA26add7UKee5Mi43gXh3hp4PeSmux5wNVqYg5jfA3WH5CxFRj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(91956017)(36756003)(76116006)(6512007)(26005)(53546011)(71200400001)(6506007)(64756008)(66946007)(86362001)(66556008)(66446008)(2906002)(66476007)(41300700001)(38070700005)(4326008)(8676002)(6486002)(8936002)(316002)(478600001)(33656002)(186003)(38100700002)(6916009)(2616005)(5660300002)(122000001)(83380400001)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <141B28013CFB5A44914DB519C9952C20@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4316
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81484fd0-d753-4c74-577f-08da6ef2a8b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4YxEmheMOr5Iw73Re4jhB+bwD9C2CHSDcOplILFKtHXzekrHsPc5CLDhvJH4DglhuHhEpIiQkiHnByPK6oMUlBN8UNtmpAl/HH1kP2vVOgt8el+BXxha2oDKL188f/tetPYAObCveMxjzCdkw/FxekdFhzysy4bs3+MHC4Nmjtm4l19p+m4VXoao5AXaOp0gBQJEqgffAZM/cyaf0IsYqNVllQgrtY1tAclDb4Dci5EgXnKG94c+yG9zAtzOaStjj5djD1f5v18a2zSpYNfhHlrVU/Zex6wUlEHO3BicOjVYgFqgsn3lQD2ESvSzodOPJa2XTKacb0MAIR+6tA5cN9LHPeUwdqWTs/W+LCeFYh1WnXib2AXGC03MnS734/VBcqBgs/ZAnOlyFlilbiva/hbsXaKFm84f9vJ0mgDY/kqM+DW1EsYHVf+oFxak0uWG1L51wawH92ZJhlF1CLq2Hf+19ydvYc6CRZ6gZqSrhxmLNFBgLkmq3tGWGbpj/tslQ8zYAJoQsSDVJKns3hL8qFfzZBbypXm8BjLmyDCJCElumFrqOQ/CoVa6GgLAWROrenTkC98GEyBcFoNaIFTX+FnAkwTkLGxWlvjNzz0L9VHJl2TIShgt2MnWqSG8oPkrgYON8CkQzFgtNYIuzvyV46Jt2WJbxbAFD0tNriHqOwT2t7Kq4BS9JRSBNH25n2vTIeCZryuonLwFQqjy4fD7//F13ZMzH/M3mCvyLAcX6iClUiXoD/0XpPzQnVAgEEj1tO9tHzJXVXexlhKGcVj1AIiUEYFnQQgsfCLR7GEFPdErltPQoCF1Z6hoBEu8vDG4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(40470700004)(36840700001)(46966006)(41300700001)(186003)(316002)(54906003)(36756003)(2616005)(40480700001)(356005)(83380400001)(86362001)(81166007)(2906002)(6506007)(36860700001)(82310400005)(82740400003)(8676002)(6486002)(53546011)(70586007)(70206006)(4326008)(478600001)(26005)(40460700003)(5660300002)(47076005)(6862004)(8936002)(336012)(33656002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 10:36:20.8802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d2e774-21d2-4720-90f5-08da6ef2ae37
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5424

Hi Jan,

> On 26 Jul 2022, at 11:29, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 26.07.2022 09:51, Bertrand Marquis wrote:
>>=20
>>=20
>>> On 25 Jul 2022, at 17:16, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 25.07.2022 17:51, Bertrand Marquis wrote:
>>>> On our CI we have randomly a crash during guest boot on x86.
>>>=20
>>> Afaict of a PV guest.
>>>=20
>>>> We are running on qemu x86_64 using Xen staging.
>>>=20
>>> Which may introduce unusual timing. An issue never hit on actual hardwa=
re
>>> _may_ (but doesn't have to be) one in qemu itself.
>>>=20
>>>> The crash is happening randomly (something like 1 out of 20 times).
>>>>=20
>>>> This is always happening on the first guest we start, we never got it =
after first guest was successfully started.
>>>>=20
>>>> Please tell me if you need any other info.
>>>>=20
>>>> Here is the guest kernel log:
>>>> [...]
>>>> [ 6.679020] general protection fault, maybe for address 0x8800: 0000 [=
#1] PREEMPT SMP NOPTI
>>>> [ 6.679020] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.17.6 #1
>>>> [ 6.679020] RIP: e030:error_entry+0xaf/0xe0
>>>> [ 6.679020] Code: 29 89 c8 48 39 84 24 88 00 00 00 74 15 48 81 bc 24 8=
8 00 00 00 63 10 e0 81 75 03 0f 01 f8 90 90 90 c3 48 89 8c 24 88 00 00 00 <=
0f> 01 f8 90 90 90 eb 11 0f 20 d8 90 90 90 90 90 48 25 ff e7 ff ff
>>>=20
>>> This is SWAPGS, which supposedly a PV guest should never hit. Data furt=
her
>>> down suggests the kernel is still in the process of patching alternativ=
es,
>>> which may be the reason for the insn to still be there (being at a poin=
t
>>> where exceptions are still unexpected).
>>=20
>> So the exception path is using alternative code ? Sounds logic with the =
error output.
>> But does explain the original error.
>=20
> SWAPGS sits pretty early on all kernel entry paths. If any instance of it
> is subject to alternatives patching, then prior to patching such paths
> may not be taken when running as PV guest under Xen.
>=20
>>>> [ 6.679020] RSP: e02b:ffffffff82803a90 EFLAGS: 00000046
>>>> [ 6.679020] RAX: 0000000000008800 RBX: 0000000000000000 RCX: ffffffff8=
1e00fa7
>>>> [ 6.679020] RDX: 0000000000000000 RSI: ffffffff81e009f8 RDI: 000000000=
00000eb
>>>> [ 6.679020] RBP: 0000000000000000 R08: 0000000000000000 R09: 000000000=
0000000
>>>> [ 6.679020] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
>>>> [ 6.679020] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
>>>> [ 6.679020] FS: 0000000000000000(0000) GS:ffff88801f200000(0000) knlGS=
:0000000000000000
>>>> [ 6.679020] CS: 10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> [ 6.679020] CR2: 0000000000000000 CR3: 000000000280c000 CR4: 000000000=
0050660
>>>> [ 6.679020] Call Trace:
>>>> [ 6.679020] <TASK>
>>>> [ 6.679020] RIP: e030:native_irq_return_iret+0x0/0x2
>>>> [ 6.679020] Code: 41 5d 41 5c 5d 5b 41 5b 41 5a 41 59 41 58 58 59 5a 5=
e 5f 48 83 c4 08 eb 0a 0f 1f 00 90 66 0f 1f 44 00 00 f6 44 24 20 04 75 02 <=
48> cf 57 0f 01 f8 eb 12 0f 20 df 90 90 90 90 90 48 81 e7 ff e7 ff
>>>> [ 6.679020] RSP: e02b:ffffffff82803b48 EFLAGS: 00000046 ORIG_RAX: 0000=
00000000e030
>>>> [ 6.679020] RAX: 0000000000008800 RBX: ffffffff82803be0 RCX: ffffffff8=
1e00f95
>>>> [ 6.679020] RDX: ffffffff81e00f94 RSI: ffffffff81e00f95 RDI: 000000000=
00000eb
>>>> [ 6.679020] RBP: 00000000000000eb R08: 0000000090001f0f R09: 000000000=
0000007
>>>> [ 6.679020] R10: ffffffff81e00f94 R11: ffffffff8285a6c0 R12: 000000000=
0000000
>>>> [ 6.679020] R13: ffffffff81e00f94 R14: 0000000000000006 R15: 000000000=
0000006
>>>> [ 6.679020] ? asm_exc_general_protection+0x8/0x30
>>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1c/0x27
>>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1c/0x27
>>>> [ 6.679020] RIP: e030:insn_get_opcode.part.0+0xab/0x180
>>>> [ 6.679020] Code: 00 00 8b 43 4c a9 c0 07 08 00 0f 84 bf 00 00 00 c6 4=
3 1c 01 31 c0 5b 5d c3 83 e2 03 be 01 00 00 00 eb b7 89 ef e8 65 e4 ff ff <=
89> 43 4c a8 30 75 21 e9 8e 00 00 00 0f b6 7b 03 40 84 ff 75 73 8b
>>>> [ 6.679020] RSP: e02b:ffffffff82803b70 EFLAGS: 00000246
>>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>>>> [ 6.679020] insn_get_modrm+0x6c/0x120
>>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>>>> [ 6.679020] insn_get_sib+0x40/0x80
>>>> [ 6.679020] insn_get_displacement+0x82/0x100
>>>> [ 6.679020] insn_decode+0xf8/0x100
>>>> [ 6.679020] optimize_nops+0x60/0x1e0
>>>> [ 6.679020] ? rcu_nmi_exit+0x2b/0x140
>>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>>>> [ 6.679020] ? native_iret+0x3/0x7
>>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1c/0x27
>>>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>>>> [ 6.679020] apply_alternatives+0x165/0x2e0
>>>=20
>>> I have to admit that I'm a little lost with these "modern" stack traces=
,
>>> where contexts apparently switch without being clearly annotated. It is
>>> looking a little as if a #GP fault was happening somewhere here (hence
>>> the asm_exc_general_protection further up), but I cannot work out where
>>> (what insn) that would have come from.
>>>=20
>>> You may want to add some debugging code to the hypervisor to tell you
>>> where exactly that #GP (if there is one in the first place) originates
>>> from. With that it may then become a little more clear what's actually
>>> going on (and why the behavior is random).
>>=20
>> I will check what I can do there but as the crash is very random and onl=
y
>> happening during our CI tests, this is not really easy to reproduce.
>> If you have any example of code to do the debugging, I could run some
>> tests with it.
>=20
> Well, you want to show_execution_state() on the guest registers in
> do_general_protection() or perhaps pv_emulate_privileged_op(), but
> only for the first (or first few) #GP for every guest (or else things
> likely get too noisy), and presumably also only when the guest is in
> kernel mode.
>=20
> The resulting (guest) stack trace then would need taking apart, with
> the guest kernel binary on the side.
>=20
>>> As a final remark - you've Cc-ed the x86 hypervisor maintainers, but at
>>> least from the data which is available so far this is more likely a
>>> kernel issue. So kernel folks might be of more help ...
>>=20
>> I wanted to check if this could be a know issue first. The problem is
>> happening in the kernel, I agree, but only when it started as a Xen gues=
t
>> so I assumed it could be related to Xen.
>=20
> It is quite likely related to Xen, yes, but then still quite likely
> to the Xen-specific parts in the kernel. In the end it all boils
> down to where the first (suspected) #GP is coming from.

Would it make sense then for me to try a newer linux kernel first ?

Cheers
Bertrand

>=20
> Jan


