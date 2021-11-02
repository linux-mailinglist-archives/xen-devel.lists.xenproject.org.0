Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E6D442E3D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 13:33:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220196.381365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhsyL-0005Sb-QQ; Tue, 02 Nov 2021 12:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220196.381365; Tue, 02 Nov 2021 12:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhsyL-0005QK-N9; Tue, 02 Nov 2021 12:33:01 +0000
Received: by outflank-mailman (input) for mailman id 220196;
 Tue, 02 Nov 2021 12:32:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XxgO=PV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mhsyJ-0005QD-9w
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 12:32:59 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0249ddf6-3bd9-11ec-8556-12813bfff9fa;
 Tue, 02 Nov 2021 12:32:58 +0000 (UTC)
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
X-Inumbo-ID: 0249ddf6-3bd9-11ec-8556-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635856378;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/cru6W1VLMT1Yf7qqn3JQRmiSI7Tjujsut3DA6pGiUM=;
  b=d6tspTHhXi4scyLaIKRER9T2lcNtITYo0AWL0P1dekGlQ4qvC2QTphwN
   Vow+/kN0mEzb6x13XW+aOK0HQSbY3v2f4VfWzVRVRk8UFsvq2M52eHwxj
   U57Nf3QZRynCpxabXulSlwI/+h0X0SRuWT6i+A+Ue3yTQtLRBZxr/o8IA
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zT8X36NM/GYZrNEHseUBvgTynUUM87krxyzE5WpMJAbK88/Ys/4VrQb/GQopzQmmXpQpu/AuxF
 HJgtI0b/blr+KkFzR+T31scUIFQ8uYuoJqbcAEM8OXUb+lEokrYGrILW+y59z+CO7EORpOeFFO
 UQcyQ4hGu0GhE2RUyAEXdVPQdiM+ueCZMLabxK44V8ASjgYgxpsQdlLyS06+3DO/1Kvixoj9m8
 SsmM/73cH5qhgNYxJuSlHT8ZT0S7cHm1jE1PfrH1qYsXG0BbXFUqazpM254TjIfN+MF34lWMoL
 KvBqjpKMBPH/5vkKUrt0jDs9
X-SBRS: 5.1
X-MesageID: 56895941
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:h1Wv7a8I4+dKobsPZ6MgDrUDa3mTJUtcMsCJ2f8bNWPcYEJGY0x3n
 WcdW23TOfjcYmCnLtF/aYm/8htVvZ6GnNJiGwFlrCg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdh2NYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgpz
 Y9oqIWuEjwXEfL1htUZUisEPBpHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgmdh25ESRJ4yY
 eI4TGtmYUnwbidWK1RJUI8Mzf2l3EfgJmgwRFW9+vNsvjm7IBZK+LnyMvLFd9qSX8JXk02E4
 GXc8AzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQ85S4GvaU0skuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixXm1eayNYdocdiuBpfCIb0
 l67w/zSPGk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+xL1ZZj6kmtwbzQb9tATLDtRxV92AjYV3nNAuhRNN/8PNzABbQ2AJ99wGelorup4
 Chsdyu2trlm4XSxeMqlGrxl8FaBvK7tDdEkqQQzd6TNDhz0k5JZQahe4StlOGBiOdsedDnib
 Sf74F0KucACZiP1N/UuP+pd7vjGK4C6TLwJsdiPNrJzjmVZLlfbrEmCm2bJhwgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eRD+8zK/kuKHcqT503+idK2PSfJIZ9YYArmRr1ot8us/VSKm
 +uzwuPXkn2zpsWlOXKJmWPSRHhXRUUG6Wfe8pcKK7XcflI+cIzjYteIqY4cl0Vet/09vs/D/
 22nW18ez1z6hHbdLh6NZGwlY7TqNauTZ1pnVcD1FVr3iXUlf6i166ITK8k+cbU9rbQxxv9oV
 fgVPc6HB60XGDjA/j0ca7j7rZBjK0v31V7fYXL9bWhtZYNkSizI5sTgIlnl+h4RA3flrsA5u
 bChiF/WGMJRWwR4Ac/KQ/uz1Fft72MFked/UhKQcNlecUnh6qZwLCn1gqNlKs0AM0yblDCby
 xyXEVETouyU+90599zAhKalqYa1ErQhQhoGTjeDtbvvbHvU5Guux4NEQd2kRzGFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu6ARlL9UvQy6B
 hCG9tVAYOjbPcrkFBgaJRY/b/TF3vYRw2GA4fMwKUT8xSl24LvYDhkCY0jS0HRQfOlvLYco4
 eY9o8pHuQWwhy0jPsuCki0JpX+HKWYNUvl/u5wXaGMxZtHHFr2WjUTgNxLL
