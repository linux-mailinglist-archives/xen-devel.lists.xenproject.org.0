Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1684257C5DD
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 10:10:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372556.604343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oERFu-00070a-4b; Thu, 21 Jul 2022 08:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372556.604343; Thu, 21 Jul 2022 08:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oERFu-0006xe-11; Thu, 21 Jul 2022 08:09:58 +0000
Received: by outflank-mailman (input) for mailman id 372556;
 Thu, 21 Jul 2022 08:09:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTDz=X2=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oERFs-0006xY-84
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 08:09:56 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00073.outbound.protection.outlook.com [40.107.0.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 803e1f92-08cc-11ed-924f-1f966e50362f;
 Thu, 21 Jul 2022 10:09:54 +0200 (CEST)
Received: from AS9PR06CA0607.eurprd06.prod.outlook.com (2603:10a6:20b:46e::10)
 by AM8PR08MB6417.eurprd08.prod.outlook.com (2603:10a6:20b:362::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 08:09:51 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46e:cafe::5a) by AS9PR06CA0607.outlook.office365.com
 (2603:10a6:20b:46e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19 via Frontend
 Transport; Thu, 21 Jul 2022 08:09:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Thu, 21 Jul 2022 08:09:50 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Thu, 21 Jul 2022 08:09:50 +0000
Received: from bc4bc973d33a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3BEF2E38-5456-4B82-9A5D-8957DDB43315.1; 
 Thu, 21 Jul 2022 08:09:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc4bc973d33a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Jul 2022 08:09:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB3773.eurprd08.prod.outlook.com (2603:10a6:803:bb::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 08:09:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 08:09:35 +0000
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
X-Inumbo-ID: 803e1f92-08cc-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=csjK9Alq9VCZD8o0I7erzaSRqTrYmCvGc4QmbdWxdfA1gbvwdTFlHP3sRefLeBWt6eWu/pwjjJ/dYcbb25j5O33gnTNxF2gaPeNuiH5t2sOPWzNsSfcygkgQqsvO4EGgRbS4le+cQ/9nUZljfXejqm+NgCvRuaZk/ey7NKk1MEZeZfakycj9SzPOvXWU/ruOdy28ymiUUQOXufXwsrOLKFTpoCcZKA1Qymr28EwvLALog+SQX/S4rhpJmrQSGW7ymEeD2d6UtXD7dC3dhC5J//NEgHRYfbvk9F1jQPKE0vd8eh/mMmdboEcvvo1lmRafXnk8HSl/Uw+CghcrE8EWJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4KRPOwIMQUqC1HWijP8a8T9I5aVXmuipJ+DoNxYCYM=;
 b=gV8Wdiej/1ymVj/eipM6cVnWA0ayTGtdwwUXndx5Eqsc/+CfKcZ44rqccHH2iMGOAblAYWu9Tqfh5Y0/jKZ3hl8HEsgpl/ZVz7SSgNMdBouJwuNQBo1sfnREuebiELW+ozlmqhhXdjV2nZaWYv3urfOwW+MGRJRW+RQBtXE0HTLxBBogdaVBNVPFhuWJCuQVu470mICwJikeVWlH3q3prz7NCQNC7udADn/KoAmcsuR4uOMdNMGjYyDTG0ozvqGUJ4cbrWC5XLOw8a7xpnPzp7YciD7IJSWLDltmJJQPTVW3dD61wPvJWZ2TehR9WPw93IMTkpOFR1Oy+jbFozodIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4KRPOwIMQUqC1HWijP8a8T9I5aVXmuipJ+DoNxYCYM=;
 b=7glH3gxvxPQZTt43BhAdo2YdOAntzMPAGkWEqqObVzmTSu8oPBnKEO3zAPQZfcgzitCvwkq/suU/OmV4lQkv+IOX/tEy+DvAa22a6WkZtfmGQKyMZWtOJImXsWW8yZNdkfHmR2RQW12d8/EJFSk15o9Lgbc/jOpx9hq4UOkykTg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1217dff16136bb4e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQUo6NS29a5jDH+NZQ0D6MDo62YT+mkyqfLz5uhwjg/L1GYpL3tBk4IN00B/xlzuYf4AsdLbk59bcsyaEZQx7EKuCsIC6aFZZOKJ6GoCfMpr6W/yMrTQY7kpE0Xb+qIReKGWBfiOsEbDvf4rhdsztFzfhF3dnMF6lUckX3vP4BrLqvtQUacNmRJES1Yq43rhEMfdHQ9EM+CCgPh7zJaQFsYiJhxmdxzkJdZievVcey98yWDON9dtDYS6GJ0CtwlwN1KYVM5h21l7vCdzdpSZekLFUH15BxDjRKY0wrvjuiaLUfR7k+HkWpkrdtxKCTIATwSa2dA4EXC1dAcENNniew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4KRPOwIMQUqC1HWijP8a8T9I5aVXmuipJ+DoNxYCYM=;
 b=ccyWkWZ0b1d7vVI3KJjFOgwCy3+y3MCPAri86ng0O7MMJwvz8pp68ia+Gns6N2MXXAp/CFHO9drP62vC0Ga7jfEoZmdOQjOBm7pgXd0naYxE6FEAoa7+lccBe4EOkMYJ/HcEaEPB93zUlrBoU0W1rF9pi+ThvAV4d+42s3dAMvQboqD8DqEsH6bUCxTxywdISutj2d8VlBzLUaQ7fiwuj0XvTx+ocW3cP3Xkb695MyqrV2jfZP9S+aszXdpm5NbwXZlyNurXJedFMzwoct4SAxXNQXQxvYYPNiFIMKkCVH8JJoCbW/8mRpygRS6eONmJJEt2NudJdg+kvMXMgJ3S/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4KRPOwIMQUqC1HWijP8a8T9I5aVXmuipJ+DoNxYCYM=;
 b=7glH3gxvxPQZTt43BhAdo2YdOAntzMPAGkWEqqObVzmTSu8oPBnKEO3zAPQZfcgzitCvwkq/suU/OmV4lQkv+IOX/tEy+DvAa22a6WkZtfmGQKyMZWtOJImXsWW8yZNdkfHmR2RQW12d8/EJFSk15o9Lgbc/jOpx9hq4UOkykTg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 1/5] xen/arm: Remove most of the *_VIRT_END defines
Thread-Topic: [PATCH v2 1/5] xen/arm: Remove most of the *_VIRT_END defines
Thread-Index: AQHYnGjbXBqTY5m6xUmloRrBtkUewK2IeZyA
Date: Thu, 21 Jul 2022 08:09:35 +0000
Message-ID: <5893B665-12E7-4C77-931A-2CB88F1AE36C@arm.com>
References: <20220720184459.51582-1-julien@xen.org>
 <20220720184459.51582-2-julien@xen.org>
In-Reply-To: <20220720184459.51582-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d9ed3271-b743-448f-f4aa-08da6af062c0
x-ms-traffictypediagnostic:
	VI1PR08MB3773:EE_|VE1EUR03FT043:EE_|AM8PR08MB6417:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /mF1bd3J7Mnfcw4RLnhtn9zDqH0GKDLDOsiSkRQPdxOW2chLDQR9jzhPUJDVdAFObPYqjDDClLy+v+3TRx7UAVzohpjb0AFC8plX9B4Hb0TirjEwmlmbKv7fWP1EqAS3RTNtDUvEk4qfsgJaOg1bHmtiAuduqtL/NPv93/Ir16jlSgRw9uKhb1c9KtSE/MfmY7nkZ9QU7K4XoztcrBp+ts4t0T+G3/6CbMQEAgDhARjdXWJ1iDidUEHgqvtkyuuHlDJyaBttZrSBuIbRyMUqhLcOL1Wj3nOGhgt1ukrs4TwBi7rnwWWcxbZUV6w4jEdlXT4Qo5lqPy4/HbySkQ/572xVrUYIDJET2vLZ5PqmZEiaFo/wJsrH6YWFpJNsxvDJutytuKkkyftk7b1zIVYymbpAId9qcP0xxoXCqGIVg5/SD9k54g7rW0r1syLDGJUfSuqiXzKnG37jOvbiuZFEQrtmTvglJZiPfaMD8vaZDwbD0X1kudCWA7iL12ndNucH3q3TpDUb12H9Fl9WQSVC4iV6CcADuAxbt69OPWzuB6wpTn2dkkgRScBXHKg/W3XHjTvrlTlGJ5IdePM1B/mXKS3/9o3anD/RSL4FB/PWayyW+cct6Qp++WmaPL6XtfIEPwIye84QzLPJXmGSPg8R3lYtVK6OQS0ejAlYuFiTuM/4OG727eR1BgizCAUMrGD8ABbmjopV7jsy7Gst4kq/sQIRsNFViOZOVFs/lJ/yHO971NHMmQF7CnnrSPQWRMoWAIKnEHSzEhDU2wtcyLAyk3T50YLhaZUA18F1KYoJz2u975aHTUvdhd7aacy6BErfCYvIP8247Avlvo/4CQvyxg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(53546011)(6506007)(41300700001)(6512007)(6486002)(478600001)(2906002)(54906003)(26005)(36756003)(86362001)(6916009)(316002)(71200400001)(76116006)(8676002)(91956017)(66946007)(4326008)(38070700005)(38100700002)(122000001)(8936002)(33656002)(64756008)(66446008)(66556008)(5660300002)(4744005)(66476007)(83380400001)(2616005)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1F664B7493D06F49B498DCE8A16B8ED6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3773
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7d01447-3a36-4c64-b931-08da6af059c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iWk/Upj/+H1DG/P4R5IMYvs78rEaBLhfkXDBGw4VzY3+6wGEfSZNpfyg+xlxHR0hCG3Ueyw9qsTMkUVVBZt3BxoocCxFqMmhr9nBAx8ifR3JBtxU6wW7VjogfDLZixl0t45pOeeuI+xMrF8R0ld64MI01JmrKSIjGId5gSz3YXRqcIy+i+z+DB4JQy1eCvPGusBYH8mv+SR2oA07X7JcTVnrx7wr7pQJkEJqkAH58bXz4m5Ty8bOxkMWFcDpi196chpmJP4rf8I/yvMSkKXlRtVwZ1QS5XTiePX6sozMEO3N9cSjJCHKAhZMMRzz9oYhTbAlu3/H9bPlgYENqt3Cd8fr3tvs6N7iE2hGBSdDFuwc8L+BOAkIt4neISD4gaGRQ2N/T6MbnKdjSEEzlNz+lhCKvC2SWWDo7yO6m1VCrp2l5KqMhAy0oJ+siPTZkzBK2fUXfqbTIH0O4WlvDZlU06dhDOBQO+7IV0HYhiEmvTipz8IrL4O2NjF9Wl+GJWqs6KxYEglWcQXXv4Q0Rwxwnvr9ElYw2SQKsfgPvJQP9sfnz6mCjzQl2+tul+e2kOnSUUMZn14w+ktOb9FtPWLj/pmprYMhVWYpA9VgkNCHXfyrl2HV3Q9WLxZ8Q8TJ4YG4QPC/l99fHWsfffaxursUFM9smkZJzsQrCfb8lfBAKE5Ws1FgUsmyeOuflyFj/6qv+kvPwwKuHj2gdjj6lj0M2dJj6X8KdNRvoNSyENOQwD5rogS0zDDGGyfbqg/8O/TvcC4up7MnydhvqaPvo+yJpa07xt6hhdLvDyBl89WVXnEd3q843KPF+H8KXVWsxDDY
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(36840700001)(40470700004)(46966006)(83380400001)(186003)(336012)(2616005)(82310400005)(47076005)(4744005)(2906002)(107886003)(41300700001)(33656002)(36756003)(26005)(40480700001)(6486002)(478600001)(53546011)(6512007)(6506007)(8936002)(81166007)(82740400003)(86362001)(36860700001)(54906003)(6862004)(5660300002)(316002)(70206006)(40460700003)(4326008)(356005)(8676002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 08:09:50.6760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ed3271-b743-448f-f4aa-08da6af062c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6417

HI Julien,

> On 20 Jul 2022, at 19:44, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, *_VIRT_END may either point to the address after the end
> or the last address of the region.
>=20
> The lack of consistency make quite difficult to reason with them.
>=20
> Furthermore, there is a risk of overflow in the case where the address
> points past to the end. I am not aware of any cases, so this is only a
> latent bug.
>=20
> Start to solve the problem by removing all the *_VIRT_END exclusively use=
d
> by the Arm code and add *_VIRT_SIZE when it is not present.
>=20
> Take the opportunity to rename BOOT_FDT_SLOT_SIZE to BOOT_FDT_VIRT_SIZE
> for better consistency and use _AT(vaddr_t, ).
>=20
> Also take the opportunity to fix the coding style of the comment touched
> in mm.c.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


