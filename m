Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5A17F628E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 16:18:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639782.997491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6BTH-0007bI-IS; Thu, 23 Nov 2023 15:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639782.997491; Thu, 23 Nov 2023 15:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6BTH-0007Yh-Fp; Thu, 23 Nov 2023 15:18:27 +0000
Received: by outflank-mailman (input) for mailman id 639782;
 Thu, 23 Nov 2023 15:18:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bPHf=HE=arm.com=Divin.Raj@srs-se1.protection.inumbo.net>)
 id 1r6BTG-0007Yb-0B
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 15:18:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7d00::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ba2f0c2-8a13-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 16:18:25 +0100 (CET)
Received: from DUZPR01CA0229.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::26) by DBBPR08MB5898.eurprd08.prod.outlook.com
 (2603:10a6:10:20c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 15:18:19 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::5f) by DUZPR01CA0229.outlook.office365.com
 (2603:10a6:10:4b4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20 via Frontend
 Transport; Thu, 23 Nov 2023 15:18:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Thu, 23 Nov 2023 15:18:19 +0000
Received: ("Tessian outbound 26ee1d40577c:v228");
 Thu, 23 Nov 2023 15:18:19 +0000
Received: from b0e02ee6c514.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B030D318-3FEB-4318-8C61-996735D4E9F4.1; 
 Thu, 23 Nov 2023 15:18:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b0e02ee6c514.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Nov 2023 15:18:08 +0000
Received: from PAXPR08MB6750.eurprd08.prod.outlook.com (2603:10a6:102:13f::16)
 by AS8PR08MB9267.eurprd08.prod.outlook.com (2603:10a6:20b:5a3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Thu, 23 Nov
 2023 15:18:06 +0000
Received: from PAXPR08MB6750.eurprd08.prod.outlook.com
 ([fe80::542e:1889:d107:2e96]) by PAXPR08MB6750.eurprd08.prod.outlook.com
 ([fe80::542e:1889:d107:2e96%4]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 15:18:06 +0000
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
X-Inumbo-ID: 8ba2f0c2-8a13-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jZtP2DcvQQazwPYJPgdTATa4VGLjX2XKbMV/Vl085/viVuw2jf+EuocgRI2oVvYVtzlQ+2iV0uS1BJf+k5i7c/GBjHIhnrLvY2S70fkgHQTI75QgeE0sdvDU3T8fapDsDDi2oRARP+aL50rbqok2dTiRfzBlpaDNM+RjPE05tEd3xu2MTBCTj0UbykeyeQnPT6gHXCno3wWEc2CGXTEzbwk85UePg79mSh55ZCgie/8zR3TokOhyfRXTMQvW+YBN5np6XOFAongfObnEwWhnC9eVvvtp+rwDWYG5HGalS8unZ/M8pQeOybK0HcyZMnQUl2rLu3xssU0iYlfyaA29gg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHAUUPqzyZKi3OqV9EuONLnkSM/PK8udASufsAx4s8c=;
 b=L7sMhJxcM9Vxvq9hJ/Z9lZOMqoC0QEKshhjlYdbc87rDUYyurGxd2Tvhugml6EcxvKP5aJVdlG1RT3m6JLHBFGKGL4xsIpqgIvYVt2b4blpRY+X92tSDNB4qzaj7l6lt/EkxubCX8sW57YQ8Gl3RRzQzerNmTuUgqFXCly/47CLu2EJ4TXtlrXUa52U05xdOFexND9m6u4kxH1x3fsJlEvH5MYQ75XfH6CPwdIbqZMlvRJeG8j7FQsxMDp0ipF3IkrxlikqNJ9WQaug8a9xd411rE7ISsLQISr1RrjCQU4H8aLhLeBWsbSU0bYPyk6/HaaYJaeYBuZLnH/laQU2DUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHAUUPqzyZKi3OqV9EuONLnkSM/PK8udASufsAx4s8c=;
 b=RbGSD3cwe7kgfG6ASHlzULq99OQurO1hIOk22jjtNFSOgWvECNSMd15pj9HdFr+lN7KwJwtUu88l/141Fz96psjwwvXyWUZeXri5uSsHnlYTCr1QxgqaLBpeSOmcF4LTpPf8MAcBEVMa8pSiqvjNdxPO/0Mhf/yhii7J3JRo1lw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b6354608c0ccd278
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjEFq44TeOcMeF7bImXmVLH4fccCoyMMPwdKLbC1mTwOsTnvXVwcjWI9+DJs1zbeUuzOMMFeLdpawlHMKZU19YafFMHS8hsaV1rEW2cjgWZnZVvHn/08FsyyLQtb0Pl4eciiJkSlnnADCA8LODJiWfb7MDJEPKIBl2LI7/ZXjmhvTLb61sT1TmodI2myO/VcrS6g/YTyvYq/oip5hs8xEVzZubbMs/qsB5SIgi4SJrrT7CFs+gloAj3SLHW3X0p6qJGb3zdzrvVwuaHf5pF44H09QAQd49sCpHlS8bIuz3ePNqV5m0evHvuif1qth5PlzQUv0Xnd0KkPDXHj8YDCuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHAUUPqzyZKi3OqV9EuONLnkSM/PK8udASufsAx4s8c=;
 b=P4/KloGfoRWM82OqLKQ/NCi+T50nOKobmtzLYJW0ORWA8cKJTl2OtLALCw5smhJSuJHqvO0MQ7S+J9zD6fJIbAmMrO+KthlUIG4o+cLxaTxcdkS8bf4MhGkqNwHKpQ+IDZnABlXTkhfieycqtZJtk/Yxz4Ond8O3+9IqMZY84Ko0KUGxPNBoQZr47tRyKpG7nJWvAq1JSG3AI7UdN/lpfS1SzrTqEUnUa7hgsIO/PrgjDCBW6V7pwiVyS2/jiNPoSOIsWwslbfu0rsAnjCB4qt9+AbUwmhxfgmNApdfUj/yhis7raXdLtobUaDwRzNUuolTQI0h9Ci6vcbiXslEbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHAUUPqzyZKi3OqV9EuONLnkSM/PK8udASufsAx4s8c=;
 b=RbGSD3cwe7kgfG6ASHlzULq99OQurO1hIOk22jjtNFSOgWvECNSMd15pj9HdFr+lN7KwJwtUu88l/141Fz96psjwwvXyWUZeXri5uSsHnlYTCr1QxgqaLBpeSOmcF4LTpPf8MAcBEVMa8pSiqvjNdxPO/0Mhf/yhii7J3JRo1lw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <47ec45a1-2004-410c-86c7-861d03c1939b@arm.com>
Date: Thu, 23 Nov 2023 15:18:02 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [Discussion]: Making "LIBXL_HOTPLUG_TIMEOUT" configurable through
 'xl.conf'
To: Xen-devel <xen-devel@lists.xenproject.org>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 "jgross@suse.com" <jgross@suse.com>
Cc: Olaf Hering <olaf@aepfle.de>, Jan Beulich <jbeulich@suse.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>, Rahul Singh <Rahul.Singh@arm.com>
References: <4a54e7e7-c041-44d3-a16e-d331e9fdd414@arm.com>
 <20231115182340.505df6c3.olaf@aepfle.de>
 <4f418916-b76d-425a-96a2-05b56a3dc195@suse.com>
 <20231116085629.40a0445b.olaf@aepfle.de>
 <A6D4B8C2-E781-4964-A757-C72F38169246@arm.com>
 <20231116105321.4a59eed4.olaf@aepfle.de>
Content-Language: en-US
From: Divin Raj <divin.raj@arm.com>
In-Reply-To: <20231116105321.4a59eed4.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0138.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::9) To PAXPR08MB6750.eurprd08.prod.outlook.com
 (2603:10a6:102:13f::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB6750:EE_|AS8PR08MB9267:EE_|DB5PEPF00014B90:EE_|DBBPR08MB5898:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a636655-2ddf-4cda-0231-08dbec376cdb
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9QnlxVvzu5jIQx6CY2aR5e4Nn2KlZYwJ3K4Y3xswXEJSSMigFNzmAUDp2KvYtMTjFEmynGRLKIBbJ3pyMX5N1iGIx62NdjSbjf+X41Y9qbMxI0sCvF0nlTL3hSQVYjCt3Dy86b12s6QGg+9uYkzwzttjFUEuLGmUCFEcgguYpCpubQkIGjtoKs0N9+p74wS7B/JwHRM5/dD6TQq/6NDX8Z3HJMkr5hsgWmQNCEKdVsWoDbiyRaeGTfkIAmXKcfFHbztVPVwBXOsitqde73AAYqTpU4c/qKkB67pPrdv5j6Aa9Pj8uX7iZiPILmVJioGKN1lkvli1IbcV2EluFZVG795JQai1elstsHJ7kKgEpbuOXvxhKIRh65si6kGlaT1RkYnQVGB//B1ia9TNqXjCGUdekD9UeoS40TlZbLRQRifEXehzaTRFf7qrSy3Zyw4Q+Noof2nyF/Ng5dPq2sOpMk6Fl3+5AhKF/O96gpvxxPPDrqGC8ikgMafV/zKN1oi2WQGnpEP7PXsu2kGoNWlZFpYwn41tzwoWvylgTLQGh5aTKuMUPHj6rObeDlbNwjiJBPwqPrAdNUkFTgd0L934mluSCArvxeaBU/PaB33fc6uxuF/6oIAo9f/Ja9YxRg3w
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6750.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(136003)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(44832011)(53546011)(2616005)(6506007)(6512007)(478600001)(6666004)(41300700001)(8936002)(4326008)(8676002)(26005)(2906002)(6486002)(5660300002)(316002)(66946007)(110136005)(54906003)(66556008)(66476007)(86362001)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9267
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cb6fbea2-3dac-472a-0fcf-08dbec3764ac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	23IsTgIgtM8MzC3w9WG1vNv8NY+AVH6fud2GDjhzyv3fCVmfkrAJNzH7JRYCCs59yYp9O1dgkavTSIud4ZX3L9mu3EA+ammZCYTXVwuNhkKqoPbtvpNCui1177ZAk2oap6ST14P0+Lo5FwgyGTvvlJaeTbasqHd4Ev/88wdKetdm0Rs+qFAI02msrJI1KFu1gDoyPr/knGYhoirvFCe2fOyHMifLuvOKyIeenPHvkxzuu827s6dsAlTztqWzNLwI5lpCJTfBgT+8crxC86NU3AZxsGOE0TkNDRvg5efciBa4cCYMqASfXH0OqfKUqQ37keKm02RyVrJbxcOwpNiYK+lHARiTNCv4po1zlYiqFXkU+pHTv/i8q1q/0sxPzlXG3ZgPTfOkRnpF3cVHFsnj+xtxtDHe7rs2Dm2tbkSWFIzT0KUCd/E56J0X2oaCAE0qyUPwHPAFhQskpy1ljtj7rQdlIweX3xyQBnNPp15bn/YFORwgb5gSlGmQxs0p+MMDa2AByRfPQNPXnrxOvNu5vIU+1zlSkLIZmogE6YqxjWbXiRZSSpX4eJXX3/PkH0lK0SIQiOUhHlkkF4pipE//3ojCxUNifejvvzUKKwModdglWWrR1r9gJe+shYxubuAUxN84dZrGeyM3Yg40+4GappEZxqNfdHixM7PWW6pt1FF2TQr7dSQILU8risyWhjSmcCWzJUF7Ci4Um/634y0LmoUMuUoUzXT17LMTnuQyzu4Bqz2M8HXeafMqq364vPVT
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(1800799012)(82310400011)(186009)(451199024)(46966006)(40470700004)(36840700001)(40480700001)(31686004)(40460700003)(70206006)(70586007)(110136005)(36756003)(356005)(81166007)(86362001)(31696002)(82740400003)(6512007)(47076005)(36860700001)(53546011)(336012)(2616005)(6666004)(26005)(478600001)(2906002)(316002)(54906003)(6486002)(8936002)(5660300002)(4326008)(6506007)(8676002)(41300700001)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 15:18:19.6705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a636655-2ddf-4cda-0231-08dbec376cdb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5898

On 11/16/23 9:53 AM, Olaf Hering wrote:
> Thu, 16 Nov 2023 09:21:06 +0000 Luca Fancellu <Luca.Fancellu@arm.com>:
> 
>> I see your patch is handling this issue but maybe was not meant to be upstreamed,
>> so I would like to ask if you are willing to make it upstream-able or if it’s not planned
>> to do so.
> 
> Right now I do not have the time to work on this.
> 
> First there need to be an agreement about how the timeout needs to be configured.
> 
> 
> Olaf

Hello everyone,

Following our earlier discussion, we learned that there is already a 
solution to fix the LIBXL hotplug timeout issue. Currently, we have two 
options:

1. Xenstore Key/Value Approach: This is implemented in the patch 
"libxl.LIBXL_HOTPLUG_TIMEOUT.patch". This method does not require 
recompiling libxl. It involves setting up a key/value in Xenstore before 
domain creation. The patch can be viewed here: 
[https://build.opensuse.org/package/view_file/openSUSE:Factory/xen/libxl.LIBXL_HOTPLUG_TIMEOUT.patch?expand=1].

2. Configuration via 'xl.conf': We can make "LIBXL_HOTPLUG_TIMEOUT" 
configurable through the 'xl.conf' file.

I propose we have a discussion to determine the most suitable approach. 
Once we reach the best solution, we can move forward with the 
implementation/upstream.

Your feedback, suggestions, or any improvements would be greatly 
appreciated.

Thank you for your time and consideration.

Regards,
Divin

