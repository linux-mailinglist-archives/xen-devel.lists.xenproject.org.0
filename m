Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA3C7D85C6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 17:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623878.972153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw23v-0004H2-AK; Thu, 26 Oct 2023 15:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623878.972153; Thu, 26 Oct 2023 15:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw23v-0004Dz-6G; Thu, 26 Oct 2023 15:14:19 +0000
Received: by outflank-mailman (input) for mailman id 623878;
 Thu, 26 Oct 2023 15:14:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iwvv=GI=citrix.com=prvs=656fec104=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qw23t-0004Dt-Hu
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 15:14:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52355951-7412-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 17:14:15 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2023 11:13:55 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH8PR03MB7247.namprd03.prod.outlook.com (2603:10b6:510:23a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.7; Thu, 26 Oct
 2023 15:13:52 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Thu, 26 Oct 2023
 15:13:52 +0000
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
X-Inumbo-ID: 52355951-7412-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698333255;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RBykdSC27rMc8PomWxEbw89B2Yxnl2WKc0Oxm8M6a/M=;
  b=NT1KcKidNJ4idE1OB4ZspBR0nYdP8PMk9gJm4afwiJKdetrYzURv5y6K
   AciDlXaUpW4o0sIS7erKzmx+vfL9ax9Ih6/paJ7wHR/fPRugoV+vZ6lTo
   vruDtjqmhxNBx/bN8pKX91kAG5+F4E8AhEs34rlfbGaDXfErfmNZSdNn2
   g=;
X-CSE-ConnectionGUID: /OeqPfcZSdW/Mzdx6ky9TA==
X-CSE-MsgGUID: LQiRPMPoSkWdRiiFTEW4iw==
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 125336216
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:DyDpZ6LK+I0Hcu5CFE+R8JQlxSXFcZb7ZxGr2PjKsXjdYENS1zEGn
 2sYWD2AbPnZY2rzctwnOouw8BgB6sKBmoA2HgZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gZgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4wJmxXz
 fITGgsBUVemle6mnrGqG9VF05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLlGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv227SUw3miBur+EpWcz/9QuHirwVcQNxEsVFqVndSG1k+hDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8kN+pES0cLGtHYDBeSwIAuoHnuNtq1kqJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTND1D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:lo01qq+upt4BddlLTKRuk+D6I+orL9Y04lQ7vn2ZKCYlF/Bw8v
 rF8cjzuiWZtN98Yh4dcKm7Sc69qBDnhPxICOsqXYtKNTOO0FdASrsN0WKI+UyCJ8SRzI9gPJ
 BbAsxD4Y3LZmSSVfyKmjVQyexQuOVvLZrY49s2E00dNj2CtZsQkjuQZW6gYzRLeDU=
X-Talos-CUID: 9a23:KCJ7nmwdPfmrVfXrQzPoBgVTPc08SnPW/kzcHAidG2p5Fr6EGGO5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Az6jzUwxQ7szhwVdTvFNXZh45yJuaqICXCXo1tK0?=
 =?us-ascii?q?BgMq7ORZxOhmhoQvrQ5Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,253,1694750400"; 
   d="scan'208";a="125336216"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6Kx4dYym8BG+NNJej5fj/NcytU9OTd4Use6F6vKU5chNTQ7J80u2C1ui4Q9GbuQeBVs+abKPhz3wzJ18+7ruo0cvUn5arOJHTgmBMAEQhFv+6pD6SnQKkpcjFHXp9G5UFAEiic7fMxAqYMjS8YqgWY15JpQhC+ScpJmpXU8XXvANEot9C8/c3uQx6nEMnGhIV0+AwYBboVm4K03uvyKtWDp/PcZV1NfWDA6juJsowcxWgc+R/allCQq961acFEEfwhs9JUp0uh6xjZ/Nuoln0M2GCqddSbEvZDcRaT6hZ1F7Am6m7OFrY1DBccCzfOmHPg1hJlPr3kEKQ1J3C37hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7b57vQ+UKpWXFt46GTsAvlt4g5no7bWRnfPfrkWI110=;
 b=DsEnn6c4WFZ4RcKE5Jh+JGuzVyeNt1e54dwADHe46epI2wbGgAdgQmDGycmQ4ESbi2sSfcWK+BPMfWxFVDWVFlhd4Cq8++z8cnlCR1Bu5encQL2aY4qm3LR0Kam0Q+yIDKpSI6Qxc/uEHkqxnBu02+fQqzo1af+kVTy3dsX5IrOJZ06/maddaRcxMLerNYso6jj53pMTg+sNk57WumwH9/Qsnur0+Q8tFNyF6C4Zrb7HpqoKQLM0tyJ0/kS+HnGG4q7fEIBjUApWcZIjUA6J6wyX3EWu9P124Db+Jv3WAIou/sDN1aivcSO0GIusBCg07R66aNFBxpy3YcZzjkMlXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7b57vQ+UKpWXFt46GTsAvlt4g5no7bWRnfPfrkWI110=;
 b=WI3VDnCnqqezGHXiHraF93OxsvKK7T5G14+7MYuKkqDTYlg+kNsZGyezqUij9ItFUUV/aoQbuSPWNXi7L/oGqUk0ueV8D1zm4yaHK4bKDX5A4E3GH6m2jvi0HKdJ9VnHMYC9cOxXfUcYZKxblUSYOo+A85eeaygbDmlpY7YofXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Oct 2023 17:13:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/7] x86: detect PIT aliasing on ports other than 0x4[0-3]
