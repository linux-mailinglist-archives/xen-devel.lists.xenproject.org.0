Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC502614F41
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435163.688276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opuA8-00044v-Qw; Tue, 01 Nov 2022 16:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435163.688276; Tue, 01 Nov 2022 16:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opuA8-00041w-NN; Tue, 01 Nov 2022 16:30:52 +0000
Received: by outflank-mailman (input) for mailman id 435163;
 Tue, 01 Nov 2022 16:30:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUI+=3B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1opuA7-00041X-8m
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:30:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b378651-5a02-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 17:30:49 +0100 (CET)
Received: from AS8PR07CA0050.eurprd07.prod.outlook.com (2603:10a6:20b:459::7)
 by DBBPR08MB6089.eurprd08.prod.outlook.com (2603:10a6:10:206::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 16:30:46 +0000
Received: from AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::70) by AS8PR07CA0050.outlook.office365.com
 (2603:10a6:20b:459::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.19 via Frontend
 Transport; Tue, 1 Nov 2022 16:30:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT049.mail.protection.outlook.com (100.127.140.234) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Tue, 1 Nov 2022 16:30:45 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Tue, 01 Nov 2022 16:30:45 +0000
Received: from 99e5fd8acc25.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 246E1C68-3AD3-4331-BC59-3F9CD64747D1.1; 
 Tue, 01 Nov 2022 16:30:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 99e5fd8acc25.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Nov 2022 16:30:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAWPR08MB9757.eurprd08.prod.outlook.com (2603:10a6:102:2e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Tue, 1 Nov
 2022 16:30:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 16:30:31 +0000
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
X-Inumbo-ID: 8b378651-5a02-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=loEmFMar9PZ5WEh9r39OSc4aRXwn4KzNnycCp9Efm/cMLdq0D9YlR7AVaeWbXnQFCYQkeR8TERbiloXNY1bAdnazqYd3Tn6wy3e0YYBfVaePKGdScfUpUHixDLNMZ+gEUEq38FyNmioJaF8amKxfz0X6pUM+pvS809nB3GjjOlG8Hxa38ERzOaAATdrSl0Lf7qyIhSOYrui6MHT4stLIRPNbndYOUBTyo2EFAKFpIT/sFayUahdJKhJAxguwldNIRRp0rD17VdBaKpIWrOiCBNNS+WiTi4MrIJlt+TtQqc7dWH4uw5Ooq9tyVB1YmhtVissi7sXLyX6WdWt4rfXeVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i38CRmTm6wERfkVwb4A/x0v28RK8dyYprb9eOiTEGfw=;
 b=OFjqGrh+9IewE71+O6mGw2gJCC5yxu2q8HANhbQXjlXgzHXW5nqsdeoU0CRhzA9GKSCv5Ja7HENS1JM/zef9xE/MW8TwL5z00IQy9wbMliOtF+1vg4wYEfS6XEeu2E+CuhhhVqDr7kLd0wjGzEZjqoV4zDVDkOHJgFObZMcwfmVcUxVP+5Kq9XOiWGTC/tqbQV2gVLCPNJel4Yrzy25j+c5pavFPXwrC02d3WWGWh0gDj9MWMcjfclImqLNAY3UeYcwZXN2BRiJ08rp1MkYvu37vF5B7KkMoL1XLm8fdTQAf+DTkTXrQ2B8Hvyvb/45Rip20J9sS2R21AoI4UFXr+w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i38CRmTm6wERfkVwb4A/x0v28RK8dyYprb9eOiTEGfw=;
 b=9t8FKWqzCkxamLpY2Odo8A/6kmu6veZ/DOkEr3npkV0TVgkDbgKH288w3OOvq7JyKJ8wqICHhgOXDFl3beGqyJu9bD97AoA5o200msOMEJukUN1Xf6UECcPPR87Z/cpbYxx5gKk0ynpWpuKqaEfA3o/24FhyzIfXCwOUvlsKTGI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 07a42a0215627caa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHWUujGd+OnYg36jifm8InmqAHg7+HSMTP2AGBC7i9qX7diUqHoi+mggl7QQ80PFzOM+O+dUyeXF0KlYybtMQo888D90p8joL4UZV/shR0YBvtBl5OSAwHKQ3rjlHfVYkimid/S4LN3aFx++lxxOv/Wqg88uw9TIUGyOlwIFLj2sACLxr+nP/7ACpO2uQt8NgS9pg+yRcbLHa/FQI9QtRlDZfyBSE8shO3gQekzl9YJdf3z1Hq0FQGkfY3UWQq5f9aq9CZEY7IQtWhBDlgjL+aOTKuhqi8s/kjq0ome5hVwxiQVOPfeuL6wPuaFwxGmLLBPiWz+QRXmmOHZ9B8aRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i38CRmTm6wERfkVwb4A/x0v28RK8dyYprb9eOiTEGfw=;
 b=H5uBoq3wf/mZuQAuWU6d4DN+PMNGrpjx7kHOyGh6m5jYD7s7X5lJ/bLjWunlpt8EZa2M4tWVLkfRwmTcR4guEU4Bl6cKz4ouT855bLnd1NAcVPxoDopqpl/IDxkKQfEDjPxctzs6t7TtN1rdqmvNc41691Rr/+74b6oNyq/V4/7TNv9bCGTEhvIUD+fXLmPXKIrh0h9UAoFF8B+eoMyNgwQ/+G77Dtpr97kv14WwEtjD8ZEWRKd+CHT8sh4eiC8bEgcaCJbqu6PNEuT3Z7hP/TQCNFLtcSb92Dgd2dI9aW1zG1dQij058+bF/LL3RN1CYMWLrgkka13pW46S7tEMwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i38CRmTm6wERfkVwb4A/x0v28RK8dyYprb9eOiTEGfw=;
 b=9t8FKWqzCkxamLpY2Odo8A/6kmu6veZ/DOkEr3npkV0TVgkDbgKH288w3OOvq7JyKJ8wqICHhgOXDFl3beGqyJu9bD97AoA5o200msOMEJukUN1Xf6UECcPPR87Z/cpbYxx5gKk0ynpWpuKqaEfA3o/24FhyzIfXCwOUvlsKTGI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>, Michal Orzel <Michal.Orzel@arm.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Topic: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Index:
 AQHY6T1V+gcJbmRqpEyt0b8GeG9bFq4grXIAgAAQCACAAFf9AIABVMyAgAAG64CAAVVJgIAAAzuAgAACBwCAAAPNgIADNHqAgABdGACAABWOgIABD7SAgAGs8ICAABi+AA==
Date: Tue, 1 Nov 2022 16:30:31 +0000
Message-ID: <947E315E-6537-48DC-8AC6-5218C12B604C@arm.com>
References: <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
 <fde8c845-8d35-83cd-d4fd-bb2c5fd1a7ed@xen.org>
 <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com>
 <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org>
 <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com>
 <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
 <alpine.DEB.2.22.394.2210301523450.3408@ubuntu-linux-20-04-desktop>
 <82c45bc1-6052-502b-3007-8a16fbd1d433@xen.org>
 <alpine.DEB.2.22.394.2210302148150.3408@ubuntu-linux-20-04-desktop>
 <9F323893-B1C9-4D31-9A40-213345421860@arm.com>
 <Y2E05RLmXRIR6heO@mattapan.m5p.com>
In-Reply-To: <Y2E05RLmXRIR6heO@mattapan.m5p.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAWPR08MB9757:EE_|AM7EUR03FT049:EE_|DBBPR08MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: c1429a92-371c-4248-3c1a-08dabc266d65
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aOgAEzu4P6Wl+ILQHiFirlm9zYVIAROuO1lziC3Pfw5SX7r/p+IIFv/l1z8xfT7ySoHUX51CQq8BQM6LGm/11uynfbKE2hpsrleLzViRFmYaVykOpUfivdAwTIPfOjzbyULJa6TEQLKm7Pa+R6cezV4kmUeN5iEFqPpMDJInoVIJ+z9fLeUfGOZa/3/2r47slnqupicNboP3PxuZcqT55kMG4F2Zzgsiw4ZS4prOH6taLJHUbom7wjLzEadzAR9Psih7d/yanMxNFCucn63V99RSkC1Un7QfZlMjhRAfey9rxbOwnvsWBCCQrZpo1Q5+OF3Yu9K28jmnMn9JyNl4RI2JuS3gOIPWo7noeA+aaeWDrKodwfQX7gd37TnihJji/YdzxCHY94MmJdust4leNwLY8atzhzKFg93dXjA/6yFumqaEOmcB7WbU2U6z73CNiRkW9yesDDACnMHc+N+S4pAi87xafiQOUNI5bDwHpAurC/pN6BcSbaEJxOgWYZcAlcP/z+ieSSWYiZEUDCOKrk51A/5ZsrSjLzP2PUsS37PGEl+E44rweYMbhO2JXV/CjbWIVWg81XP88l7yWAZfF0JQe0+Jyi0MRUeCpAQYgjRx2Y9mRVjXg6F00tmMyyEDSm6ijodL5saYNFzm6a8Ld2kn9rb9vr1azrYYxaLdWQtW2as5irVNxpEEDtpkv/x5xqkfbt+k4MRCbQFHutK8ZdUBdddFfJHNiiYti2en5oMbX048kkWROhpJV2mVND21VMIsmFxKhhHW0pw7FKwqntxNtJHUn9ho6ZZ2lN00Qao=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(451199015)(316002)(66899015)(71200400001)(478600001)(8676002)(54906003)(4326008)(66476007)(66556008)(66446008)(66946007)(64756008)(6486002)(91956017)(76116006)(186003)(7416002)(2616005)(6512007)(2906002)(5660300002)(41300700001)(26005)(86362001)(8936002)(36756003)(122000001)(53546011)(83380400001)(33656002)(38070700005)(6506007)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D3F5428376973741AD4C801CD27710B4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9757
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e8672d6-1fd5-4e61-2d41-08dabc266513
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5aQODSEKuBTP+Qtep77o6J54s42qOUF4swpxu1/iM7uaETfcXGdWScnfjiwUD+wFR6KvVgrA86A1PHGk3VFxvguutU7pZcaj4Ojzb9ZCxXZFDcRzQfpDUF/JgZJhzy2K1aT6I+m31Kaka+Ak8gHK7snfeC9S8MsSvN00pmPDR3AHfdYHvrpK1mAXBywCEqYyxQ46fW9Nhl3Oa6WSXvPDr4VOUz6fl9y/QEa57XfIZOFEKli9OSGz+g455NeOC9pLuDMMcYcpOGg9Y7jOR9pKvC8T2S9s0qQWspbFOXczTn7c8xWOgCFpkWZQU+x7KBweuXJTFNSgcRcdxnofpc7Xo4mzM9fmsSQd8NQ1W1sbUrpjMhz+GknAXl2R19AtRYoUHDfbY1KObGVpRKlPxnXqRWFieJsOH5ksyBSiRFqikw3i8UoRRoiauR0Hxhzche+d3KxCCbXZhddBSAgmY225WzE9LK9wA844GhiAv23kr/g7qjBK2hyN3xQYvlo4bhXTqJnjSWxWhN/HoYJcGS9GvyKjh7f7ci5oF19U44SN1aRom5wBBsOMag51Gsj9/WhmvPxvDY8SJV5EYmF5RNULaxb0pzY4qi2zRM50ZjD80I1mLO+6fjHQOKZr8jPrBQ/VNN4ml3wPziB59qLhwEM8yaPEiGDE72cV0UDsKDA+UvSff1HUyfWoO6bpBO7pxi31gjMwGfxSQ3u17DgqJB/Ve7ebJ24YooHF4Cfevj29fxKztXcsu4kc6mw6Q3Q0W45KdnvzvrJZH8AYEAzm1bkveA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(83380400001)(47076005)(336012)(66899015)(82740400003)(33656002)(36756003)(70206006)(2906002)(107886003)(6486002)(81166007)(356005)(86362001)(40480700001)(82310400005)(26005)(6512007)(316002)(53546011)(8676002)(2616005)(186003)(36860700001)(70586007)(4326008)(54906003)(41300700001)(40460700003)(6506007)(5660300002)(6862004)(478600001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 16:30:45.5851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1429a92-371c-4248-3c1a-08dabc266d65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6089

Hi Elliot,

> On 1 Nov 2022, at 15:01, Elliott Mitchell <ehem+xen@m5p.com> wrote:
>=20
> On Mon, Oct 31, 2022 at 01:26:44PM +0000, Bertrand Marquis wrote:
>>=20
>>> On 30 Oct 2022, at 21:14, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>>=20
>>> Ideally this would be something quick that can be easily invoked as the
>>> first step of an external third-party build process.
>>=20
>> I think that we are making this problem a lot to complex and I am not su=
re
>> that all this complexity is required.
>=20
> Speaking of complexity.  Is it just me or does a vIOMMU had an odd sort
> of similarity with a Grant Table?
>=20
> Both are about allowing foreign entities access to portions of the
> current domain's memory.  Just in the case of a Grant Table the entity
> happens to be another domain, whereas for a vIOMMU it is a hardware
> device.
>=20
> Perhaps some functionality could be shared between the two?  Perhaps
> this is something for the designer of the next version of IOMMU to think
> about?  (or perhaps I'm off the deep end and bringing in a silly idea)

I am not quite sure what you mean here.

The IOMMU is something not Xen specific. Linux is using it to restrict the =
area
of memory accessible to a device using its DMA engine. Here we just try to =
give
the same possibility when running on top Xen in a transparent way so that t=
he
Linux (or an other guest) can continue to do the same even if it is running=
 on
top of Xen.
In practice, the guest is not telling us what it does, we just get the poin=
ter to the
first level of page table and we write it in the hardware which is doing th=
e rest.
We need to have a vIOMMU because we need to make sure the guest is only
doing this for devices assigned to him and that it is not modifying the sec=
ond
level of page tables which is used by Xen to make sure that only the memory
from the guest is accessible using the DMA engine.=20

So I am not exactly seeing the common part with grant tables here.

Cheers
Bertrand


