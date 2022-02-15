Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79BB4B7435
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 18:53:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273497.468709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK20e-0003Vh-9F; Tue, 15 Feb 2022 17:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273497.468709; Tue, 15 Feb 2022 17:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK20e-0003Tf-3v; Tue, 15 Feb 2022 17:53:04 +0000
Received: by outflank-mailman (input) for mailman id 273497;
 Tue, 15 Feb 2022 17:53:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h622=S6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nK20c-0003TO-UV
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 17:53:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e4c5d01-8e88-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 18:53:02 +0100 (CET)
Received: from DU2PR04CA0311.eurprd04.prod.outlook.com (2603:10a6:10:2b5::16)
 by AM6PR08MB4657.eurprd08.prod.outlook.com (2603:10a6:20b:cf::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 17:53:00 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::5d) by DU2PR04CA0311.outlook.office365.com
 (2603:10a6:10:2b5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15 via Frontend
 Transport; Tue, 15 Feb 2022 17:53:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 17:52:59 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Tue, 15 Feb 2022 17:52:59 +0000
Received: from 35bd68bbd38d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2C1421D5-5932-4739-A8EA-9D6EA4966962.1; 
 Tue, 15 Feb 2022 17:52:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 35bd68bbd38d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Feb 2022 17:52:54 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by DB7PR08MB3467.eurprd08.prod.outlook.com
 (2603:10a6:10:48::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Tue, 15 Feb
 2022 17:52:52 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e%9]) with mapi id 15.20.4975.018; Tue, 15 Feb 2022
 17:52:52 +0000
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
X-Inumbo-ID: 1e4c5d01-8e88-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=un3rfBjBA+/TDycrQBT+tXIqPcY944i6C8CUpv3E6dE=;
 b=r/pe+lgcAsobXTqFuBLnhjO8unQCy/yPa5rh5LINW/IF5n3kR35f1aMl3WazmqOeqzIvKFnlUx+sGt+Eg/DyoFCm4NguUd1fNFqndhY1LSNbM0sezPtcmlx7A/VlNTQ3ZS9CTeLeSs11G1APO0q/hsrrMOZF3joxQsy32Iljrtg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75298232c1e41de1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eR3+ZijK0MilGoYOh00BwRG8rxE+hVjN39b22vUg2RdwTITMj1XN61LuWhv4RIC/deR9uXK1auAxHsWi7F8G01fznq95lYrA97VZ3435NyLL8uJ92k/lASa9DSKHiKDxlwbpo+Zu55HjKsqqimZ9o6t+hdkQ+q7lPLPEEP5gnKHJq3ca8Oj1J3FnvQ3INgu1evrFYd0kXdHAdyO9tVTzl8c4dpFd68hDMm4FSpto0mJtxJfFuW3uWgSaYQHm6Mm1bYW98mruIFnolPLOHZpTMHhJDJn8pUc1dYx7j4ZSaLKsVaJA5bwczPB7alNGsORxwyKFfC1giKFBzTkyLDDo4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=un3rfBjBA+/TDycrQBT+tXIqPcY944i6C8CUpv3E6dE=;
 b=Fa4VuP/qFe76TT7Jz6mO3mbCy7bbZCLpKIjKxNDMzHIYXQ6SXSzHdbL4Oj8b7M9GkBwRtIOEHeN3IkkgxvmuG5tth69d8SzIAqQDpvHd/DfsYx5QOijImyx5fSKHSSm4LpPITd0XfL0DAUC3lltDcvE2YSxyckK4SdPUdTVEfUMdSt+eVIOamxtTlq2skcq+VUkW3dJskyd7VAJ1KXRNg+zs0ByHAeS7TAP5MUc4LOQKn7dZ8Q7tB5NtyPHnQe0xvXQGpyVGsSTCpX/X1+Tce2M/WL/Le5UxrBA2I/869OfdHjOSKlh+VEaPSnIjJNSV8DeA95rZIYi1ZtPdoHH7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=un3rfBjBA+/TDycrQBT+tXIqPcY944i6C8CUpv3E6dE=;
 b=r/pe+lgcAsobXTqFuBLnhjO8unQCy/yPa5rh5LINW/IF5n3kR35f1aMl3WazmqOeqzIvKFnlUx+sGt+Eg/DyoFCm4NguUd1fNFqndhY1LSNbM0sezPtcmlx7A/VlNTQ3ZS9CTeLeSs11G1APO0q/hsrrMOZF3joxQsy32Iljrtg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 3/5] xen/sched: retrieve scheduler id by name
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <5207b025-5b92-682e-5904-4e5014f76d7c@suse.com>
Date: Tue, 15 Feb 2022 17:52:48 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Chen <wei.chen@arm.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0524AA92-FACD-4F24-BE0E-42B4AA8FA80E@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-4-luca.fancellu@arm.com>
 <5207b025-5b92-682e-5904-4e5014f76d7c@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-ClientProxiedBy: LO4P123CA0295.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::12) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 0d13f9e7-8f3b-45ea-f8bd-08d9f0ac017e