IronPort-HdrOrdr: A9a23:78rRY6D9bFDKsRvlHehIsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHP9OkPIs1NKZMjUO11HYTr2KgbGSpgEIXheOi9K1tp
 0QDZSWaueAdGSS5PySiGLTc6dCsai6GeKT9J/jJh9WPH5XgspbnmFE42igYylLrF4sP+tEKH
 PQ3LsNmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZSbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczJgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenUPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesYMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO01GkeKp
 gvMCjg3ocUTbvDBEqp/FWHgebcEkjbJy32A3Tr4aeuon1rdHMQ9Tpu+CVQpAZFyHsHceg22w
 3zCNUdqFh/dL5nUUtDPpZyfSKWMB2FffueChPbHbzYfJt3Tk4l7aSHp4kI2A==
X-IronPort-AV: E=Sophos;i="5.87,202,1631592000"; 
   d="scan'208";a="56895941"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXw6j9YaIuH8Prf5NbZiNX5nVbiyn7Xq7NEZBdr/rlelTYXxDQImwjljaFSsYWDADJcMvn/vuseMRbHLjo+IgDxAbWHck3cuha/uqCodVDfTvuCClucNEtF2tApLpvhgLxzogWqL59+OS0fOOrDyCcHsSO30GxYpIqiNFGIUKvQraF9s9JLXiV0F6HuL1kY69k1oJDZijuaJa4PKDXq7UH5sXPdQf0i2USb/MzipNcxRTGQnKMz+vpSpqhtTlgbBWlwvFjFopTrOJ7VyzgiZ78zJ3cFA0gJLv/CJURwGcMSB/mrm7JcPmaVV7XRy7dlYzxOsR06sjvRTtUnF+rXdgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oc/4IFw5LjvE/9ui1454RPN/ASpTqNF5Dbd+iFKODY=;
 b=aSDjMv5WHqWYyebqEJUerR+jPinrJlN9Syelf1LaVkxMlgVFSGgALJd9goi2nCgpVQkHZQddZ/ZNGHIcE7jIQRx6MOH3Ts9sshcgVyXLwqtj1e3Z4rvlHp9NlE5THNiW09lKN3IZnQXRpKqM2Y1601uBbMbWtHExSPZnp9R2QtmxBK6oyY4Gq43qS5Bu1yAg2aVTgJ3hNtS/1R5gcW0wRmgLqsMCO4WWSDmc9E6glbQS7YEfHMK2rGMHBwnVszIDj/wj0MMjXjYsS0w4Fm/yVsBXvxO9RNh/AfT83q9BlE/S5P/lTiRU+A976oGbiaM/0m1o2WMncZxKPGXjWUW0PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oc/4IFw5LjvE/9ui1454RPN/ASpTqNF5Dbd+iFKODY=;
 b=bfg+ZGPR+0ILfQqb9tbnUfLwxq7ECMpt3bYIi6LERrx3kNIJGJMgaMRjfCkHc4srOewdjTDvrIGfj7rn6KGI4XcI3B/JEWCFf6yDqJ8tA7GT4Q8VL/MxPveAnab4858PipBdmFQ814dCoHMnPKyRMC9M9zJeZ/5NIqOQl3SpE+E=
Date: Tue, 2 Nov 2021 13:32:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian
 Jackson <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cpuid: prevent decreasing of hypervisor max leaf on
 migration
Message-ID: <YYEv7ZWwfALW546f@Air-de-Roger>
References: <20211027140050.67509-1-roger.pau@citrix.com>
 <f3fac17f-12f2-2e75-dcd2-4f2abb57d043@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f3fac17f-12f2-2e75-dcd2-4f2abb57d043@suse.com>
