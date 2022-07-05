Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BEF566F12
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 15:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361242.590646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8iQv-0006nS-FI; Tue, 05 Jul 2022 13:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361242.590646; Tue, 05 Jul 2022 13:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8iQv-0006kc-CN; Tue, 05 Jul 2022 13:17:41 +0000
Received: by outflank-mailman (input) for mailman id 361242;
 Tue, 05 Jul 2022 13:17:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skT/=XK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o8iQu-0006kW-89
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 13:17:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80058.outbound.protection.outlook.com [40.107.8.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d766e386-fc64-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 15:17:38 +0200 (CEST)
Received: from AM5PR1001CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::33) by DBAPR08MB5702.eurprd08.prod.outlook.com
 (2603:10a6:10:1a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 13:17:23 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::32) by AM5PR1001CA0056.outlook.office365.com
 (2603:10a6:206:15::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Tue, 5 Jul 2022 13:17:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 13:17:22 +0000
Received: ("Tessian outbound 879f4da7a6e9:v121");
 Tue, 05 Jul 2022 13:17:22 +0000
Received: from 37b9d8abd3a7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B89F784-7A70-48A8-9312-BB9D54BE5D15.1; 
 Tue, 05 Jul 2022 13:17:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 37b9d8abd3a7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jul 2022 13:17:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PR3PR08MB5692.eurprd08.prod.outlook.com (2603:10a6:102:8a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 13:17:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Tue, 5 Jul 2022
 13:17:14 +0000
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
X-Inumbo-ID: d766e386-fc64-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gfw2faiirlJP6pQf7hNHLAxW/pqSDgEg62MoId6vgaciBaZhC3y0hUIJpkhZxAuyWAndJqb0x/fab5+ELMV9IyjF90nenQPnB2Jlz/6hRUYXJQd78un1GJHxkotjHxx7h5u1g9dZd0K4C41Pf58jvygSv6hbueoQc/b1yxbhFgmrJI/Q7eDhgwNGU/Vnk8xR08qKZl+423mL8R0Aw0YTgoNDf4FSIqzGYkcil8Y7VzrUcb2nQtT8om4o3Ms/6kKuqQ1BR7aXBeUgqnzP15XkzrYkb47n/qkYKvk7jXWtcX4+Xof2clfHlJhveGnzsHzS6z4y8/X8FIP0dnoYMJjl5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4Kp3UtAAcyb8jUYsXp13qyiYcmqvqX4xjmdZ/twp54=;
 b=DtEPCJQy6275K4AL2yaBtABF8x9Cbu0jxEwI1iflL7gOcNawX7lEq3f6RPfFZd83+svUO/23/i1SZvft5dTsdr1hx1r6dJA0VJ5Wyi6yF/lv/pC/J9oK6JkAwU5zMkr460Kp9jtjElTbwkUrVB52eetlVGUv79U6BaIoPu/EHD+9SucGR604GbIvQdi+rPbLh6LeckvDvqMLY6hGHsjdZ2BSi1wACmjuZjFAWting5H6pPfyQzgqzJtVz/RKAvSfyZeJQDUViZGk11dLF56y0Rz1PeRTloFEtLM9+3T6uJB24XR1GbAtJkdjRysXcQzoJ3Mk9wxf+wbElpfrIyQMig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4Kp3UtAAcyb8jUYsXp13qyiYcmqvqX4xjmdZ/twp54=;
 b=9dlgdQT486xcgiaSgXE/1HKVzM9BQGnESurkYRQOtbDul+hNL9YY/E+ZO4r19U1BtITabm0alDvqPL2D0OYAF2kEz617CjJPusijWdgObP/p4kYlgwUmwULQjsDB9liHwyFz8k/qn/mYBn/tiezVO714g46+6I++PJzkux4p2TI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a9aa006c8ed5a004
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRq6ET49r3zAEhO7I8S0x/L7u/R/QOK5pK6yerSfV5Bb7wgkimPTZekPzH2GGyUnPa28vOS1rnkIZZsUc4cZ+S9wv3aPzwy/xy0OinKAf24d58yLDAFNs6mJj+j2ozV08iomjiA2EDi/CzSrYY9giFK9LJmQf1+TAqSY5mM1tMyJJ0aErfICvFS86Zc66RG/CbrUuf/L2KQ6iXyyP9pAMaInulfIjvoYswMuVxE5Z3laK49ZyKJ7liG2FDyL34GtNP9Ol1N6LZUZd2l13e6X5Mm50ccw0byqNAt4UmS/qQfrqF47KWx97Ix1H6dGklyG381Unxb0QLTpG/cp6smkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4Kp3UtAAcyb8jUYsXp13qyiYcmqvqX4xjmdZ/twp54=;
 b=isOMUWbnuKjujAIo4FbivbOrhWm70sgtwnQOgQ79LFpG3QlGIrtoAw8aDCovfqWmX23gf+O0caz3fRehaMHUPdnO6EZ6tyXW776eP5nvueKUcMYak+N5Thf/gbGEqjhI+HafM0yFy2ME9MmHSH+u8GWS4L8GV/chJIo91JTrq9tv925CMFbHdriXlWQvteG9Fkm0hGj1MkhGcCuIEnCFVCaByumMdSHZsEPJdE6nl/50Nv5w4i3+KnE2SScZ4Nm97QuqlVq1GUfTwNYCWrj6gZIrQJsGUWouz8z9JgMofR/dEJ72unTNa3KGgq3U/L9Lq7fwj3hbWYoq6AggvPBtbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4Kp3UtAAcyb8jUYsXp13qyiYcmqvqX4xjmdZ/twp54=;
 b=9dlgdQT486xcgiaSgXE/1HKVzM9BQGnESurkYRQOtbDul+hNL9YY/E+ZO4r19U1BtITabm0alDvqPL2D0OYAF2kEz617CjJPusijWdgObP/p4kYlgwUmwULQjsDB9liHwyFz8k/qn/mYBn/tiezVO714g46+6I++PJzkux4p2TI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [XEN PATCH v3 12/25] .gitignore: Cleanup ignores of
 tools/libs/*/{headers.chk,*.pc}
Thread-Topic: [XEN PATCH v3 12/25] .gitignore: Cleanup ignores of
 tools/libs/*/{headers.chk,*.pc}
Thread-Index: AQHYh+Q4LI8v0EVuHkalG0x3wwvCIq1v00wA
Date: Tue, 5 Jul 2022 13:17:14 +0000
Message-ID: <2ADCFCCF-0B10-450D-91AB-E399A13A83A3@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-13-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-13-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8623a4ee-5be9-499e-754f-08da5e88b263
x-ms-traffictypediagnostic:
	PR3PR08MB5692:EE_|AM5EUR03FT033:EE_|DBAPR08MB5702:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1q6zkuE+bB109QzYbQLVn8CRzpRNR44NlE5iMCZigbbE60zPmVaC166rUemghgp2h6NZDsysWe3cQLWAzThLGUOSLpxUWHqS7Ncn7N9Fiv+yC6uCUMQQTpdmdwgPUMJfPoS8MAb61BLgHHIoxYqOPF5edP0Cpgj3/keunidgI6BtPPaXoFd5ZdcrCaYdQ1T90jbOgxcz2hnRvJAOCCQQXcWTDfl9Y/2/BmhCiRiTfQlAKxgCUCxL9LrLv/U9KMUxNnzixYXu83zaQGLqFWcJe8uJAVnBE7/Lh5Q7I4r0fjMlrNPp7jZlGKrKOUqjU6AamqJNEqPOOx1BHwrm1d1zB4k5ie2xWb1wp2HiT6ILPbtXdSd0hDjZz76PqtiMRMnHL317uy+TzcIjC1S8UWlMXd/uHoCyibsfFSx7cqImm7lUD3ekObtDoSuSuaPh4DmwfkrwoDvRZNhHccnSwcnWo/7P/SXtm9naC7r3lbkVzNR3bPeTiVmBpZH4DWUGg5ApA8zHOWduQN6HRi9rebRFE6YHeBIr3ydD2h38BslZrnCf8v7UDcUUBqso74PcfGUH29nvTbanUeYu3BZjQy0mBMxmDXkVZn77Cz1tUqBwuz9xkdL4dc38k5Mf+kohIkPKvua/1FlgpHzyn6+Qhu2buBnS5B7Mzn7YtaQEY6qM/pRgqRm+R4fwob49Cq51u+2TsfbYHuV6IsAmFfdjB5CIW99p3PIGZBhkb9heu0GnhKPm8aRAHHs3KazF7xNuFI11sukNfIwjQmEPvYaqR4vMBZ5xwNQr6wj7zWc595GLBuJiglNb8W6dUiOHN/en/suvf1RoHyjhCESHY0jo7clAfXpyPW4aYuz9oSi3tDhuNE4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(33656002)(86362001)(38070700005)(122000001)(38100700002)(8936002)(478600001)(6486002)(2906002)(5660300002)(41300700001)(316002)(6916009)(54906003)(83380400001)(71200400001)(66446008)(4326008)(8676002)(91956017)(66476007)(66556008)(66946007)(76116006)(64756008)(186003)(26005)(6506007)(53546011)(2616005)(6512007)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <276A91DEF7F7404EA408371C3440E447@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5692
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9baf0ebf-bc8f-499d-5cea-08da5e88ad67
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q36v78kWKS7VEPmS1EyC/+lVIPvC24Oho/Xj0hqetbRkfvzgtgUnccLL0RR4akY3w7ctpUVH5VctcjzQOQ1Xxo/wibuZRp2LIhTeBhZGRkNCLkxTmlQMz7bFrHuTexX0/KtjXpO0dld5MNSznAKUZBdaEMI/ZiSNPHz2frB8pu16WD0TgEH1UkBv/V+jSJJG6AyL8zm6G9KwYNv7r3q+I5c6XB627NAvAx/5Q1Lm7kdLGFo9/zpFea5GGRhYfBTwu57sDqKfjhJdrplh/dHLYKNXxlpHk0bMS0visrXK/0R/1LDQ1Mp8oTWS/yKtbqva6Gx0t6hThPAYZQYvBl5ywrDCjtf300weOsPSouqs2Rt0rnQMkPtWnQSg8ywjbs0z7tzzUcFX8JfC3IpMrOjChGJQiz8htX7qF19sr2ekBkxNOPqZzW25rfuYll7YOIHOfvcefLbyE4VVozA2N8hw2egBHevfKW+1siugdsAIBIpEJ5TQdLlM5TaYM5Umh7iUwBmPLlkVzDchiKs64KZ3V6oTpaP/w1xu0ciW3FVxGR8WcC7fTQsSUFMv499Ac2i2k2MvYJEn/9sYgfLE19gtdrmLJsvDeWgtOFUo+LwekQJ40phzEzVoawAaQDNzCLaBmfXmt5Hv7EzSQS6tetQjGFKoUjw6p7U+yTKMO/d+xcYYJD9tgoSF+EN57v+MRxxSRIfEhTqPD5Ijkcz5Fh9RaIA5ft5huf94YH7FremTXDXxgazSuQkBNIO+T7JiQBY9KTH3oLfwAicVBmqjWumQadSjwsoGRWnaOt2tntRaoiwUS5+72MFRyBwsx7AYLVLZ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(40470700004)(46966006)(336012)(47076005)(186003)(40480700001)(478600001)(54906003)(4326008)(70586007)(8676002)(70206006)(107886003)(6512007)(2616005)(36756003)(83380400001)(26005)(53546011)(6506007)(86362001)(33656002)(40460700003)(36860700001)(82310400005)(2906002)(5660300002)(41300700001)(316002)(356005)(82740400003)(8936002)(81166007)(6862004)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 13:17:22.7147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8623a4ee-5be9-499e-754f-08da5e88b263
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5702

Hi Anthony,

> On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
>=20
> Notes:
>    v2:
>    - move new .gitignore entries to the one in tools/libs/
>=20
> .gitignore            | 26 --------------------------
> tools/libs/.gitignore |  2 ++
> 2 files changed, 2 insertions(+), 26 deletions(-)
>=20
> diff --git a/.gitignore b/.gitignore
> index 8b6886f3fd..1de28c833c 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -106,26 +106,8 @@ tools/config.cache
> config/Tools.mk
> config/Stubdom.mk
> config/Docs.mk
> -tools/libs/toolcore/headers.chk
> -tools/libs/toolcore/xentoolcore.pc
> -tools/libs/toollog/headers.chk
> -tools/libs/toollog/xentoollog.pc
> -tools/libs/evtchn/headers.chk
> -tools/libs/evtchn/xenevtchn.pc
> -tools/libs/gnttab/headers.chk
> -tools/libs/gnttab/xengnttab.pc
> -tools/libs/hypfs/headers.chk
> -tools/libs/hypfs/xenhypfs.pc
> -tools/libs/call/headers.chk
> -tools/libs/call/xencall.pc
> tools/libs/ctrl/libxenctrl.map
> -tools/libs/ctrl/xencontrol.pc
> -tools/libs/foreignmemory/headers.chk
> -tools/libs/foreignmemory/xenforeignmemory.pc
> -tools/libs/devicemodel/headers.chk
> -tools/libs/devicemodel/xendevicemodel.pc
> tools/libs/guest/libxenguest.map
> -tools/libs/guest/xenguest.pc
> tools/libs/guest/xc_bitops.h
> tools/libs/guest/xc_core.h
> tools/libs/guest/xc_core_arm.h
> @@ -145,21 +127,13 @@ tools/libs/light/testidl.c
> tools/libs/light/test_timedereg
> tools/libs/light/test_fdderegrace
> tools/libs/light/tmp.*
> -tools/libs/light/xenlight.pc
> -tools/libs/stat/headers.chk
> tools/libs/stat/libxenstat.map
> -tools/libs/stat/xenstat.pc
> -tools/libs/store/headers.chk
> tools/libs/store/list.h
> tools/libs/store/utils.h
> -tools/libs/store/xenstore.pc
> tools/libs/store/xs_lib.c
> -tools/libs/util/*.pc
> tools/libs/util/libxlu_cfg_y.output
> tools/libs/util/libxenutil.map
> -tools/libs/vchan/headers.chk
> tools/libs/vchan/libxenvchan.map
> -tools/libs/vchan/xenvchan.pc
> tools/debugger/gdb/gdb-6.2.1-linux-i386-xen/*
> tools/debugger/gdb/gdb-6.2.1/*
> tools/debugger/gdb/gdb-6.2.1.tar.bz2
> diff --git a/tools/libs/.gitignore b/tools/libs/.gitignore
> index 4a13126144..1ad7c7f0cb 100644
> --- a/tools/libs/.gitignore
> +++ b/tools/libs/.gitignore
> @@ -1 +1,3 @@
> +*/*.pc
> +*/headers.chk
> */headers.lst
> --=20
> Anthony PERARD
>=20
>=20


