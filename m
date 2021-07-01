Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9E43B92DE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:07:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148695.274788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxKz-0003SX-1U; Thu, 01 Jul 2021 14:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148695.274788; Thu, 01 Jul 2021 14:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxKy-0003Qg-Tu; Thu, 01 Jul 2021 14:06:40 +0000
Received: by outflank-mailman (input) for mailman id 148695;
 Thu, 01 Jul 2021 14:06:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T0jQ=LZ=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1lyxKx-0003QY-Sb
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:06:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8be6d3fe-da75-11eb-8327-12813bfff9fa;
 Thu, 01 Jul 2021 14:06:36 +0000 (UTC)
Received: from DU2PR04CA0341.eurprd04.prod.outlook.com (2603:10a6:10:2b4::30)
 by AM8PR08MB5858.eurprd08.prod.outlook.com (2603:10a6:20b:1dc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 1 Jul
 2021 14:06:27 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::93) by DU2PR04CA0341.outlook.office365.com
 (2603:10a6:10:2b4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Thu, 1 Jul 2021 14:06:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 14:06:27 +0000
Received: ("Tessian outbound 80741586f868:v97");
 Thu, 01 Jul 2021 14:06:27 +0000
Received: from e3cd01550ddd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A076492F-2A74-474E-9194-9D26169C7376.1; 
 Thu, 01 Jul 2021 14:06:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3cd01550ddd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Jul 2021 14:06:18 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6045.eurprd08.prod.outlook.com (2603:10a6:102:ef::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.24; Thu, 1 Jul
 2021 14:06:13 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%7]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 14:06:13 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0147.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:188::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 14:06:12 +0000
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
X-Inumbo-ID: 8be6d3fe-da75-11eb-8327-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbKTHFU2AlA3cBd5ckibrMKo40WTXMTV53PLkroJV10=;
 b=BNO//h8TpjYA6+RJFklsa3GppskxxId8MvR9JmJg2HHcoYdCBZqz9dh8miBEU3H2il1RCQ8KGlrT+4e7Ee9W50u3mZARViSzvf7grrYyDKDlKzbObTTGBO2I0kh/3JpX7sfSJjViPW9Q7aXCkrAqsfDPo6SkCpB2gYYFk+j9z14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6ad17504501bd2e0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MK8solLtVlI4K3xA3usEuwd6uz5J/N/3rb5HGtTuHQQC8nS9ETYfUUn/GwfXe9cxeoVfnKunkMF25SSoxtB3oHNyn5UDi8rKGaLPwnDDUhq6lxSkpSvup0cVQdiV6StwIHgm2ftO+JZ/eIJK8PG5aQ3x+Lo5Exkou7twkkorlklA4fzsvu3VV5VubUREy3gyBpNvm12zyD5MCVgB3BYmO94+AXfuJ8FGPHbR9FEy9Wlaj8ao8Sf6u5MZG/25Ehp/MlcYN80Jxj3inuVcod4FC8RnqzkCjd3l995ywlc35CvxUXC8NbYGCJI7XQx9J3OTHbaS0rTJV8oNhLNeIMeTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbKTHFU2AlA3cBd5ckibrMKo40WTXMTV53PLkroJV10=;
 b=UpWlRr0U/1UWuq4DCd4/mx9hs7eVAYnXELNvLcpzf3PvM9xdsplI+Vs+4E9TdPxMjvWD4JkHlt9MnG8Xodk8V6hMva2s8qTlfVGToXO5oJLkRvbifrJ9sbjH9yuic59u/ZIxnq8BfWig+wNkJU0I+fmMSpFEJXna2kyQRBlLdHSMxnXaz5NetUiybOaJCTntkz6zR9GAeuMW5AHdHbsk8U28bnR3nEKazmhXXp/PTyjD2MTcALJu3zs2ESKDk1qx0rEk9wSC1DuACD53dMWmTmFWWmVsqws7ZBqpyTbFHQFI/gLUwu0WWeL5fQKs74VMZiDe9rTtaF0587bFyjHttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbKTHFU2AlA3cBd5ckibrMKo40WTXMTV53PLkroJV10=;
 b=BNO//h8TpjYA6+RJFklsa3GppskxxId8MvR9JmJg2HHcoYdCBZqz9dh8miBEU3H2il1RCQ8KGlrT+4e7Ee9W50u3mZARViSzvf7grrYyDKDlKzbObTTGBO2I0kh/3JpX7sfSJjViPW9Q7aXCkrAqsfDPo6SkCpB2gYYFk+j9z14=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v6 8/9] docs: hypercalls sphinx skeleton for generated
 html
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2106231523210.24906@sstabellini-ThinkPad-T480s>
Date: Thu, 1 Jul 2021 15:06:06 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D2BAA7F7-4396-4EE7-977B-AE300A50589D@arm.com>
References: <20210510084105.17108-1-luca.fancellu@arm.com>
 <20210510084105.17108-9-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2106231523210.24906@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0147.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::8) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03ad84dd-f8e8-43fe-9843-08d93c996afb
