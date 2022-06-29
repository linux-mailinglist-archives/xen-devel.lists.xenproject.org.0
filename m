Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C419D560C93
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 00:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358099.587101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6gZ3-0007AS-Vj; Wed, 29 Jun 2022 22:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358099.587101; Wed, 29 Jun 2022 22:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6gZ3-00078Z-SO; Wed, 29 Jun 2022 22:53:41 +0000
Received: by outflank-mailman (input) for mailman id 358099;
 Wed, 29 Jun 2022 22:53:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6b1=XE=citrix.com=prvs=172711fe8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o6gZ2-000778-SE
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 22:53:40 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ef9962a-f7fe-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 00:53:38 +0200 (CEST)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 18:53:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6701.namprd03.prod.outlook.com (2603:10b6:806:21d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 22:53:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 22:53:27 +0000
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
X-Inumbo-ID: 4ef9962a-f7fe-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656543218;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gJAuH/OQ8b3fMw7jbs23x5gQzTwuFwTBW2cB8pQSdUg=;
  b=Jd9UU9/m9K9E/9HtmcbBHUVEYnFqmS5bIZw23nV6dTWZSDanAodcRTKg
   YwWiu7lrJBgYiM2wMUmhjq9fvpdJPSnzF2bQNuolsvFrMhln7RY4EcQRJ
   VGwq7HwdNA6LDZEwyCXplkgjPCj9e+SJPDwcTTMT1JqtK71hX4sVby3p5
   4=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 77309708
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rlk37a3puJ3bi9fWvPbD5Rlwkn2cJEfYwER7XKvMYLTBsI5bpzNVn
 TFKX2qGPvjeZ2L2L4p/aNm+oUsEuMeBmt9kHgdrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1Ek/NtTo5w7Rj2tAy0IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1vtd+VeQpzApfOt8oWbQlDVAZsYIFvreqvzXiX6aR/zmXgWl61mrBFKxhzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82dBfyVure03x9p7ixKNd/Ya
 9AUdnxEaxPYbgcUElwWFIg/jKGjgXyXnzhw9w3O/ftouzi7IApZ4bP/Fd7VS9C2ddxOsU3ft
 Ej23m/gK0RPXDCY4X/fmp62vcfNgCf6VYQ6BLC+sPlwjzW7/W0NASYfU1S2rOW5gwiFePpWL
 kBS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmLeYU26H/7GY6za7IzEILHQqbDUBCwAC5rHLnoY3iR7eS8d5J4S8hNb1BDLYz
 iiDqW41gLB7sCIQ/6Cy/FSCiDX1oJHMF1cx/l+OAT3j6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQcH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:yLCba62KwqM3IrC03YlbOAqjBRFyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEg9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyjpAJb4RGIFqjgpF5d1H22xa1O
 UkZC1QePib3kmhPF1dZyGdnTUIngxeskMKgmXo/EcL6faJOA7STfAxy76xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMIjgZJq3PsiFXluYeE9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonNrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUBzaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTObNSRP5uw/zvngehTMYd228LAu23FQgMyOeJP7dSueVVspj8ys5/0CH8yzYY
 fABK5r
X-IronPort-AV: E=Sophos;i="5.92,232,1650945600"; 
   d="scan'208";a="77309708"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvWhKNfsJ+0l52ih3pSUTG+5637+NP0TQk38nzKiluBuYTKARHAPa52AnUaUH3z/9m40Q3tquxh5vQ/TI0cWKbhLctwNNFyOasveGklNhArdVhpCsgCmZ271YeSG8/PXP8+0u6eiI0M6EuwVYdCxVG4yK51QDFsoM6K1HqMB44EP3F7W/fCaAgU5YZbdJ0iHzOkDY+APczmdVvhmFRu7VzkN7a2o1HGYIX9SeWkQXGm7O6CNlXoDOh9unrSwxoeharg4rbidpOpPH4mi2Cb/vyOCDNQT91VafUVXtsYF2jHYBMqPUd1PWEhE8VLykHrfePEXV4o/mkrCEtZ7EBSrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJAuH/OQ8b3fMw7jbs23x5gQzTwuFwTBW2cB8pQSdUg=;
 b=dN4XbXc2r+xa6ZTP91kr4OzK7BBMetz3hug/DHOxedA2/5+p1CKIF3WLzAu7PXf0mmBzFFmEzcxRKWHepO5Pt8QainvGtcRgjXeMagSmu+GlwkbkIu/XbwWQqOvxZsSCKkQM7ITfghjdx3FB30FH+6JRmEtxnClvsa0iUhR2DhF7H8kSPz92U/+QIMPcwdaySvuztjAXegFLB5OTk1eOXmU/O5qlHmucUQGBYYZa/M9/h7XWWkv5Rfit6Q1wZ7JRlXge0Vzpy5djyd5zuQX1f37QpWbCDWm9xN2dpX/SdRXxv5Erxt/EjUmE0rriE/3iNvqAzcJcSDSfmtGfVq3/sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJAuH/OQ8b3fMw7jbs23x5gQzTwuFwTBW2cB8pQSdUg=;
 b=kG1uqpRfALfKIC05FtN30zmZqYogFTF017YeN408Hyqlcd4J3ulSkrfFrc3ZwQYMxemOEERZbErG5hMCEV5PNXEEgHAuXLiwbOJJqcdwJYhVgoQ6JeBIaJtTKTKTyOUv100d2a+TS8b1KAfg9DWRH5NUz4e+tkpu5M3J0DbSBGs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, "SK, SivaSangeetha (Siva Sangeetha)"
	<SivaSangeetha.SK@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: Reg. Tee init fail...
Thread-Topic: Reg. Tee init fail...
Thread-Index: AQHYh+/iOCuX3wO5yE+jj9xk6AFSM61nBjSA
Date: Wed, 29 Jun 2022 22:53:26 +0000
Message-ID: <40929dd3-f2bb-b20d-48e1-1e23417a1d7a@citrix.com>
References:
 <DM4PR12MB5200C7C38770E07B5946424A80B49@DM4PR12MB5200.namprd12.prod.outlook.com>
 <7689497b-1977-b30a-5835-587fa266c721@xen.org>
In-Reply-To: <7689497b-1977-b30a-5835-587fa266c721@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 543bd88f-437a-407f-85b2-08da5a222dc5
x-ms-traffictypediagnostic: SN4PR03MB6701:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YrqDBnxaMOJdfn/dE0VYrOdNQa4U5aOniEiRDIldm5OAZbRyG+pIR8Ut7jvV65agz5shau3AIRZZAN/SbEc5lC2Uz8ISMUFdhtrws2xLNRmYGUTx7/sorWyym/g2CRQ/AGkcGQHOfEZytDQQ/17aOW0oK64+PvVMkoe6EvTqU6+siQ0HdGcICF/tMR4y0W+0C2hpAAlpH4t6yEpP7Fqt3LhKjiwomCg7g8gur9TApAVV6rgpdLP0qkCMktviUMzZeLnRX4gdbQhzFHVPiHaqBwtWyjs4u0vaGs+j/f4TOV4vyMFpGa+15GZV53ez+5VoUJFq3ydJEWvMpIA6lcI27n62eRIgQPNKx6iULn8N0vt60SsbaNFGtx4U107wMMlGric9EXre0bf3gm3EvLOF5oHOOI3/UorzPlDtfhmDR9/T92l8aY4m3aIMWYFbLQuvS/6eCugANFSOQEqctICYWlhuZGM95O0LvmQhiCnkEQa9MgXlqYheZcuHFlX9unyuR7v3Kk3ddXg5LwdzVYp25FKUcImnQU19uNdk+1mmeVAp6Nw9DQGpkZzOanrCZKDz+TZHrRtZgCXtfb6tAhpbM6GtmDD8kHLCbsidDGsp4tKzq34UxP3KHY/a8043HkNHpL5PrF12clNYKzC0oSP3TPV8NWQEAKTavUaQPXxj/ApsqEHE9KnBt5ssePFjbFSBtgVMbDqokMTi3AReX/+vQLP3GrElf6QDEWo8LCLfN4gN/2lcwYvTfPsr975tkeGMRvOJzKz9zu7xJxSUO8sdmCZK86ZBwOpOftgBjim7XKBxBGJtUYBWOjpPY+VKYbU8KjLPzSftXuze2++h52KpBLF2GGDxT5YZo5KBMlF+R2E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(4326008)(36756003)(5660300002)(4744005)(31686004)(71200400001)(478600001)(122000001)(8936002)(64756008)(38100700002)(316002)(6486002)(66446008)(2906002)(86362001)(76116006)(91956017)(110136005)(53546011)(6506007)(55236004)(66946007)(2616005)(8676002)(54906003)(41300700001)(186003)(26005)(38070700005)(66476007)(66556008)(6512007)(45080400002)(31696002)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?clNKT01zYk5aNGh1ZFJ3a0o3M3gvRVh6S1V3ZEhUWEhHU3I0Vnp6cjZuYk1P?=
 =?utf-8?B?aEN0YjFGalBtSFFGRUZkM3JkU2FhZlkxT1NkQW1MQitZREI5SXdOUjFnaFVs?=
 =?utf-8?B?cEdNcm9oOUkxSWM1OENNT2RENGlKWU5PZ3NpQXJOVlRwbU1takE1K1hHNllF?=
 =?utf-8?B?NjVpVUo1MzJCc3ErcXNDdlhvMDhOWEpEb1EvckVreU5YNnRFVXJERlpLa3VD?=
 =?utf-8?B?OUxGSk1oZU8yb3B4YjZvRVMyUzI4UWN5MjZvN2NYbVorekUzeWhuUEpFaW1y?=
 =?utf-8?B?Z24ydGgwZDlPTjhOMTY5aTB5cFhMRk5vOGlsQ0Uxelk4QjJLcGFvV0FBbVhQ?=
 =?utf-8?B?NDhaWVMybWx2UWJTd2hockMweWxNRkkyVWdmNlZ5ODBJKy95Q3k4dTR2Y04z?=
 =?utf-8?B?MWFMdEtVdXZoTHRNUG5oWDN3aFJteEdrRHlPL2pBQmFCUmU4NDRBR2tJeTMy?=
 =?utf-8?B?Z2ZjYStqbXFCdUxsS2JYV2J3Z2Q1T2tlbk9qVGQ4eEV1OEhUckV2NkZiY2JT?=
 =?utf-8?B?RWsyS2VYbmdUUDZ0WDFHSjNWRjZuQTVubk9wSi82SzVtM1FMQXRmK1BTRk96?=
 =?utf-8?B?cnEzdFYxTE1EbkVNT2RLUHpINGhKeXl6RUUxNnVWT1dDSEdtOVRpOWFmN2ND?=
 =?utf-8?B?cFRNL01PcVhvbWgrNDVWZ2M5U0dWLytrUmQ2TzlFMUlNUGd4NldJWDdmcmhn?=
 =?utf-8?B?alBXQndEM21FeFc3ODJXSFA2NWw5bDQ0U3dYTkxCam9YYkdDL0JndXA5TmNk?=
 =?utf-8?B?OEVRVnFac09XeHUwMEJHK0R1ekx6MFQ5endwNEU4NXFCdXhGVlRGQXBxNFVX?=
 =?utf-8?B?WnVNR3pPR0FCK0hiZUhXY3I0UWpTanBYaW4xNHkvRzlCUVkyeDNyWlFVNUFR?=
 =?utf-8?B?amsrVitYT3dJM3lKQWM0cVc3TzNsaWo4cjdFU0VOMmxxVTVwTjFwL0c5RHgx?=
 =?utf-8?B?OGRFNStzaDZONll2a0h6SFFqTHJBSUo3clJmWkp3QTR4Q3BLQkdIYlpLcyt1?=
 =?utf-8?B?MFcvcGE0N2l6TVNXbk9uNndNeU5mWXdRdlFUMXBsRUJ4NStxL1F5bmE1WWtn?=
 =?utf-8?B?VWhhRUdmZFkvNjVhYmN5Z043Y21YL3E2M2R2U0tWNU9Fd01yTVVtSks4RVFK?=
 =?utf-8?B?bkp5MjEwZlBpcmZscTFoNWdhaEFNMDRvMitDdURjQy9tZzFoTGI5eUNmblNS?=
 =?utf-8?B?RWhlTkhpbVBNTmJWdWVqd1B4SkROd0pyMXIyRjdWQ1Jjd05QVXFwWGdaK2Zh?=
 =?utf-8?B?WXNneXgrZzVNOHBCQXB1cHZhYnQrVlA5U05iTlhYS2pmQTl0UDZEVmUrUVdU?=
 =?utf-8?B?YnNueEc5eHcraGYyQmo1UXRVNTQzSlFqdXFYdlFBNUljNWVKQ1NNSzA2R1NS?=
 =?utf-8?B?dkhlSW1ySUhVU3ZQMlB1VzBwWUptcGQrT0dXbFR2c0dUam9iekZzUjNQNUF3?=
 =?utf-8?B?VFBIRnh0bmJ2TmxWTWx3ci9EN0RkYis4ZFc1bTRqZm51Vy9oaU9uOWNzdG9x?=
 =?utf-8?B?cjhSSFZpeHgzZys4UXE3UUNpRnVyZXd6VUFYbkIrTHpkelJRYURhekRxKzBW?=
 =?utf-8?B?ZG05SW9wekMweng5ZkY2RWlETnVRc25sRWV5bENzaTAvNkZtOTFxR0srUE1F?=
 =?utf-8?B?d0JnSVhoYTdBREdIMml3eTM5Tm9BbW9kbHBsMnFPRHpMR3JlZEJNcDAzM2pE?=
 =?utf-8?B?ZDlmOVkzQ25zQUlqM3g5YTdCUGF1cmorNnQvVjVJODRSL2lBeHN5U1BBQmRx?=
 =?utf-8?B?aXNGdVlvKzVkUXNuM0RRODZpZ3YxMWYxWXRteXNCeXhCaWRVNnVQNUR6eTJj?=
 =?utf-8?B?WFlHT0dxajNLWU9RRFIybmlvSWMrYVQ5a1hPMEhwakwrdjdBNENVMDljUmhD?=
 =?utf-8?B?V0g2R0Fzb2lLbzNOTzl5MkNEZGtqRUg1b1pxS2lqeThmWFRDVU9SV3pRWkpD?=
 =?utf-8?B?VzJSQlFLQkNvbzFwZzdyeTFyU3ZaMnlZNEcxWUc3RGUvN1NOS0ozRzVFTWZY?=
 =?utf-8?B?SXVaQ2gxdDNSK05WUUVLY2lScnA3NllHUHJ4MllCU25zVUt3OHdxWnlQOTR2?=
 =?utf-8?B?aGdzQi9xc2xVN1lWeW9DejgrY25ZTEFRV2ZBbFIvUXFrL2gxL281VTF6V0dr?=
 =?utf-8?Q?BWzVfhi9TulAZNAV3cnraxJJU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <408FCE0E942008488DCB1C798AF3801C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543bd88f-437a-407f-85b2-08da5a222dc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 22:53:26.9185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U1iCl5ImSIwyBAAWuutpZ5+TBg/NRNmqj0TZr85JXtlvv6ghL3N4CTa8TWZH3Vf5emwzdiI0tV5pjhHxiDBiNQm6fqCBa36Ht9ZF9cjjAcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6701

T24gMjQvMDYvMjAyMiAxODoyOCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSwNCj4NCj4gKG1v
dmluZyB0aGUgZGlzY3Vzc2lvbiB0byB4ZW4tZGV2ZWwgYXMgSSB0aGluayBpdCBpcyBtb3JlIGFw
cHJvcHJpYXRlKQ0KPg0KPiBPbiAyNC8wNi8yMDIyIDEwOjUzLCBTSywgU2l2YVNhbmdlZXRoYSAo
U2l2YSBTYW5nZWV0aGEpIHdyb3RlOg0KPj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVy
YWxdDQo+DQo+IE5vdCBjbGVhciB3aGF0IHRoaXMgbWVhbnMuDQoNCkl0cyBhbiBPZmZpY2UzNjUg
dGhpbmcgYXV0b21hdGljYWxseSBpbnNlcnRlZCBwb3N0LXNlbmQuwqAgU29tZSBwZW9wbGUsDQpk
ZXBlbmRpbmcgb24gb3JnYW5pc2F0aW9uYWwgcG9saWN5LCBjYW5ub3Qgb3B0IG91dCBvZiBpdC4N
Cg0KSXQncyBpcnJpdGF0aW5nLCBidXQgYmVzdCBqdXN0IGlnbm9yZWQuDQoNCn5BbmRyZXcNCg==

