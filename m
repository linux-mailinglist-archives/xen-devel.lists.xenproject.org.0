Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18760592797
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 03:46:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386920.622951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNPBI-0002tU-Ct; Mon, 15 Aug 2022 01:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386920.622951; Mon, 15 Aug 2022 01:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNPBI-0002rh-9y; Mon, 15 Aug 2022 01:46:16 +0000
Received: by outflank-mailman (input) for mailman id 386920;
 Mon, 15 Aug 2022 01:46:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zthq=YT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oNPBH-0002rZ-2d
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 01:46:15 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130083.outbound.protection.outlook.com [40.107.13.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0aad6e7e-1c3c-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 03:46:13 +0200 (CEST)
Received: from DB3PR08CA0020.eurprd08.prod.outlook.com (2603:10a6:8::33) by
 PAXPR08MB6384.eurprd08.prod.outlook.com (2603:10a6:102:154::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Mon, 15 Aug 2022 01:46:09 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::40) by DB3PR08CA0020.outlook.office365.com
 (2603:10a6:8::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Mon, 15 Aug 2022 01:46:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 01:46:09 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 15 Aug 2022 01:46:09 +0000
Received: from ae7da1886e98.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B1288F84-63BF-4BD8-B581-79408892741C.1; 
 Mon, 15 Aug 2022 01:46:03 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae7da1886e98.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 01:46:03 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DU0PR08MB8089.eurprd08.prod.outlook.com (2603:10a6:10:3e8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Mon, 15 Aug
 2022 01:46:00 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 01:46:00 +0000
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
X-Inumbo-ID: 0aad6e7e-1c3c-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WiFgt3Pt2ZJ/0VIZ9lE+TvSKQyBHIbEhbESoeh3Dbj1tMTU5liky3Y+A7VlQybXmhWYVeYQ/Cgyn0qm8rodVAc2Osq0ISf+BzBmf5FGXUjHd2ZKkJufHb6lm9LPsLkE/k1urCGb+ko5F2o1ak3BmijE+OdrvROQEqxhCuly+uz7ZQz7jXEWRCxhdMGOODTKQv2PkKAS5SVaXVZynzkPoquMUwzxtmQuJrz4urVuC78N6uthi/hgz0KsZoZBJQBHzipayz5vCRDGpA7BJ8RiMLTUDHOBjEOet1WJXbT6XcWBEiBbaBRtm6PvE5IZH/HYyTAWtwFINgjkry/Y/pNmKHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d62Xc10U3aJgHrw0e6DkBNlQOHGwnvrIKRW/ha3zXGY=;
 b=ik7XXHCADDkcbOjR7OAmPwr5tTGA0g2oQhbk5pOnCUrLbg2rcznBcKtATbYLdGL5Y64ToqBsvX4K4NIUFpCNHz6ceCjWEeZ2QKMTweRqNecx81RNAyKCE69APOagDl5kKd5midiH+QhMFoihkKRiiNIjlp7lEHeeaBJc/9HZZr7qFKb+2xdL/wouVrc1EmSF+kNKbORYL+Bsg62sHBf2OrpbVFffYYo0xrVBuZ9hEUVxecltGXlsU+tKQHWNXCy8oH/zaaQcXKpCan0Q28E/+1l9mXs0sGYOFBESaBqpZlu85NuGiRpFwsxkyGLANO0+LGcPI0xIg2HxUqIvJ6Zqcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d62Xc10U3aJgHrw0e6DkBNlQOHGwnvrIKRW/ha3zXGY=;
 b=1wKeLq6SA80QdsppSuFhUxO8x8o0/oPY5a1CKtGeHM3z6QiNl4l4akfTV3JQAEAzJErGLBRQFMiQvvGkgvrSLDsNd/FEUcDdYuSeieSOKT6mAo67RdVCvubh6sEsdAdA3Yop0m/LkZH9n3VzIJI9+o0M+UedtQiyPWpSYxIfoTE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: eb8ee22b36841cad
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxxstXXxok/KlmVDzP2PxamstLif3ABbCzFMW+fWX0JNegiHxyYIexrWGK40hJN8s/oMd2+3YPIixjuAubmpvl/5y5cxF63fCfdXPvpARhZIsFytZbQQ68nb+ynnaNLDHlPUZfmdXMwQ9VVd0es3l0gMDkO3ZvX3nXmdWbokNA3tVui5WTeDwgISteAKHRoD+h0uPQtW2ZGdJOJ1TpS7pWthjiPcnfeJ+IwerOcPkl2o/IEAoR5VhamSnqwsReOFgyNDrgkcOs6XGvWk2aRXeEBn/zVmfDvKh1JRoEPvK4L0hKbGwo4ZW10wBxnn77wVFucbL80C9hPS9R8WfMNazA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d62Xc10U3aJgHrw0e6DkBNlQOHGwnvrIKRW/ha3zXGY=;
 b=JH3z3dE5pFPiOLgS421wlqurwjLEKcE+8gsEKbGLGWdSiYkRgXvc4qj44MY+ijhkmAYhFidVKs2Jv4Oip9ar4cOd19Oo4CY7HmZxlCaYql0+oG9i5TGAzVdKMmKCGBRFJ4O0dnvbmoob/8lVckx2kstUnJUVTm/0DuhXKV8QTsAw2EORaG2yvdna/kdvIuaFnuLarXyob9xyXbFi0WH03Qo9/e7cbb4iWBKdYkim9QoKzVpkpH5WZK2Krj9cQe/fFMIWHH9UiHQkpqw+2AmWhMoiz9aUB0RF8wASbCrUXLXGjKmfuR/VHDqLmiATsTCTqQFXghrtLnOD2fGp4pT6Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d62Xc10U3aJgHrw0e6DkBNlQOHGwnvrIKRW/ha3zXGY=;
 b=1wKeLq6SA80QdsppSuFhUxO8x8o0/oPY5a1CKtGeHM3z6QiNl4l4akfTV3JQAEAzJErGLBRQFMiQvvGkgvrSLDsNd/FEUcDdYuSeieSOKT6mAo67RdVCvubh6sEsdAdA3Yop0m/LkZH9n3VzIJI9+o0M+UedtQiyPWpSYxIfoTE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <9c7f8d9d-f9c6-7547-5888-1b36b4619bcf@arm.com>
Date: Mon, 15 Aug 2022 09:45:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/7] xen/arm64: head: Introduce get_table_slot() and use
 it
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-3-julien@xen.org>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <20220812192448.43016-3-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0052.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::21)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: d4643a4f-6de1-4b97-6ee8-08da7e5fed61
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB8089:EE_|DBAEUR03FT022:EE_|PAXPR08MB6384:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1RoqnfAlRwFmNyPeoaHtYJgmxD17VMe2ig2nBV9l6zwN8YjAQB/13fenb57WIsj3i0EpR/RmEAZJcoyDr5NWCv04GhwYVhjunPF0PYz/bcU+FQ/nW/nXTCOJ5FzQH4CCCnB42d18qRVlLVR9+/OI+VEmn0so1ZcGABr5zQSKINrXWzNrRmBimzTPkFdAteFdG5k7UPw3vKkOtNWvcWiqHXA4cPmEBMD499ZL8lOVdhze+KQmJJ7S/rnMU7bI7FYL/qCtL1PUXRoBuPgTftHO6utAkanhqWOuD6Rr3QSiEf01ANq+ZUGSXiYHfxys/I2tkIvnOSY1a9U33zl7P5qeOlSURpGZqT2BOyt3h62EtqIJFEhI0o5qZLD70mT80bcsCfqxgC8tWehPEDWyV4Wxg1OHlAoX0TZzqpitwpKKyKfzw5aOcbXkKb7EjtCo+NBMlrSGtc6hF015grwwC63mzW4bNC3xiZgwrbvQTo3TaEoVdG2eIKUXCoj63N1XrXOY5aXo8GEwhMdT4TcCm7ogIyjWQRhvGMf57Ee1pxV42xDo77LoZ2+2hHZca3eqGRcCVYmPvRrGxEe7vdX6m20meqybYaehxScJGPFtr2tT1t0JJkzNgpLHEHxKXgVHRMtSk7aatyzFUtaQho0spvM7FBjWhlPAA9RCgEHtCLQbvsJBjgcEjnKHCC7Yyq9GFIxJSWwQZXi1gG5zBIk8GfossYjKPLJUtQrCEVs6L00F/y4lmqgn+C5zgrUhAUgdaMMrtP0KNrWGj6nIGVxMDSpTqtQuR9HFmQ6T98lH2EfgsVJMwOuslwj17USNL6YULyd+ZisK9kvlvkYMl5oFc8VC2w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(478600001)(36756003)(2906002)(8936002)(4326008)(66556008)(31686004)(66946007)(5660300002)(66476007)(8676002)(54906003)(41300700001)(6486002)(316002)(6506007)(26005)(6512007)(31696002)(186003)(2616005)(83380400001)(53546011)(6666004)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8089
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	662ba756-09f2-489a-fa73-08da7e5fe7c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HggUR2zP7xLMyQpWiVnombTdOxBApExo0apbsH0Dn/z5ioXGilBw/NM/i7clQ+UJ2LE0TtiUM6klJCtogpjLKCA5ZSQ/J0MEfp4LzxYbjlpdqtvJV7eLioMjbZz6qz6MSlm5YIOCjTH0qumft8JDGuZ67Gbvsubdw1gbIFxQ+owqQFftO+08SCmAq48vyRMtyk2sPVMWI/FMbJ3bk8lE+IWXQAYFOxMXgoXOmfhI5JFUXNvHby2sLsCxiZ0VwIXpAMvPRpOSm9AqlWv4H7lF9wU7YZ5pE2+P7ACpXb3bReqsIUztgtYRsPOgJuf1rwuoJcdWLrO5N2yo0Oel7j24PVS9wslWNmSxeIewlFHfmLaqVc32chlwFPDxMUMLKXE9t6aueXetT5RjHcKRoD9Inq9MqLLX+ozEiDO3jVWEfBwOaklEvDgjqtk+8GngxCezVFk8cMxt/uMJAiMgY5ewqwMXYFd6RO4mafEym75/5r5lCtpZG31LsQ5JU3jWuMxD4P9IRvX/qGS280MANEpRrcU3yIylXai64Y+jPsJKSPbm0IupQzqPOo7Sem9HrbbU3X+7tCQ0/AwLTZKMBcVNAu87z62cvgmjbfZTskdo2k9DE+G3hBpwqgFXdYYjrw4vY5EfQPZjCehv+SG5WNPZwA3wTeHxDU/4MFBPVlaBIzPnZLjtPsxtTeXLicm7zzO9cxc4Jom23QPGYEU7wJMZ3naMw/33wTVqu3v7Ekj77KnaHNv28pWX3/N2orKlu+Tt6kDuV2YwApQFLkXkHM8GiO1bzfnNptANDI4/HhnGMmoQjOjx40BdpNw9jx5BWY6Y
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(396003)(346002)(36840700001)(46966006)(2616005)(186003)(336012)(47076005)(6666004)(107886003)(40480700001)(5660300002)(26005)(6506007)(41300700001)(53546011)(6512007)(36756003)(478600001)(6486002)(31686004)(36860700001)(31696002)(86362001)(356005)(8936002)(83380400001)(81166007)(82740400003)(54906003)(82310400005)(2906002)(8676002)(70206006)(70586007)(316002)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 01:46:09.5768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4643a4f-6de1-4b97-6ee8-08da7e5fed61
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6384

Hi Julien,

On 2022/8/13 3:24, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> There are a few places in the code that need to find the slot
> at a given page-table level.
> 
> So create a new macro get_table_slot() for that. This will reduce
> the effort to figure out whether the code is doing the right thing.
> 
> Take the opportunity to use 'ubfx'. The only benefits is reducing
> the number of instructions from 2 to 1.
> 
> The new macro is used everywhere we need to compute the slot. This
> requires to tweak the parameter of create_table_entry() to pass
> a level rather than shift.
> 
> Note, for slot 0 the code is currently skipping the masking part. While
> this is fine, it is safer to mask it as technically slot 0 only covers
> bit 48 - 39 bit (assuming 4KB page granularity).
> 
> Take the opportunity to correct the comment when finding the second
> slot for the identity mapping (we are computing the second slot
> rather than first).
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
> 
>      This patch also has the benefits to reduce the number
>      of use of {ZEROETH, FIRST, SECOND, THIRD}_SHIFT. The next
>      patch for arm32 will reduce further.
> ---
>   xen/arch/arm/arm64/head.S | 55 +++++++++++++++++++++------------------
>   1 file changed, 30 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 26cc7705f556..ad014716db6f 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -493,13 +493,24 @@ cpu_init:
>           ret
>   ENDPROC(cpu_init)
>   
> +/*
> + * Macro to find the slot number at a given page-table level
> + *
> + * slot:     slot computed
> + * virt:     virtual address
> + * lvl:      page-table level
> + */
> +.macro get_table_slot, slot, virt, lvl
> +        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
> +.endm
> +
>   /*
>    * Macro to create a page table entry in \ptbl to \tbl
>    *
>    * ptbl:    table symbol where the entry will be created
>    * tbl:     table symbol to point to
>    * virt:    virtual address
> - * shift:   #imm page table shift
> + * lvl:     page-table level
>    * tmp1:    scratch register
>    * tmp2:    scratch register
>    * tmp3:    scratch register
> @@ -511,9 +522,8 @@ ENDPROC(cpu_init)
>    *
>    * Note that all parameters using registers should be distinct.
>    */
> -.macro create_table_entry, ptbl, tbl, virt, shift, tmp1, tmp2, tmp3
> -        lsr   \tmp1, \virt, #\shift
> -        and   \tmp1, \tmp1, #XEN_PT_LPAE_ENTRY_MASK/* \tmp1 := slot in \tlb */
> +.macro create_table_entry, ptbl, tbl, virt, lvl, tmp1, tmp2, tmp3
> +        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tlb */
>   
>           load_paddr \tmp2, \tbl
>           mov   \tmp3, #PT_PT                 /* \tmp3 := right for linear PT */
> @@ -544,8 +554,7 @@ ENDPROC(cpu_init)
>   .macro create_mapping_entry, ptbl, virt, phys, tmp1, tmp2, tmp3, type=PT_MEM_L3
>           and   \tmp3, \phys, #THIRD_MASK     /* \tmp3 := PAGE_ALIGNED(phys) */
>   
> -        lsr   \tmp1, \virt, #THIRD_SHIFT
> -        and   \tmp1, \tmp1, #XEN_PT_LPAE_ENTRY_MASK/* \tmp1 := slot in \tlb */
> +        get_table_slot \tmp1, \virt, 3      /* \tmp1 := slot in \tlb */
>   
>           mov   \tmp2, #\type                 /* \tmp2 := right for section PT */
>           orr   \tmp2, \tmp2, \tmp3           /*          + PAGE_ALIGNED(phys) */
> @@ -573,9 +582,9 @@ ENDPROC(cpu_init)
>   create_page_tables:
>           /* Prepare the page-tables for mapping Xen */
>           ldr   x0, =XEN_VIRT_START
> -        create_table_entry boot_pgtable, boot_first, x0, ZEROETH_SHIFT, x1, x2, x3
> -        create_table_entry boot_first, boot_second, x0, FIRST_SHIFT, x1, x2, x3
> -        create_table_entry boot_second, boot_third, x0, SECOND_SHIFT, x1, x2, x3
> +        create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
> +        create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
> +        create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
>   
>           /* Map Xen */
>           adr_l x4, boot_third
> @@ -612,10 +621,10 @@ create_page_tables:
>            * XEN_ZEROETH_SLOT, then the 1:1 mapping will use its own set of
>            * page-tables from the first level.
>            */
> -        lsr   x0, x19, #ZEROETH_SHIFT   /* x0 := zeroeth slot */
> +        get_table_slot x0, x19, 0       /* x0 := zeroeth slot */
>           cmp   x0, #XEN_ZEROETH_SLOT
>           beq   1f
> -        create_table_entry boot_pgtable, boot_first_id, x19, ZEROETH_SHIFT, x0, x1, x2
> +        create_table_entry boot_pgtable, boot_first_id, x19, 0, x0, x1, x2
>           b     link_from_first_id
>   
>   1:
> @@ -624,11 +633,10 @@ create_page_tables:
>            * then the 1:1 mapping will use its own set of page-tables from
>            * the second level.
>            */
> -        lsr   x0, x19, #FIRST_SHIFT
> -        and   x0, x0, #XEN_PT_LPAE_ENTRY_MASK  /* x0 := first slot */
> +        get_table_slot x0, x19, 1      /* x0 := first slot */
>           cmp   x0, #XEN_FIRST_SLOT
>           beq   1f
> -        create_table_entry boot_first, boot_second_id, x19, FIRST_SHIFT, x0, x1, x2
> +        create_table_entry boot_first, boot_second_id, x19, 1, x0, x1, x2
>           b     link_from_second_id
>   
>   1:
> @@ -638,17 +646,16 @@ create_page_tables:
>            * third level. For slot XEN_SECOND_SLOT, Xen is not yet able to handle
>            * it.
>            */
> -        lsr   x0, x19, #SECOND_SHIFT
> -        and   x0, x0, #XEN_PT_LPAE_ENTRY_MASK  /* x0 := first slot */
> +        get_table_slot x0, x19, 2     /* x0 := second slot */
>           cmp   x0, #XEN_SECOND_SLOT
>           beq   virtphys_clash
> -        create_table_entry boot_second, boot_third_id, x19, SECOND_SHIFT, x0, x1, x2
> +        create_table_entry boot_second, boot_third_id, x19, 2, x0, x1, x2
>           b     link_from_third_id
>   
>   link_from_first_id:
> -        create_table_entry boot_first_id, boot_second_id, x19, FIRST_SHIFT, x0, x1, x2
> +        create_table_entry boot_first_id, boot_second_id, x19, 1, x0, x1, x2
>   link_from_second_id:
> -        create_table_entry boot_second_id, boot_third_id, x19, SECOND_SHIFT, x0, x1, x2
> +        create_table_entry boot_second_id, boot_third_id, x19, 2, x0, x1, x2
>   link_from_third_id:
>           create_mapping_entry boot_third_id, x19, x19, x0, x1, x2
>           ret
> @@ -705,7 +712,7 @@ remove_identity_mapping:
>            * Find the zeroeth slot used. Remove the entry from zeroeth
>            * table if the slot is not XEN_ZEROETH_SLOT.
>            */
> -        lsr   x1, x19, #ZEROETH_SHIFT   /* x1 := zeroeth slot */
> +        get_table_slot x1, x19, 0       /* x1 := zeroeth slot */
>           cmp   x1, #XEN_ZEROETH_SLOT
>           beq   1f
>           /* It is not in slot XEN_ZEROETH_SLOT, remove the entry. */
> @@ -718,8 +725,7 @@ remove_identity_mapping:
>            * Find the first slot used. Remove the entry for the first
>            * table if the slot is not XEN_FIRST_SLOT.
>            */
> -        lsr   x1, x19, #FIRST_SHIFT
> -        and   x1, x1, #XEN_PT_LPAE_ENTRY_MASK  /* x1 := first slot */
> +        get_table_slot x1, x19, 1       /* x1 := first slot */
>           cmp   x1, #XEN_FIRST_SLOT
>           beq   1f
>           /* It is not in slot XEN_FIRST_SLOT, remove the entry. */
> @@ -732,8 +738,7 @@ remove_identity_mapping:
>            * Find the second slot used. Remove the entry for the first
>            * table if the slot is not XEN_SECOND_SLOT.
>            */
> -        lsr   x1, x19, #SECOND_SHIFT
> -        and   x1, x1, #XEN_PT_LPAE_ENTRY_MASK  /* x1 := first slot */
> +        get_table_slot x1, x19, 2       /* x1 := second slot */
>           cmp   x1, #XEN_SECOND_SLOT
>           beq   identity_mapping_removed
>           /* It is not in slot 1, remove the entry */
> @@ -771,7 +776,7 @@ setup_fixmap:
>   #endif
>           /* Map fixmap into boot_second */
>           ldr   x0, =FIXMAP_ADDR(0)
> -        create_table_entry boot_second, xen_fixmap, x0, SECOND_SHIFT, x1, x2, x3
> +        create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
>           /* Ensure any page table updates made above have occurred. */
>           dsb   nshst
>   

Reviewed-by: Wei Chen <Wei.Chen@arm.com>