X-MS-TrafficTypeDiagnostic: PA4PR08MB6045:|AM8PR08MB5858:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB5858B06B75F12812091D0EFEE4009@AM8PR08MB5858.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ltVqP6y7aoZV2LZwUfzYaADxENnOwI4o/t/GHpfj61BawkNgSL+915iIsBrn44SEM3td2mFjhWrqEj0D52PD1iCMbxq7ELLtjPVPVHu0yk94cucgdnifa0747mGoresGsJIAiKKS7lc8Wbv3mef1SELLpas5E3bRVTkKl6WGVu7DH3haOXY66QK2kURpSM/vSDeYzd6XqNE60R4fHj/ufqDez2zzJ9tJY+aCwXCjqSFGUst/OJLmDL04513uWOCW2rfWYftlylDz5ovjWTe44oTvNG9O1isQWcsaio63wQwkD6MgI/5oZhhJj4l79lyHgxk8SqBV+UEjnJYGoWO5OrrjUx8Q2aTd8MZEqGRQtY/y8ivRqD8jG3FKjGCt6Mc+xQ0sQFp8xPNbkH09aAexFaAS96vhs5A/PLcTdbjVeD4O1L6QEuDiir5my6WlO7yUqojvUg7cyOHKHcJ5Yk+jN88uJS/HzJVmkbfFM7+zS7VSI8BDTw9l0V5Z9E9TX5HYyVq+icJInQtYgOgn9GwbKhnECbzTkf9u8+eB83pXMQ5ZRIJiLb1PQFfUhbgpC/0hc/nJqQM02gE9dS+c3r+QAdzH9d3AH4FepE5mE2sDwt/9kxIGhRQ5VLJyTfhtNLZCVZlORAejoMGc3NB9ccNGmWIe2512DRR9TMnIF7YCPfBew8BgyPy1uSHg9vtHUdPMSohlhxWlCMu+kjRWBrnqFFP4oy2yDPOiIPfar22QQOQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39850400004)(346002)(396003)(316002)(44832011)(6486002)(54906003)(38350700002)(38100700002)(186003)(16526019)(26005)(6512007)(6666004)(6506007)(53546011)(66946007)(52116002)(2906002)(33656002)(36756003)(86362001)(4326008)(66556008)(66476007)(956004)(2616005)(6916009)(8676002)(8936002)(5660300002)(478600001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?JxTDEZ30QfPigQbNDsjMSUam8ezmIS/Kwv9JsffETV8jGKhmd1sM3ezZwUIs?=
 =?us-ascii?Q?jFJUWZn5XnZx/LqOg/zPhLLf1rpD+rGI46huTzT+ljviKVP0FDfTZOyG7khN?=
 =?us-ascii?Q?fDZPucmwf+z+guPpMPYRIfDHRjf/VA5UaYfkX7xE+Nm/mx/CD9eezoGKi1FV?=
 =?us-ascii?Q?MW731QjIOfV5C2UkOzvqHY/aDDW0YZCxqCJbZv4FuC8fs+oYdZNae2EgWHKv?=
 =?us-ascii?Q?4WbkYZtW0/YBgtxv7pEw85RIIGsyqYGODqJuW6k/xKwGA+lGyPNf5Ni6Q0xL?=
 =?us-ascii?Q?lx47lKsuLXvOAy8IcBXRrxSNTz4ZPn7BZFinyH45soR9X8lZhDrr18gIRqwK?=
 =?us-ascii?Q?ZyZ1m5gdN8VfZYC9dXx86pEIfpJ9078IiU1NhJbdsyo6G+gKnb9UcVi4MKHC?=
 =?us-ascii?Q?NDBam42k5orp9RDyeQ9FTJPyNgTJnFyOyxQJerngE0El5k5Ww8v79+Fg0Yai?=
 =?us-ascii?Q?i+l0Y2VhMx7weq6+kKKiJsCi8cpv/GbxRFZxzVmiqdyLse6Kr5oG1cQZoGq4?=
 =?us-ascii?Q?pqfsgAgRQAlw5v/0Fzbu5gqoniJG2z30k88KWJvpnEPXuLYP5fWkoEtqd5lx?=
 =?us-ascii?Q?V2cqEjBC5Ui2zJSpX1MH4ituu1vndqibQwOc8VLnyTxvLRgVsNgUpgJJYfE9?=
 =?us-ascii?Q?mAlSx+HMYNdyDWD6jaF4nO5FZaVQ1KF+ukMRgVSO8CwnHV6IA2M7vr+g0Esv?=
 =?us-ascii?Q?Z5a0FBfrpDHoqSTUXWkC39AsYuo3blYMNlyqwDdqwtN/XAqm+96ecaWxhbx6?=
 =?us-ascii?Q?ct6Lz+LxL87LcIV+nc0UlRO8EYjH5QJ+h2P1tJe56rhXOdLylE9uJisrL24m?=
 =?us-ascii?Q?IoJG2nXw+MNfQFt6Y6asKxbPTEZ/ywi/31wbxM8xk1ZVvrWJY8o1t7TgOrqV?=
 =?us-ascii?Q?roRJ8cc2vVaZrpxxZgxs4Ui3QLItzIpxH6SOe+rsVgswRJM5QHZ5mUrCekzj?=
 =?us-ascii?Q?sMQ6d1NpIEW5r/iQqAuAoMY6DuzphyDbrnBA37cQhtSZ6jR+Im8zP2l+pYM/?=
 =?us-ascii?Q?Sl9WLrhaCj+r/LaByaK3PyhAT7wNIZXFQjBn1tx4egHVVpC0Uw2L0dJgE917?=
 =?us-ascii?Q?/Eced9S6Xn3Ewj6MnurFN5u/3iL2+oF8WlkN5rMY0bQrgu1+x7sC81CeZ3WU?=
 =?us-ascii?Q?DIa8zbhxCU26KC8udNSkUFv/kqq5qMVWcqmtdeN1a2WaMsipRLGfynRV2wnB?=
 =?us-ascii?Q?9KCoi1uvQJ+T4REJlx2fMFr3ljae8Xc7M2ocskU4j8bNXiIuoA8mq62siYDs?=
 =?us-ascii?Q?E8R5DTuOGIZMjY4KGMwagly9Z5YKf0EP2H42GvoA4U0NqPsFF5hWgLbSYeNf?=
 =?us-ascii?Q?Fnjf9XHPp8pw8o4tjAPkaEAV?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6045
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4653e4a1-2bea-4081-3ef5-08d93c99626d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tazJGIVRTSP185RR6UsagtV0/cyihD9ctUekBWN3h7jJlyTzjLFxxEUgcgs8/o63DsITBYpY/T1vjZuVJO9n7KtzYzMl4LDucQkAJxoFgZaLEytCCLc6g5t4W60P3j/1NxyezyZb9TZOXxHJW+BZrS4+zZ26TMQLLqjOWwbBU8TtreaeRCeFYmSA9h7+QmYxi67elV2W2xXJlMveIYYM25QjoqMHVd+AMe8wfUaKKM/SHU9LXonNsij2RjafiCfFTMz+sP5m+5IeY7QBOrhJ6pQ2DlIDec6hJd+aAL9nkagqgHZqaM8U2C7IDm0SY3yd8d7CaCLNvXwzmKw0ef5m/MDH7IfojTJyw23WQ3oxdMLdnV/ykMg9RBhI8AT0YxgwvZt4QjdZreyIyXStZhG6OpRc/3ZJUQFdvwCSTCHfPA4XREBBPFfkOZv1YlRd/aMiH+uicmA5YhTorpSreNDMeM8WQNi1+0Vd6epuNHeAIebk1z3kxboFFSKMOJi3vPuzw14jpnK4dH3XIums0l8oPW+LrMkV6re7Wr+zSh5rkN31ZQWIx4ib8kGSjZWZ8MhEVW/Y7UXF+kHdToArVEv98c+PsKycwPb57AQXZQ1heRe0I/cO/lxrJj/YUxXu3j4tUAWOapYyNBtKkDn02lLfnt8jMJwCdvvzMf+i3zIq//ttTFLIEh5LomJniiepuvt1pU1/wx3SAwcgTFJ4GIVD1Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(346002)(376002)(36840700001)(46966006)(81166007)(70206006)(82740400003)(8676002)(6862004)(2616005)(356005)(33656002)(2906002)(4326008)(36860700001)(956004)(478600001)(5660300002)(47076005)(336012)(6506007)(70586007)(316002)(6486002)(6666004)(26005)(186003)(16526019)(53546011)(82310400003)(36756003)(8936002)(86362001)(54906003)(6512007)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 14:06:27.2092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ad84dd-f8e8-43fe-9843-08d93c996afb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5858



> On 24 Jun 2021, at 00:34, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 10 May 2021, Luca Fancellu wrote:
>> Create a skeleton for the documentation about hypercalls
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> v6 changes:
>> - Now every platform has the same sections in .rst files
>> ---
>> .gitignore                             |  1 +
>> docs/Makefile                          |  4 ++++
>> docs/hypercall-interfaces/arm32.rst    | 32 ++++++++++++++++++++++++++
>> docs/hypercall-interfaces/arm64.rst    | 32 ++++++++++++++++++++++++++
>> docs/hypercall-interfaces/index.rst.in |  7 ++++++
>> docs/hypercall-interfaces/x86_64.rst   | 32 ++++++++++++++++++++++++++
>> docs/index.rst                         |  8 +++++++
>> 7 files changed, 116 insertions(+)
>> create mode 100644 docs/hypercall-interfaces/arm32.rst
>> create mode 100644 docs/hypercall-interfaces/arm64.rst
>> create mode 100644 docs/hypercall-interfaces/index.rst.in
>> create mode 100644 docs/hypercall-interfaces/x86_64.rst
>>=20
>> diff --git a/.gitignore b/.gitignore
>> index d271e0ce6a..a9aab120ae 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -64,6 +64,7 @@ docs/xen.doxyfile
>> docs/xen.doxyfile.tmp
>> docs/xen-doxygen/doxygen_include.h
>> docs/xen-doxygen/doxygen_include.h.tmp
>> +docs/hypercall-interfaces/index.rst
>> extras/mini-os*
>> install/*
>> stubdom/*-minios-config.mk
>> diff --git a/docs/Makefile b/docs/Makefile
>> index 2f784c36ce..b02c3dfb79 100644
>> --- a/docs/Makefile
>> +++ b/docs/Makefile
>> @@ -61,6 +61,9 @@ build: html txt pdf man-pages figs
>> sphinx-html: $(DOXY_DEPS) $(DOXY_LIST_SOURCES)
>> ifneq ($(SPHINXBUILD),no)
>> 	$(DOXYGEN) xen.doxyfile
>> +	@echo "Generating hypercall-interfaces/index.rst"
>> +	@sed -e "s,@XEN_TARGET_ARCH@,$(XEN_TARGET_ARCH),g" \
>> +		hypercall-interfaces/index.rst.in > hypercall-interfaces/index.rst
>=20

Hi Stefano,

> I take that this means we are going to generate docs only for the
> architecture that we are building? So if we build for x86, then the docs
> are for x86 (no arm32 and arm64 docs.) Is that right?
>=20
> Is that because Doxygen relies somehow on the compiler to extract data?
> I am asking because if Doxygen doesn't rely on the compiler, then it
> could probably generate the docs for all architectures in one go?

Doxygen rely on the headers generated from the KConfig system to properly s=
olve
the preprocessor step, for that reason here we need that.

It can be improved for sure, but it needs to call a defconfig for each arch=
itecture and
have separate Doxygen-output folders for each one, then on the rst files yo=
u can choose
from which arch you want the data.

I think this step can be done in a future serie.

Cheers,

Luca

>=20
>=20
>=20
>> 	XEN_ROOT=3D$(realpath $(XEN_ROOT)) $(SPHINXBUILD) -b html . sphinx/html
>> else
>> 	@echo "Sphinx is not installed; skipping sphinx-html documentation."
>> @@ -108,6 +111,7 @@ clean: clean-man-pages
>> 	rm -f xen.doxyfile.tmp
>> 	rm -f xen-doxygen/doxygen_include.h
>> 	rm -f xen-doxygen/doxygen_include.h.tmp
>> +	rm -f hypercall-interfaces/index.rst
>>=20
>> .PHONY: distclean
>> distclean: clean
>> diff --git a/docs/hypercall-interfaces/arm32.rst b/docs/hypercall-interf=
aces/arm32.rst
>> new file mode 100644
>> index 0000000000..6762d9fc7c
>> --- /dev/null
>> +++ b/docs/hypercall-interfaces/arm32.rst
>> @@ -0,0 +1,32 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Hypercall Interfaces - arm32
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +
>> +Starting points
>> +---------------
>> +.. toctree::
>> +   :maxdepth: 2
>> +
>> +
>> +
>> +Functions
>> +---------
>> +
>> +
>> +Structs
>> +-------
>> +
>> +
>> +Enums and sets of #defines
>> +--------------------------
>> +
>> +
>> +Typedefs
>> +--------
>> +
>> +
>> +Enum values and individual #defines
>> +-----------------------------------
>> +
>> +
>> diff --git a/docs/hypercall-interfaces/arm64.rst b/docs/hypercall-interf=
aces/arm64.rst
>> new file mode 100644
>> index 0000000000..5e701a2adc
>> --- /dev/null
>> +++ b/docs/hypercall-interfaces/arm64.rst
>> @@ -0,0 +1,32 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Hypercall Interfaces - arm64
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +
>> +Starting points
>> +---------------
>> +.. toctree::
>> +   :maxdepth: 2
>> +
>> +
>> +
>> +Functions
>> +---------
>> +
>> +
>> +Structs
>> +-------
>> +
>> +
>> +Enums and sets of #defines
>> +--------------------------
>> +
>> +
>> +Typedefs
>> +--------
>> +
>> +
>> +Enum values and individual #defines
>> +-----------------------------------
>> +
>> +
>> diff --git a/docs/hypercall-interfaces/index.rst.in b/docs/hypercall-int=
erfaces/index.rst.in
>> new file mode 100644
>> index 0000000000..e4dcc5db8d
>> --- /dev/null
>> +++ b/docs/hypercall-interfaces/index.rst.in
>> @@ -0,0 +1,7 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Hypercall Interfaces
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. toctree::
>> +   @XEN_TARGET_ARCH@
>> diff --git a/docs/hypercall-interfaces/x86_64.rst b/docs/hypercall-inter=
faces/x86_64.rst
>> new file mode 100644
>> index 0000000000..59e948900c
>> --- /dev/null
>> +++ b/docs/hypercall-interfaces/x86_64.rst
>> @@ -0,0 +1,32 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Hypercall Interfaces - x86_64
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> +
>> +Starting points
>> +---------------
>> +.. toctree::
>> +   :maxdepth: 2
>> +
>> +
>> +
>> +Functions
>> +---------
>> +
>> +
>> +Structs
>> +-------
>> +
>> +
>> +Enums and sets of #defines
>> +--------------------------
>> +
>> +
>> +Typedefs
>> +--------
>> +
>> +
>> +Enum values and individual #defines
>> +-----------------------------------
>> +
>> +
>> diff --git a/docs/index.rst b/docs/index.rst
>> index b75487a05d..52226a42d8 100644
>> --- a/docs/index.rst
>> +++ b/docs/index.rst
>> @@ -53,6 +53,14 @@ kind of development environment.
>>    hypervisor-guide/index
>>=20
>>=20
>> +Hypercall Interfaces documentation
>> +----------------------------------
>> +
>> +.. toctree::
>> +   :maxdepth: 2
>> +
>> +   hypercall-interfaces/index
>> +
>> Miscellanea
>> -----------
>>=20
>> --=20
>> 2.17.1