X-MS-TrafficTypeDiagnostic:
	DB7PR08MB3467:EE_|DB5EUR03FT058:EE_|AM6PR08MB4657:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB46574F242671DAD7AF5F3041E4349@AM6PR08MB4657.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HvM9hoJrNkqpPTTDe+RJLmBzw1VXai4WJpH/0OtL4G64J191yV/dSCqahOHS5msQj1OzsNaiBbpoAHq7uqDRRETCS6dxOhYfSJnydHil9TXySO6K16566USRClhVfp95ybw28b449f5PRZ96L8uX6lrDIPKTqvpzalw5YIEanCr3yeG4RTrqae5/99SwKrwgj0M7/hLc6XcNxRJYZHzE0/BnELmFPGv18lecTII6N3krVneqWYL/0kue3mzau+OxP7BDx3ViHKnX8nIDCQls2HYAzazdA/Ui0b6Fv6+YQWLTC5F55Qkaj1YHuEN9/710sA+ou9+IxcJsk9HBXAXJfuVsqYx98u311GV7Pv7LetiGIevPm35up74Mq1YLP+QhTUyrCSATZqMQ+oq+PmWDtkU69ixd5Bs/5HDMco42TQsl1O29sd6S/tyEnXFupDIVxPGadlfOpGsesvJrOiH/dPqJ/gZdT3iGAVBYxLqV8k9jP7/OEbaGA4T+rfaKzS006TXzRa/AB4Fga/nK0zFKsd54SqFkBHW/MWoqcxykn8tLrbrkTBr/3LnpOy0Z6VDwPorev0PYGNfHWCycvLuRRWIsu8hNrDAExmBpoji/xj1ffkr9EAJ9VH0E773v+1PdLzq7PWIbiNSUdn6bbxnTc7uRvq0Up8dRP9+tRGi6CyiqsYC4q8rCHegowS+PKqQdn9X1M3PiZAek6XlXNI04s6ihjH/yY213teH1OfkAnlI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(6512007)(6506007)(6666004)(38100700002)(38350700002)(52116002)(53546011)(66476007)(66556008)(66946007)(2906002)(2616005)(26005)(8936002)(4326008)(36756003)(5660300002)(44832011)(8676002)(54906003)(508600001)(33656002)(6916009)(316002)(6486002)(86362001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3467
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bdf2c7ba-b52a-4f7a-cea5-08d9f0abfcd0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3B+PnCcyetw3PzQO8llwZsJJNbJcFSuHYO7l3Pi38Ox/T6KMRmTUWgcqM5DpTtkVDS5IWyvrDX4cFXHjlR/rO8s0ZwH9YHtVu+9zbeP6f1+aTL52JqgAJOHWD+9BI2aiSHA1DMBZ3WB2zlvdsa1ASUlkDGxcaeKTuQdXAL+jKHmvFwVI9M32ce8lMEpo2YuGreJnS/wnehFCdFal5Y8liiv0IIqnURXeno3F47ZhAJlWqbNBp1xHoJqjsq6jKVNK8n2s5+DOVvvXlZVGn32eqJlpYcw453z9YpjBMnnQo+ma8Q4BOdgYI16E38MMFZSlon+uL4rq5UaoDimWsApxP6jWn6bWZ3Ng6UnpHNL7O56Cx1LIrBfkmqOvCbbyleXmabVMYQJOjBoD2fSj4KOo6FxCWCNaAwaSBy8h0hSN4aCr/Of2GEhgnVfu7n12/L5NKN8B2/M3Nd7lsxqp24Tw8ULktbkJdxTH+Z16gcMMFks5Epw0cKc4hGOFhlLOqrlNVgcHMMC/bouIoyM1CrvJAxeBHJLZ+oearfgo+HKhCEETcEHVSCB4ehCqfDVjr1g5EflVZiXB0wI96vf5CAiDxsPidMCuk6qvlK3/qiFmWPBpr/jNpJGa0zT2wzN+S3V43ue/smyrnuRu2SK5m1j1r1V2hY32xdOyrldo0v163XWuS7/h9NEKL7VnNshK2BPJ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(336012)(8676002)(4326008)(44832011)(6862004)(36860700001)(6506007)(26005)(8936002)(36756003)(186003)(53546011)(6512007)(2616005)(81166007)(356005)(6666004)(86362001)(6486002)(33656002)(82310400004)(316002)(70206006)(47076005)(2906002)(70586007)(508600001)(40460700003)(5660300002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 17:52:59.9775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d13f9e7-8f3b-45ea-f8bd-08d9f0ac017e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4657



> On 15 Feb 2022, at 10:40, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 15.02.22 11:15, Luca Fancellu wrote:
>> Add a public function to retrieve the scheduler id by the scheduler
>> name.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>  xen/common/sched/core.c | 11 +++++++++++
>>  xen/include/xen/sched.h | 11 +++++++++++
>>  2 files changed, 22 insertions(+)
>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>> index 8f4b1ca10d1c..9696d3c1d769 100644
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -2947,6 +2947,17 @@ void scheduler_enable(void)
>>      scheduler_active =3D true;
>>  }
>>  +int __init sched_get_id_by_name(const char *sched_name)
>> +{
>> +    unsigned int i;
>> +
>> +    for ( i =3D 0; i < NUM_SCHEDULERS; i++ )
>> +        if ( schedulers[i] && !strcmp(schedulers[i]->opt_name, sched_na=
me) )
>> +            return schedulers[i]->sched_id;
>> +
>> +    return -1;
>> +}
>> +
>=20
> Please make use of this function in scheduler_init(), as this
> functionality is open coded there, too.
>=20

Ok I will change the code in scheduler_init to use the new function.

Cheers,
Luca

>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