Message-ID: <ZTqCLbFJkAyKCPuc@macbook>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <042f76dd-d189-c40a-baec-68ded32aa797@suse.com>
 <ZTo-tpk64ew4rk1o@macbook>
 <6c3a4243-fef4-129c-8f58-7bc009f886b6@suse.com>
 <ZTpwTrLU4d90lWYm@macbook>
 <bbc0d98b-8908-3fdb-ebb9-6cff5caf940c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbc0d98b-8908-3fdb-ebb9-6cff5caf940c@suse.com>
X-ClientProxiedBy: LO2P265CA0105.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH8PR03MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 9037e05a-5436-48bf-b60d-08dbd6362a16
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t1wJhpHFz2kAPsuvLcS2uvPHptb0FESn9+x1hKZOlZ0WyiP4KAUgnqVhFx0zOrsME71MlcLpaIbxnUj8P/fTXGbKM9xZQV6LvWeckrz7oKNRNG35dz+vMmihALs9fQlbv3xbcThDv4WhGmkJJM8u6fBT/wETKEqsP5YmJRBJ3duwcAY6HJWTA6YLPqwVf5kC6aWpPOT9YXQgy/7CfR25nwHWdem4im4SCIxIlagt9XYqJFtRmuMMzDrMFyIuJXpjvGs76wZ4a14V8lDe7fp+xR+wbgvHRhxuQejv/HSOLB1J8LSG3LeQGkBMJEl3ml7jd3sEg0lc2zaUTooy3V40RkricWRPCpdOGn5eASz8MNSfOhlkdmIHhIKR0ITRqrG7hwQ0oYJjlFs1mKma1/saIq8GVHt0GqqgmYjxHnwhVmRUGeMHeav+U6rDiWlLs4CtpZpIdyM9LJR2BbDFWW6BwUbbiQa2DzV5lDb1jMrHSSueMF6n/l9kHI269kc8oDuXG/ntY/gEdfdVznLaxM46hOQY8MjzP1wdX5p7Jh1YA81meBVKIwyHnrdw8r/s8BrB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(66476007)(66946007)(82960400001)(54906003)(316002)(53546011)(6486002)(6916009)(478600001)(9686003)(6506007)(6666004)(6512007)(83380400001)(85182001)(33716001)(66556008)(86362001)(38100700002)(2906002)(41300700001)(8936002)(4326008)(8676002)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlBrckFKemtQaFk2TkpxMFNZei9PWlRiMUNuWCtPalBMOEl3S3dqRkR5czZZ?=
 =?utf-8?B?b2UwZ1pKN3RPUWh1Q0xLSXE1MlllektKbFlhbDdCem90QW4wSkkrTnZld3pF?=
 =?utf-8?B?VHFzUnNvZ3BNM25ORkpjaXNBM1ExeHhvVjVEZDVSZnNiSzF0T0JaNWdNenFM?=
 =?utf-8?B?c2Ewdll0R1ZJZkV4citscHcxRHRUODZyYVI0Ui9mY2MxVVBROXhtL0V3dlhJ?=
 =?utf-8?B?RlJxbVdwdjF5TWhFOEVzSWcxN0pjUDNLbDZxb2ZXRTRBSHZHVVZGaVhMaGJy?=
 =?utf-8?B?MCtuQnJRRnM4YnlyeHB6c3R2OFk5RklTd1NiTUN2eCtOdExvalJtMG10Mjg1?=
 =?utf-8?B?MGVMd2JMQXBPajJUdkpEcVBUUmNDaDdmSmh3eSszWTVPL3VRUzNlMTlvWU10?=
 =?utf-8?B?Yk5PSXF5aWdwYlFJY0pUTWkvSGt6Nzd5c0ZzYy9mcEYvbzkxMjdCeHhzbzJN?=
 =?utf-8?B?QXBtUUt1SmVFQUJ3VGdWQ0U5d3ZtRzZ2SVozak81NmFVS1lOSXN4eDhUamNH?=
 =?utf-8?B?dzRvKzhGVjVWZUZyK3ZyU0RWZlg2d1RKQVFFTEVMRHpZQ3pERmhQL2ZPUURR?=
 =?utf-8?B?SmE5dlZsVHNQUldsNndpb3FWZml2MUI4bTJYOVI5bVRmeEUwczlDZXN0VElm?=
 =?utf-8?B?QU5KelVIRGxwWXgzQ1gxdUl5Y0g2QUloQjMzSFJYSDQ4MWJBSzU1TjdONkJt?=
 =?utf-8?B?RjZQMDM1L1JkYlFHMUZnbWZwN1JOenBEeUdsWFVLakk0WDRPU2lhQjgrdlpS?=
 =?utf-8?B?ZXFLNTFhR0JlWGNmNmJoRytra0dPck16a3FFVDFYRE1qQ3Ivbm5tWEVHMTQ3?=
 =?utf-8?B?d3NPZzFVeXhyb2ZIRWY4RVExMmlBQWtuS3AzR0tHeDlxdzZuLzNad2VCQzB0?=
 =?utf-8?B?N1BWcXJLRlVZM016RE10c2xadXNFVGU2cG1KbERPcklNYXZGT0FibkpObmtI?=
 =?utf-8?B?UUZlZzJ1NGlCWGpJbFRXRWtyQklGT3FiR3pnQVhHTDhTYkdCRHNIbHBQT2VD?=
 =?utf-8?B?RlkrRmtoc1lsdnE2UTczbHpqWUhYbWttbDlVTVE3d0MySlZnVUxPRFZHTFdt?=
 =?utf-8?B?cGsydEhEU2VzbVJ0YzMxc0tVdkIxL0pwc3VJRGUwek1iNG5ONW0zMW1xcXdJ?=
 =?utf-8?B?RVd5cFM5SFNjZ1l2NjAxTGQ1dUZxdVVZcnVxbjBoNFN1Sk9YdSthVkQxZzY3?=
 =?utf-8?B?dytsR0xsS0wzOGJaSDZ0QzNQZEpQLzhIWFJyUjl1MDVSYS9oZGxiUFJNdDBT?=
 =?utf-8?B?cEhDR3lTRmsxVVJkeno5bG43N0Rnb1BMcEozSnFCYTM5R1ZneUUzNExNUk5o?=
 =?utf-8?B?Q2lhSTZlUHYzTk5kN01RbVh1VVljd1dTTkxWckN6eGdSelRXdkpkUWRLNjZV?=
 =?utf-8?B?OURIUEFMSWllZkZzdnpnWkVaNCtKcUZINkNjT1R1OFFiWW9tUk9oSXZqb3pC?=
 =?utf-8?B?Z3JzWnFUVlhnUGNhN09MOWE4dDVaV1ZjU3ZqWlo5R3ZOcTJWZnpRTVk5bXg1?=
 =?utf-8?B?ZU52ODhmc1RiN2s4TlgrZ1hoVkxEb05LUUVZeHJ5cjlEWUNjcXp0OWVCeDlx?=
 =?utf-8?B?SHBBVVBhWVhGSHBzSlljUmFYZGxaeGkrQVhOZHlKc1ZxV0ttc1k4eUk1Yzdo?=
 =?utf-8?B?a2dKTDRaUGxrcUw0R0lwa3oyWFNvYXNDWkZISGpqQXZFTWlocmZNQWswV0x6?=
 =?utf-8?B?cEdqTVF5eGMrMHp5RWdGaUMzZWNBZ1U3bjJGWCtqQnFqR2c1Tk5tZ0YxNmd1?=
 =?utf-8?B?WnNPV2picGFUeGFDNkE4WUZYdE12Sm0zT1hzQXpUTGE1SnRJM1lYSXk4WGVO?=
 =?utf-8?B?MEgrMVAyaEtPWlNRSHBSVzBrdGkrSUExRkdwTGpHTC9mN1lVbE5VNUdEYVpT?=
 =?utf-8?B?d2xxcThxK2JWYlJVbjYxOHpwZnhCcUp6RXhVL2d3eGFuc3ZPdmJvWHBxUVVn?=
 =?utf-8?B?Ykt2MmpoWVJhQTQzWmVweVdWcFV1TjBvdGovU2FwYWZyallWYkhrOW10T1FZ?=
 =?utf-8?B?ZHUyYy9EMDRuOEd6QWZnVk9GbmxVR0lvN1FjRWRDUThFdUIzRUpkaWlReUUy?=
 =?utf-8?B?K3dOaTljS1Y1TEZJdGRocGJZMGxqQVhIeXZkQVhzSy96Y1lxMGRPMHNONStl?=
 =?utf-8?B?eU0vUElOdmh5TUFMRjljSVFCVEdrRG9DbG1HRld5UW8xd2NhQ3hQRW9YWG1l?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3b2JCVKBhxG+Z9nHF/XbZ6NlDQG3+g6HNZhj5Df5BghohfvSri5wNVTsZC8GTkVhM+CilzSis9UwoaqfNrSJai8Mg+c4reyA5XhaVx08+KD25/uo22vE5WkFTYW4y9CgysbFKhfMFq7Nr7ivKWKxJg7IDeRoB9Oqj+xFZgyrataj1H+XtijHCGYb6Z6XLZJcswZmo4th7mxFP04tH1pVFzB7xtfxaNipmnPPl7D64nmOhUPZcURsZmphJlJ058vjqkRJlMuQvzf91AxNKjFSArHgxaLDHnLK0/GV/ce5D1aF9Ww3ZKeWlhl5eHIuLTABqXXJyxByipOVS+fYLq6N95hzvroCMklaY0Iiak5BjvBQLDCbLmO9rUPAHrxRWouYIAoerwkBWXS+NTQ8cxkHvz65jVJ+HoslkV1GTd+0MBUIP+axifWlQ5odt9vN60g4DuqeMBOfAeJ0+wpOf7NtBiwwMVf3Ff9UcrQ6lVr3DMFSpT3BqN2e8r5JcRQn3hT5wI4mXgqDj+Wge/OP+0zagRyKTx2sVt0V5ZMznMOeggKvwZ8uhjRYxp1q8cmHhsawaAotgZioLAZfpg72CD1cgYoio/ogHnMPexCp0T3mR53QbrplJz/+PrYvc+Zam8Kd+JoY3jC6JTxaFXGtf25d0XeUUhF6nsz8ufFz88Va5InKLqjHu7knREB1s5w18p6tS8JdfpNzVAjNWB65utKQGf9hRBnx6lb9kUOKeXa++uSRMURgsFigGk6dlafoCrqgnT3z2yahjvYE/OtjziV0cV2IRGpF2pNC2Q0i34AXTVo35K1P1uk9aLeatQwmSWg7lhe9scqwXi3fHXS1dm/+Nw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9037e05a-5436-48bf-b60d-08dbd6362a16
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 15:13:52.8491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCWJzp196V9lnLJkvUdbYUr+NAsxGAK8BckTqpXp4PbXwGfu+0yGaHsaP3HB7OlJgQnRqQV3SVrg3F1R99gKUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7247

