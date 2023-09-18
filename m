Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704F77A4B6D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 17:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604113.941340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiFsl-00086L-KQ; Mon, 18 Sep 2023 15:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604113.941340; Mon, 18 Sep 2023 15:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiFsl-00083M-Gj; Mon, 18 Sep 2023 15:09:51 +0000
Received: by outflank-mailman (input) for mailman id 604113;
 Mon, 18 Sep 2023 15:09:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OhQO=FC=citrix.com=prvs=618330109=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qiFsk-00082x-3r
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 15:09:50 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64c02e63-5635-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 17:09:43 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Sep 2023 11:09:28 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5380.namprd03.prod.outlook.com (2603:10b6:208:29e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 15:09:24 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 15:09:24 +0000
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
X-Inumbo-ID: 64c02e63-5635-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695049783;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=f6mys5BJ2zNreCi/cZrhpsxfDXzPVydWPUUvEIMTMA8=;
  b=YByzKzH7+liE7CXRVikIBPdHeXlsXODOsoeiz8pxELB72OF0W1dCJFSC
   duUwMmmBLDC0KaUqFI59nPyB+t7N6MyDQDYJtvEVgXdcwszq0LvD4mgfl
   r0yNKsiAgmk0b/TUfZfkTGSvzAUcyF4E5PGDflHSHMgm2h+/MRlzgUIsZ
   8=;
X-CSE-ConnectionGUID: twugktINTlGOIQ4HunfO2A==
X-CSE-MsgGUID: MaINDC9cSTSHOGfZpAHqMw==
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 121629498
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:f2TJEKJ+lq7qWpHOFE+R95QlxSXFcZb7ZxGr2PjKsXjdYENS02dWn
 TNMWj2HOq3cY2T9Ko93Oo6zphwO65OAyYRkTlZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrZwP9TlK6q4mhA7wVuPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5rHnxB9
 uA5DgwJQTeivr6W3bS1bbNF05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGNnGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv237GVzH+qCOr+EpWd/99MrHbCzVcvMz0xelWJudCZk2uhDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ul7Cmdx6yS5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pES0cLGtHaSpaSwIAuoDnuNtq0EKJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:aNdiwaEGM8pKGWtDpLqEGMeALOsnbusQ8zAXPiBKJCC9E/bo8/
 xG+c5w6faaslkssR0b9+xoW5PwJE80l6QFgrX5VI3KNGXbUQ2TTb2KhbGI/9SKIVydygcy78
 ddmtNFebrN5VgRt7eH3OG7eexQv+VuJsqT9JnjJ3QGd3AaV0l5hT0JbDpyiidNNXN77ZxSLu
 vk2uN34wCOVF4wdcqBCnwMT4H41qD2fMKPW29/O/Y/gjP+9g+V1A==
X-Talos-CUID: 9a23:dvkMaWH53CvXFgN7qmJ761MbGdwEVEHZ41DxGhOYFGBnb+e8HAo=
X-Talos-MUID: 9a23:cemQsQSnom5ZVnOWRXTJjRBEGOw56J+SM2Aqvps0o+CkLAlvbmI=
X-IronPort-AV: E=Sophos;i="6.02,156,1688443200"; 
   d="scan'208";a="121629498"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKAdgL/M72Yemclbrhpt/a5hU1DhcRFASdclJm4Hy6XHYrbEUPxaWA1a1euv/NAW7L0FvVzsGSncEsOtyvDq9WbvWTR5pTomVYUiGd7aYIVx/lZQmIWFGXY4SJkrbz69pEsfFkAv4fJQJD/UTSw0FFXGIvDBWG/F1ES42dbski74UYBhQvo59fT0thU72BO/RmIrfXmumnm+LcLpI+0Ard9ueZs5Yyo9HURXVZZ82fOnSf/cYkbuA/McVt8IxG+5+9Il+a2sNOdOBypauYC+ykIZyXLAu5LIXyn+ZwXAvbQIhSrdFTzvKcjvABJRQv0fwrBqwG4jdxCNVZhK/w6h5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjn9/0FlY8u/9J1L5W0VPRgG4dVPwDDwB3/UuSeomd8=;
 b=EogD/aCuyt/l+bhaBMtCHKgErVvZJIPfv6Na3hh+n8dbf3M1BwxAMqKeKniJvNjCKhnHtjIwnW8xOasANTe6+//yjW2e4XbMSxjAVfD3ra6eIHu9dqLWf90nScggE2WbamhUa+5cQQJA6naBcS3sIeRIR417WzDJ+bJ2v5Oy6888C85/wZguNpFC7LLo/e+LefqH0MzLFuKLQD4P+yiUcKqrPCsRExUwawPArbSyxQyUIPEW51JKUjKG6t3FGeBfTZHfwD47PFJhkC7IvfC9A24REVLEWv2fqYafenw2BXhdek9EEYwmeqj5AQbBE/EhCUe0hz8XPlBhEEDx6u4sEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjn9/0FlY8u/9J1L5W0VPRgG4dVPwDDwB3/UuSeomd8=;
 b=On8MVSbexn9HEk23xom7hZReMFSq1D5lyN7drnItNSyq7FoXXolHPbKjGMzBychpnUpMalYhmkJeK3IiHXdDHXZkPoWXoQEU1k9qn8HQaw/XcQ0WFfI4OtVRlgS5Cv8E+Tip+fXBioF99jD//kwHp2MrPpELbktCdpYjXxtRn6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 18 Sep 2023 17:09:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/shutdown: change default reboot method preference
Message-ID: <ZQhoHZvk7tXfGI2g@MacBookPdeRoger>
References: <20230915074347.94712-1-roger.pau@citrix.com>
 <e22af903-cbdf-dfed-8f69-44e5ea05ef8b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e22af903-cbdf-dfed-8f69-44e5ea05ef8b@suse.com>
X-ClientProxiedBy: LO4P123CA0154.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5380:EE_
X-MS-Office365-Filtering-Correlation-Id: c6379103-c9ef-4c05-6658-08dbb8593e0e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ClTij1hN0h9mkiqAI1/uJYqfkyF9u2By4mQDWgIOF9WPw031lBKhvPt3J2A7JIrI6IJ3J2gdRhFZpRqftVVirFl8ai2ImAeoVFEIF1PkbUdXQTpe4th2shrHF0gQ+VYgWdcpLjx5+sgYNxq3wDpGVm17ytCW5fDq+EbpAA0OmnGc+yIk8+t3XwNcU0EpKFqqYqo2I2opWiZYqVVh2Ep8CWbYX9q0eNu1ZlsHVGHvpl/ukgcOI002RxFFhnkMD1gTAC/28Qlb8BJgaek9ti9HUnCi0AGYEU3MVtnm20YJylLk0xUcRGnDz//Vz4S/yVyr312rgp7YxQNy1LtFfVk6IotafEb9g8T46ZMesQaIQCKNF2tNtkXhjXTu/sOUGJPIlYtdIBSCRrZBB/3lvwQH93vuxPVbnQWRRyUBOgKRMH4xNXqtaQcQ1ETnD5LQSFXnuuO7PoREx8KjQeXwTThnJgNR62ZDmLabSqOTMyMOmB5srNDbl/OHQfxR4LXk8hZE+e0Pk/fAXZNbYCC+R4uU1WoFL2w4gsJd6OSyXqtX9ELiP9KmtwCpDwBbDKA1D+K+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(396003)(366004)(136003)(39860400002)(376002)(1800799009)(186009)(451199024)(6666004)(6486002)(6506007)(478600001)(38100700002)(82960400001)(8676002)(4326008)(8936002)(26005)(86362001)(5660300002)(54906003)(66556008)(66946007)(66476007)(6916009)(83380400001)(41300700001)(33716001)(316002)(6512007)(9686003)(53546011)(2906002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y25vYmRnYWt0MGxLZWE3RkM4K2dzTkQ1RVJkaTRlK2NrM2RldmZXcjVqVzk0?=
 =?utf-8?B?TzN2RFVhVVFkUWxZaWtpNnlLeGVnS0phYjg5b2FwZnMxNTNMdERzcEYyUWZr?=
 =?utf-8?B?WXBxd3M3VUk4UnlnOWxkV2Y3WTZMcnN5K0Z2UytCRmkreVQxekU5cHgzUVpX?=
 =?utf-8?B?K0ZoUitINFB4SXNtTDNURmh3QVF3bnBiSGt1amp4TW84a1JuRFEwSlorSnpl?=
 =?utf-8?B?Z3JCSDF5WEZUZnp1K2xTVjh4LzdmRUhxeFdSTVJzWGxtYlhIR3FaVWFNYlU2?=
 =?utf-8?B?OFE4cERYRGdMVnpvaU1HYnBlVVRBY0ZwZnF2TmZxbTBxYU5ZTGp6VzBndURi?=
 =?utf-8?B?R0NEdzhEVDB4QWlCcHNiTVduWHdVVm9NUkpBdTZER21naHpLemp2OExWTmFG?=
 =?utf-8?B?WHM4UEUzaXIxMVA0VDIwRWg3eFJ1RjJFYTJqamp4NGVUazZVdERpOWlCSll5?=
 =?utf-8?B?R3RZY3B4VW5GSjZQeTBPN2Q4RFdMQkxLUmtudnNMZ2RoWmFYOHpYTXBuSTZ1?=
 =?utf-8?B?cHEyRnk1LzVBWHh0Ui96R1FSK2NuZGFvbWs3a0xiSUlTYVlJRnR1SUE1Y05U?=
 =?utf-8?B?Skc2TFdNRnN1dDhSVXo5WkJaMWw0VGNxRElwZEVHWDJVVnJQblA3NEdsSklQ?=
 =?utf-8?B?WitYc3FEbk9rQVgwaHVwOU01bEltdkhIVnlwMjhvemxuL0xDRVRsOVZWcHF5?=
 =?utf-8?B?MHJlSHFndzcreDRrUG9wcFNnUlRnTStMZmJzeGdLOTZRSzdBYmhRbFdtUXdy?=
 =?utf-8?B?Y3NobUd3OEllclRkQ2l2SlVVeWRPcnkrSnJFZmdRTzdUWFRkd3BucHZUK3Az?=
 =?utf-8?B?bTZLTmVCUkFuYXoyL3N6UWR4bm1VSTlMNTlqZFd6VFBPZ1pnQVRiR3BrZ2J5?=
 =?utf-8?B?U1IreEViN01EUVNYWmd1WU9TWU5xZHBPYUVEVzZNKzgxVjFwZStORllxcytK?=
 =?utf-8?B?dndoS2orRTdhb0djNlkraUlNRGEvUDZvQTdJdWZ3UXVyR1JGS2RVUm1UZEdz?=
 =?utf-8?B?VW0zY2JCampQQzBzVXhlb3BkUlQwbVdnSThZSzRhUnhsNjhuUU80K1RmbGZ0?=
 =?utf-8?B?YjZWR1U5Ykk1Nk9STkhUdEF5N0ZkODNTTk44bU1DNDl4OXR5OHExWDlnSUYx?=
 =?utf-8?B?dUdPbGFaRElHYVhOYXFiR096SVBGQWNGRFhCVEU0Z1N6R2xtb2xCc0dkY3Jy?=
 =?utf-8?B?ZXhFQW03U0QyWVQ3dEM2TnVXU1NsRjZNR013SGF3WEJwd0Eyd0Z3eGh5S3JX?=
 =?utf-8?B?bFFjb2VDeVQ1eDcrUGNWeGVwSFRLaS9oQjVSWjNUeFZ2eVBpSGliOTJWMjU5?=
 =?utf-8?B?b0hUaXRvU0xiR3FqaW5sNWUrbGdRUUdONjQ1ZW1Fam85Sk9vdHBhZjhFNDlz?=
 =?utf-8?B?RVBMRUd4WndRYVFqWGZTelBUMytvT3FyT1hhaTNyWXRwN3R5ZXZIVDh6UFBz?=
 =?utf-8?B?TE1Td3hRMXBnMTdVNmlVendvK0dGSzQ5QTNsTW1QYWkrOG4zNit6Vi9iSDk2?=
 =?utf-8?B?alFaYXFpc3VHRFhrNTJWMTYzQzByMkxYeTBVamxCNnoycU42UUg3YzBGdTBS?=
 =?utf-8?B?L0VwSEszeXRVcUwwVUxWcm5tZHVNT1ZvOVczNk5CZ3J6dG1JK2FWYk5tWTVl?=
 =?utf-8?B?WDJ5dHRlZ2tXd29wTzROcGRLUmlxS25ZNExrNnBDOVhVQnJVSTR5YVRoK1RR?=
 =?utf-8?B?by85VGlaUHRDbXFtdURwVWRzbkJPclVPUGgyYkovWUpZVjgzbW5TakhsZDBI?=
 =?utf-8?B?Nms5b09mdWJkcWQ2bkRORzhlblNqVHplMktMemxTSEZqRldFejQyMDdHT3Qy?=
 =?utf-8?B?VnZKSlJXTi96Q2xhUHhkcTF0NTJXSytiaWkzdHdjTUN3elRFakhQdjF2MG9y?=
 =?utf-8?B?ZHVrTWNmQTc4T1l5ejFCZEtGM2hrNFEyQi80Q1NHZ1lUdGJpNmVTS1ZZZGxB?=
 =?utf-8?B?NzR6NklBbGlEVm1TUWhQN1BuaTJ3cWlhVDJEekNSR2FpU2g2emNPRW9UNmhl?=
 =?utf-8?B?bjJaTEdMSUs2ajVPUVdzRk9adXZ4azIzdGNMNVlPQS9pSFg1NDg0Z3pRNGx6?=
 =?utf-8?B?Q09XSkZYWTh4RHJWQUZHeFpJVlgrL3kvcWtLZmZGeU5JdkpMQ3RacjcySE9s?=
 =?utf-8?Q?+x2I/aoXd/FOBU+qOs6d8iiAi?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M7/OlMXSmzSKRGSr9pRgpJvXZCCXRTNbLbuSLD51COnupeglBplRepNXRX89PHP3hoL3/feY+h482LZ2rhIixfl6E4BjWn2IGZlIPdsjRivktlhg1i38EHvf1w4lhsRZKQmigNLS0q/2D6W5IavF6kdPZEqfeR555seVceI2cZb4N9gP7LjqUl4Tp5ylND+3ca2Lazi/vBN0BfO+3sR83w0Hg1pQAcyET9Yc339+XdDze/G9vJzWyb6pQDgjmwx9wVq3A/OBWqnRjVtcAeQpS2QmWSeaHQNCg8poavuGUgPkRzkGe0HubWDyEyc3Y5eHJ2gYmbDFab71SgQopebYbtF99GyT/3wcLPpHwcBsNVyoV6YL5sZr7imkLj1/wi5WQS5acNnw4ywfiVcTld8CMCG67wiX8FqckcS+RQ5T45badtXJk7oqIq7aEFQl7GuQCqoAkySjGH8B+sg1kcjoa4/9hN1gp4hU4Jlpfunqpl5b4VglSFfWEI0B7fFc5H1YUxvUM5U5kVKMOa6LYXwlqMgvq+nH6opUfscUcYtaSBKQGjECh4URiACFXFBR5rd4AaVZn/RmKVpFppXt40ror1xitu+FtjroQALl0X+tnuNciyQqoUxAh0A2l43r9raOEV+snBhUniWMNXab2IIIxfmE7jHiSqMGs1jf4COOOHdkluiqMjut75Q0BAvStYBTbqrUaT69ZIoNaT2rIJk+7vhzrRaA23iaBJ9ztVyvOwwokQqnDzgXSEpbKSxq9arXsOV6KbknVTuvsdWtNjJyEuuKStD2eE0P3bJYy3rs3Am0M+F1JHxtVXfaecLErL1b
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6379103-c9ef-4c05-6658-08dbb8593e0e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 15:09:24.0124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkrWUhppZ2W3nbFUVYqr7LJfj0FtAPBJcIu8ghNXx+PHmBpgK/KPJCs7W8gpKhXxEDpBWvynKP77Ep9RdzpSWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5380

On Mon, Sep 18, 2023 at 02:26:51PM +0200, Jan Beulich wrote:
> On 15.09.2023 09:43, Roger Pau Monne wrote:
> > The current logic to chose the preferred reboot method is based on the mode Xen
> > has been booted into, so if the box is booted from UEFI, the preferred reboot
> > method will be to use the ResetSystem() run time service call.
> > 
> > However, that method seems to be widely untested, and quite often leads to a
> > result similar to:
> > 
> > Hardware Dom0 shutdown: rebooting machine
> > ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
> > CPU:    0
> > RIP:    e008:[<0000000000000017>] 0000000000000017
> > RFLAGS: 0000000000010202   CONTEXT: hypervisor
> > [...]
> > Xen call trace:
> >    [<0000000000000017>] R 0000000000000017
> >    [<ffff83207eff7b50>] S ffff83207eff7b50
> >    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
> >    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
> >    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
> >    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
> >    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
> >    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
> >    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
> >    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
> >    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
> > 
> > ****************************************
> > Panic on CPU 0:
> > FATAL TRAP: vector = 6 (invalid opcode)
> > ****************************************
> > 
> > Which in most cases does lead to a reboot, however that's unreliable.
> > 
> > Change the default reboot preference to prefer ACPI over UEFI if available and
> > not in reduced hardware mode.
> > 
> > This is in line to what Linux does, so it's unlikely to cause issues on current
> > and future hardware, since there's a much higher chance of vendors testing
> > hardware with Linux rather than Xen.
> 
> I certainly appreciate this as a goal. However, ...
> 
> > Add a special case for one Acer model that does require being rebooted using
> > ResetSystem().  See Linux commit 0082517fa4bce for rationale.
> 
> ... this is precisely what I'd like to avoid: Needing workarounds on spec-
> conforming systems.

I wouldn't call that platform spec-conforming when ACPI reboot doesn't
work reliably on it either.  I haven't been able to find a wording on
the UEFI specification that mandates using ResetSystem() in order to
reset the platform.  I've only found this wording:

"... then the UEFI OS Loader has taken control of the platform, and
EFI will not regain control of the system until the platform is reset.
One method of resetting the platform is through the EFI Runtime
Service ResetSystem()."

And this reads to me as a mere indication that one option is to use
ResetSystem(), but that there are likely other platform specific reset
methods that are suitable to be used for OSes and still be compliant
with the UEFI spec.

> 
> > I'm not aware of using ACPI reboot causing issues on boxes that do have
> > properly implemented ResetSystem() methods.
> 
> I'm also puzzled by this statement: That Acer aspect is a clear indication
> of there being an issue.

Hm yes, I had that sentence from v1, before realizing the Acer quirk.
So there's one know issue with using ACPI as the default reboot
method vs many issues when using the UEFI one.

> Plus it's quite easy to see that hooks may be put
> in place by various firmware components that would then be used to make
> certain adjustments to the platform, ahead of an orderly reboot / shutdown.

Well, I very much doubt any vendor would rely on this, seeing as both
Linux and Windows both default to ACPI reboot, and the UEFI spec not
mandating the use of ResetSystem() anyway.

> > --- a/xen/arch/x86/shutdown.c
> > +++ b/xen/arch/x86/shutdown.c
> > @@ -150,19 +150,20 @@ static void default_reboot_type(void)
> >  
> >      if ( xen_guest )
> >          reboot_type = BOOT_XEN;
> > +    else if ( !acpi_disabled && !acpi_gbl_reduced_hardware )
> > +        reboot_type = BOOT_ACPI;
> >      else if ( efi_enabled(EFI_RS) )
> >          reboot_type = BOOT_EFI;
> > -    else if ( acpi_disabled )
> > -        reboot_type = BOOT_KBD;
> >      else
> > -        reboot_type = BOOT_ACPI;
> > +        reboot_type = BOOT_KBD;
> >  }
> >  
> >  static int __init cf_check override_reboot(const struct dmi_system_id *d)
> >  {
> >      enum reboot_type type = (long)d->driver_data;
> >  
> > -    if ( type == BOOT_ACPI && acpi_disabled )
> > +    if ( (type == BOOT_ACPI && acpi_disabled) ||
> > +         (type == BOOT_EFI && !efi_enabled(EFI_RS)) )
> >          type = BOOT_KBD;
> 
> I guess I don't follow this adjustment: Why would we fall back to KBD
> first thing? Wouldn't it make sense to try ACPI first if EFI cannot
> be used?

This is IMO a weird corner case, we have a explicit request to use one
reboot method, but we cannot do so because the component is disabled.
I've assumed that falling back to KBD was the safest option.

For example if we have to explicitly reboot using UEFI it's likely
because ACPI (the proposed default method) is not suitable, and hence
falling back to ACPI here won't help.

> And go further to KBD only if ACPI then also turns out
> disabled (a mode that Xen quite likely won't correctly operate in
> anymore anyway, due to bitrot)?
> 
> As an aside, KBD likely is unusable on hw-reduced systems, for there
> simply not being a legacy keyboard controller. Instead we may need to
> fall back to CF9 in such a case.

Hm, I can send a followup patch for that, but not part of this
change.

Thanks, Roger.