X-ClientProxiedBy: MRXP264CA0020.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36394052-fb5d-474f-d8f0-08d99dfce1e2
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-Microsoft-Antispam-PRVS: <DS7PR03MB54636FA791E438C94352E0EF8F8B9@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ISHlfTVPNhEhhUf+ymCBFsFB13++QUFIWonLKHXk3QKPFwYFNDVKSxn61WU1IJd1x0sqM5nIPIqtzJpcYhoGztmpL6351MNryy/DzTktvizEnqO8UHR2SpgQDJ1VP2DzRZAIBXb4ohSng+nDf6r1OEE2UoqRu/+bSg2UBXxJ3nG2dbBkWbPhSYbaLKl+X4/nLgJhcVmPdqt3cTsMRxy2tDoGbgvOhwtXcwoN33H8gcF6gpJFKnrDe0expcoghesUF2fdu1orU+hWW5uqNekLmRgHizPiYukq8+xMLuVwQcicIBc492oWjc45G7Xh7F3jDKkHLyZIymy26JhSwojVE9MJTz+gaRgI2JcvYqEdPaHQT8FRyaG9YZI2fI0+iFEKiGOUyXSVsrIMIJaUEFU9A6y2LVXoENJrPsgQEHJSDPrNu/BvNGA3769goB3wDMN5CDO6BCFdZx1FjxRoAcZkjSK3TuvJII5h9JEvIsjHcH5FH/4PemW6UCSREc1hRv/NFshYeFhh5cwM5HEO/sy76p9atr8Y9wxQkhJclS80bgCqArjNpxlf0Ox+dwraoSwCIngpDf2yDq8XfeDjVR+dX5j4Ydpm24cYsOJzD12p9869rFlRPJex5Ya1oVLKpRINDAm0y9+GRoNBjAL8sIW7Rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(82960400001)(66946007)(66476007)(33716001)(6666004)(38100700002)(6486002)(54906003)(6916009)(6496006)(4326008)(66556008)(86362001)(8676002)(508600001)(85182001)(956004)(5660300002)(26005)(316002)(2906002)(53546011)(8936002)(186003)(9686003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzdHYmNka2NQUW1ObWwrM2swOUFRNzlRQ3EwNlFFN2NOMHZlU0tScHV0UnZF?=
 =?utf-8?B?L2JkMTRnVWlGK2N6a0Q4eURIZjNiSEpuYVdYQm1FSGZ1bnU1M1MwczJEV0NO?=
 =?utf-8?B?eU84QVJ1ZlBGRndFNEx0WU9MbFdCNDk4R01aVlZkMkhZbGtSYzh1NVZHOTZu?=
 =?utf-8?B?MFV4czBCQUh0ekxVbWV4M0xtc2FOQzJjVXZQdVNERTUwYTlsQ3lhYmg4WUFJ?=
 =?utf-8?B?Y2NrRkdxSkxEYlloMS95UHNQcWJCZVJaYXdXRHYrTU82YzBrT29oZTdWemw2?=
 =?utf-8?B?Z1Y1eTNORENVTERuWk9nS09DUExhL3daR1lvUzdDWnp5UHRHVThHSDlGUHV0?=
 =?utf-8?B?cHRteDIzMGk1Zmgvbzl5b2RvOGNCN2tsMjZtcVo1enhZK1B5MDVCMHY5Q1Rl?=
 =?utf-8?B?Syt0VVRlZmVSL1V1TkdBZGpjd1lWemM2Q25yL1BwK0h6YU5hRGJ2V3diWEM0?=
 =?utf-8?B?dkNiRnU2cUwwV05zOUhXY01vdW4yZThQQVJjSzI4VG00cGU0VlNDWEVveWNC?=
 =?utf-8?B?a2dHMGlTd3loL0JHOGJNTmQ4eVUvd2p5V0Vka3dZT0pKcGVTNm1qWW01a2dt?=
 =?utf-8?B?SVkraTY1UUc2ck5BcXVwcGZMNjYrTFhpenprT3VpNUlaT3lPT0xDcnN2cDA2?=
 =?utf-8?B?SC90aUt3VU5uRUNOOXIxY2Z3UHZKcWFHQzVhbWY3RjNoalR5R3E4QlUxUjJa?=
 =?utf-8?B?UU5uUXZwalIycjdYcjhWaTNtNnRKN1V0SGV3V1A5Q3c3Q2NOdVBlSFVqL3Yz?=
 =?utf-8?B?U0xFZVgwUzJMc0kxNSs3TmljQ1hTYm90emdmNkNyUUd1b1hjR3puQlNOWDA5?=
 =?utf-8?B?SDMvVVgrMXNQMWltVDl6bzJqWERsRzZLdEdueXo1QThackFhcC8rL0ZiZlJJ?=
 =?utf-8?B?SmVWeG11Mlh0WFByTmJUWGtWcGFBZVNNT3hHaHh2eVdDaHZRVFBjMTJBcndi?=
 =?utf-8?B?QkpKRVE1YlUwVWFqK1ZuZytqZ0dqbUJxNHlmbk03Q3dwWlJYdGdKNURHRXE0?=
 =?utf-8?B?eEpJRTRCeDk0VDdTMHhpS09jTTluK0FQaU1rVjNoT3JwVW9tQjRPS2thWXNp?=
 =?utf-8?B?ZHhDZXpOZzB3WlBQSGZRbThxM3g2ekE4Q25Ebi9xalhGMFNLZkk2TElKRmpo?=
 =?utf-8?B?bnBwV05ya2xhbTY2TG1HY284YkpmMVFnbDB3clBQazNmS1FOeWl1RkhibVVG?=
 =?utf-8?B?U1l1bWNvdzBVRUJnSUFxa3VSVjhJODhNcFUvMm1YMUQ2WTBiTExWaDdwWldw?=
 =?utf-8?B?MTYwaGVLQ0cxU2Y3TEhvblRJYmNqNFRsd2MxRVZvRG5DY2hOZHZsYWdIOVli?=
 =?utf-8?B?R05odCswNFVObFJJSTRKakxTaTlIMmFCY1RZcGUyaUNYaUZFZmhGNDZWN2Rh?=
 =?utf-8?B?RzVyZ1NPTTFteEhmc242Y3FmWDhXbnBNZ1VlU1N1UTFkUDlHUmd3cHVHZk4r?=
 =?utf-8?B?RFVlWmJ0WDhSWXdBa2JYMU5yV1NiRnF3d1hFZ0IrSWRaNGxZbWY1RGdMRXpK?=
 =?utf-8?B?SndKeFFTSWQ4dXZNRk9aRklrR1NaRFdwWmRhK1V4a1Q0dWZxeGZ4UG1xNUJS?=
 =?utf-8?B?Sm1NZFVLQ1c0UisyM3hRSStQNG8yNU0wcGw1NERZUFRFeGU2SHNkWERKVkc2?=
 =?utf-8?B?QTdrckVIZkRnT0FuRXJhK2hxdGNLc0ZmL2taNjdYL2tYeWQyR0hRQmNVUmc3?=
 =?utf-8?B?YWdSeTR0b2VZejBvV3ljUjBhaUczT3dqdllrZkVtQWVHSEFQam1sazNUSG9T?=
 =?utf-8?B?clYyWUhTTXZDelVmTFE5UVBGV1RPNVdHcmJyNFVId2laVEIrdWQxSXluVTFy?=
 =?utf-8?B?Y1Bkckd1WEtUazVsK1F5VHQ1RHRES1B4WUJoSFJSVFJVYXVyQnBFOXVSNkdh?=
 =?utf-8?B?M2RNb01ybGRQWFlMVHN5bTRqak1vb2hBN3pNcGIrRzFLZUt3VmZrR2lsTEZx?=
 =?utf-8?B?NkYva09WNW11S3pPUFR2Yzc5RGpWM25hMVM1eWNhNXh2Y2lqcyttUmcxRWpz?=
 =?utf-8?B?ZkxndkpoOUthRnlBSC9tUUJwTmV0ZlM1MGRjSm0wYllmSC95VG0wQ3o0UHk1?=
 =?utf-8?B?NmpHMG9sMXNIc3ZNeURwWFBQdXVJdTNPZFZ1MzNwYkVFdTQ5cXFudVRhZzUz?=
 =?utf-8?B?dlhkVTlzVTcveXV4M3FUNlY2S2ZjQk1yUDFXckx3b1FXenIwU0g1TU9leExY?=
 =?utf-8?Q?NNhoWlNYb7dge7FZva8ouR8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36394052-fb5d-474f-d8f0-08d99dfce1e2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 12:32:49.8816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nf8OdkjDF0yxvJaKpDjSFgyvBvtG2vk7q0NmgRHqo0e+uNkOM1NCKvNzdQ+szAYWV3ws4rwm/8i0X6qfP9bIXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Tue, Nov 02, 2021 at 01:00:07PM +0100, Jan Beulich wrote:
> On 27.10.2021 16:00, Roger Pau Monne wrote:
> > In order to be compatible with previous Xen versions, and not change
> > max hypervisor leaf as a result of a migration, keep the clamping of
> > the maximum leaf value provided to XEN_CPUID_MAX_NUM_LEAVES, instead
> > of doing it based on the domain type. Also set the default maximum
> > leaf without taking the domain type into account. The maximum
> > hypervisor leaf is not migrated, so we need the default to not regress
> > beyond what might already be reported to a guest by existing Xen
> > versions.
> 
> While this is the missing description to the patch I had submitted
> back in May upon Andrew's request, I have to admit that I don't
> consider this a satisfactory explanation. Shouldn't hypervisor
> leaves undergo similar leveling as other leaves? I.e. upon
> migration leaves or individual bits should neither disappear nor
> appear?

Indeed, but hypervisor max leaves is not properly migrated, as
hv{,2}_limit is not set unless explicitly passed by the toolstack.

> I continue to consider it at least suspicious that HVM guests get
> 5 leaves reported when only 4 are really meaningful to them.

That's indeed fine to fix, but we would need to start saving/restoring
hypervisor max leaf unconditionally as part of the cpuid policy (ie:
set hv{,2}_limit at domain create to the default limit), and populate
it with 5 for backwards compatibility on restore if not set.

> I
> see this has gone in, so I'm likely to trip up on this again in
> the future. Might result in the same patch again then if I don't
> end up doing archeology at that point ...

Maybe there's some comment we could add in the code to make this
clearer? I didn't realize either when reviewing as didn't pay close
attention to how hv{,2}_limit is used.

I hope the above comments help clarify why the current behavior was
an issue.

Regards, Roger.