On Thu, Oct 26, 2023 at 05:10:41PM +0200, Jan Beulich wrote:
> On 26.10.2023 15:57, Roger Pau Monné wrote:
> > On Thu, Oct 26, 2023 at 02:31:27PM +0200, Jan Beulich wrote:
> >> On 26.10.2023 12:25, Roger Pau Monné wrote:
> >>> On Thu, May 11, 2023 at 02:07:12PM +0200, Jan Beulich wrote:
> >>>> ... in order to also deny Dom0 access through the alias ports. Without
> >>>> this it is only giving the impression of denying access to PIT. Unlike
> >>>> for CMOS/RTC, do detection pretty early, to avoid disturbing normal
> >>>> operation later on (even if typically we won't use much of the PIT).
> >>>>
> >>>> Like for CMOS/RTC a fundamental assumption of the probing is that reads
> >>>> from the probed alias port won't have side effects (beyond such that PIT
> >>>> reads have anyway) in case it does not alias the PIT's.
> >>>>
> >>>> At to the port 0x61 accesses: Unlike other accesses we do, this masks
> >>>> off the top four bits (in addition to the bottom two ones), following
> >>>> Intel chipset documentation saying that these (read-only) bits should
> >>>> only be written with zero.
> >>>
> >>> As said in previous patches, I think this is likely too much risk for
> >>> little benefit.  I understand the desire to uniformly deny access to
> >>> any ports that allow interaction with devices in use by Xen (or not
> >>> allowed to be used by dom0), but there's certainly a risk in
> >>> configuring such devices in the way that we do by finding a register
> >>> that can be read and written to.
> >>>
> >>> I think if anything this alias detection should have a command line
> >>> option in order to disable it.
> >>
> >> Well, we could have command line options (for each of the RTC/CMOS,
> >> PIC, and PIT probing allowing the alias masks to be specified (so we
> >> don't need to probe). A value of 1 would uniformly mean "no probing,
> >> no aliases" (as all three decode the low bit, so aliasing can happen
> >> there). We could further make the default of these variables (yes/no,
> >> no actual mask values of course) controllable by a Kconfig setting.
> > 
> > If you want to make this more fine grained, or even allow the user to
> > provide custom masks that's all fine, but there's already
> > dom0_ioports_disable that allows disabling a list of IO port ranges.
> > 
> > What I would require is a way to avoid all the probing, so that we
> > could return to the previous behavior.
> > 
> >>>> --- a/xen/arch/x86/time.c
> >>>> +++ b/xen/arch/x86/time.c
> >>>> @@ -425,6 +425,69 @@ static struct platform_timesource __init
> >>>>      .resume = resume_pit,
> >>>>  };
> >>>>  
> >>>> +unsigned int __initdata pit_alias_mask;
> >>>> +
> >>>> +static void __init probe_pit_alias(void)
> >>>> +{
> >>>> +    unsigned int mask = 0x1c;
> >>>> +    uint8_t val = 0;
> >>>> +
> >>>> +    /*
> >>>> +     * Use channel 2 in mode 0 for probing.  In this mode even a non-initial
> >>>> +     * count is loaded independent of counting being / becoming enabled.  Thus
> >>>> +     * we have a 16-bit value fully under our control, to write and then check
> >>>> +     * whether we can also read it back unaltered.
> >>>> +     */
> >>>> +
> >>>> +    /* Turn off speaker output and disable channel 2 counting. */
> >>>> +    outb(inb(0x61) & 0x0c, 0x61);
> >>>> +
> >>>> +    outb((2 << 6) | (3 << 4) | (0 << 1), PIT_MODE); /* Mode 0, LSB/MSB. */
> >>>> +
> >>>> +    do {
> >>>> +        uint8_t val2;
> >>>> +        unsigned int offs;
> >>>> +
> >>>> +        outb(val, PIT_CH2);
> >>>> +        outb(val ^ 0xff, PIT_CH2);
> >>>> +
> >>>> +        /* Wait for the Null Count bit to clear. */
> >>>> +        do {
> >>>> +            /* Latch status. */
> >>>> +            outb((3 << 6) | (1 << 5) | (1 << 3), PIT_MODE);
> >>>> +
> >>>> +            /* Try to make sure we're actually having a PIT here. */
> >>>> +            val2 = inb(PIT_CH2);
> >>>> +            if ( (val2 & ~(3 << 6)) != ((3 << 4) | (0 << 1)) )
> >>>> +                return;
> >>>> +        } while ( val2 & (1 << 6) );
> >>>
> >>> We should have some kind of timeout here, just in case...
> >>
> >> Hmm, I indeed did consider the need for a timeout here. With what
> >> we've done up to here we already assume a functioning PIT, verifying
> >> simply as we go. The issue with truly using some form of timeout is
> >> the determination of how long to wait at most.
> > 
> > I would likely make it based on iterations, could you get some figures
> > on how many iterations it takes for the bit to be clear?
> > 
> > I would think something like 1000 should be enough, but really have no
> > idea.
> 
> Except that how long a given number of iterations takes is unknown. 1000
> may be enough today or on the systems we test, but may not be tomorrow
> or on other peoples' systems. Hence why I'm hesitant ...

Hm, but getting stuck in a loop here can't be good either.  Let's do
it time wise if you prefer, 1s should be more than enough I would
think.

In any case the worse that could if the timeout is hit is that aliases
are not properly detected, but that's way better than the possibility
of getting stuck in an infinite loop.

Thanks, Roger.

