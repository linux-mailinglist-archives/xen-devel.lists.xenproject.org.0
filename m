Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F14FBACF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 13:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302995.516945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nds7A-00075k-FE; Mon, 11 Apr 2022 11:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302995.516945; Mon, 11 Apr 2022 11:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nds7A-00073W-B0; Mon, 11 Apr 2022 11:21:48 +0000
Received: by outflank-mailman (input) for mailman id 302995;
 Mon, 11 Apr 2022 11:21:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbSP=UV=bounce.vates.fr=bounce-md_30504962.62540f47.v1-ee643d67f5814913871557baab52452d@srs-se1.protection.inumbo.net>)
 id 1nds78-000737-CU
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 11:21:46 +0000
Received: from mail179-16.suw41.mandrillapp.com
 (mail179-16.suw41.mandrillapp.com [198.2.179.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9140c372-b989-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 13:21:44 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-16.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4KcRJR4ZcCzB5p71B
 for <xen-devel@lists.xenproject.org>; Mon, 11 Apr 2022 11:21:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ee643d67f5814913871557baab52452d; Mon, 11 Apr 2022 11:21:43 +0000
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
X-Inumbo-ID: 9140c372-b989-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1649676103; x=1649978503; i=olivier.lambert@vates.fr;
	bh=9XSFacDXMSgMk90Yj8+tzVlXGPBp3aLXJn0GHa/++W8=;
	h=From:Subject:In-Reply-To:References:Message-Id:To:Cc:Feedback-ID:
	 Date:MIME-Version:Content-Type:CC:Date:Subject;
	b=KCoRDBpWYvrhYyljVQxbFwi5jofMAOzXT1i+ePYcLRikBckvMTydao25epdht7KLQ
	 9iae0mZPFGhhZO9bQ29afDXT6Fk5GcPlomf4aflX3YgjRMnbeqcLNcfIPIho9DaHdP
	 BNyJJSc4NVGOptKC6Ln14wTEZoeLWZuq4vOr4Vg8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1649676103; h=From : 
 Subject : In-Reply-To : References : Message-Id : To : Cc : Date : 
 MIME-Version : Content-Type : From : Subject : Date : X-Mandrill-User : 
 List-Unsubscribe; bh=9XSFacDXMSgMk90Yj8+tzVlXGPBp3aLXJn0GHa/++W8=; 
 b=Ibz6l7Y429o7O/q5v+GAUhMyCiS3wJJyGNyjQWzPGnX/qvIGbbxyWDu5+y+gw7bGS282ET
 cm6PZg8htg7/9jmoSPv8jtGvazgaZILzF1IYLs1+fyATo7/k4GNeh+Vps+SRkM0PEMa903NZ
 h1xu8JtC2aOnMAjf5GNQmUjAzii1c=
From: Olivier Lambert <olivier.lambert@vates.fr>
Subject: Re: Xen Project management working group
X-Bm-Draft-Info: {"type":"REPLY-ALL","messageInternalId":709122,"folderUid":"0c209865-5aa4-48c5-9a6e-86a91fc495c4"}
X-Bm-Draft-Refresh-Date: 1649676101481
X-Bm-Internal-Id: 51E2DD5C-2A80-4022-B0C6-3DE883716B7A#bluemind-4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2:712866
X-Bm-Previous-Body: f6fe3ff2da8f32ad5b434c1d0869677770aa066c
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: a64b4288-bd64-474a-a5b2-2e97a97aa872
X-Bm-Transport-Timestamp: 1649676101991
In-Reply-To: <l1oyquzo.rukzku9wc9og@vates.fr>
References: <l1oyquzo.rukzku9wc9og@vates.fr>
Message-Id: <l1um9z4x.3tc1vn5jnueio@vates.fr>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, george.dunlap@citrix.com, Marc Ungeschikts <marc.ungeschikts@vates.fr>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.ee643d67f5814913871557baab52452d
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20220411:md
Date: Mon, 11 Apr 2022 11:21:43 +0000
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="_av-Wn4-HBU4NEOJIpFTAZy3sA"

--_av-Wn4-HBU4NEOJIpFTAZy3sA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


https://doodle.com/meeting/participate/id/b822G1ge


I will probably leave the Doodle opened for few days (like up to Monday evening) until we can decide the best schedule without waiting too long. When I'll have the validated time slot, I'll communicate about it here.



So, as planned, here is the selected date. I picked this Thursday, April the 14th, at 4PM UTC (5PM London time, 6PM Paris time). Don't forget to add this to your calendar :)


Meeting place will be:

https://meet.vates.fr/xenmgmt


See you soon!




Regards,


Olivier Lambert | Vates CEO
XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

--_av-Wn4-HBU4NEOJIpFTAZy3sA
Content-Type: multipart/related; boundary="_av-fNQMrDGMxCVo0tfXUaPOPw"

--_av-fNQMrDGMxCVo0tfXUaPOPw
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
 <head></head>
 <body>
  <div id="bm-composer-content-wrapper">
   <p style="margin-bottom: 0; margin-top: 0;"><br></p>
   <blockquote style="margin-left: 1rem; padding-left: 1rem; border-left: 2px solid black;">
    <p style="margin-bottom: 0; margin-top: 0;">https://doodle.com/meeting/participate/id/b822G1ge</p>
    <p style="margin-bottom: 0; margin-top: 0;"><br></p>
    <p style="margin-bottom: 0; margin-top: 0;">I will probably leave the Doodle opened for few days (like up to Monday evening) until we can decide the best schedule without waiting too long. When I'll have the validated time slot, I'll communicate about it here.</p>
    <p style="margin-bottom: 0; margin-top: 0;"><br></p>
   </blockquote>
   <p style="margin-bottom: 0; margin-top: 0;"><br></p>
   <p style="margin-bottom: 0; margin-top: 0;">So, as planned, here is the selected date. I picked this Thursday, April the 14th, at 4PM UTC (5PM London time, 6PM Paris time). Don't forget to add this to your calendar :)</p>
   <p style="margin-bottom: 0; margin-top: 0;"><br></p>
   <p style="margin-bottom: 0; margin-top: 0;">Meeting place will be:</p>
   <p style="margin-bottom: 0; margin-top: 0;">https://meet.vates.fr/xenmgmt</p>
   <p style="margin-bottom: 0; margin-top: 0;"><br></p>
   <p style="margin-bottom: 0; margin-top: 0;">See you soon!</p>
   <p style="margin-bottom: 0; margin-top: 0;"><br></p>
   <p style="margin-bottom: 0; margin-top: 0;"><br></p>
   <p style="margin-bottom: 0; margin-top: 0;"><br></p>
   <p style="margin-bottom: 0; margin-top: 0;">Regards,</p>
   <style></style>
  </div>
  <div class="x-disclaimer995950824">
   <div>
     &nbsp;
   </div>
   <div>
     &nbsp;
   </div>
   <div>
    <div>
     <br>
     <table>
      <tbody>
       <tr>
        <td style="font-size: 10pt;">&nbsp;</td>
        <td style="font-size: 10pt; padding-left: 20px; border-left-color: #b42626; border-left-style: solid; border-left-width: 1px;">
         <div> <strong> <span>Olivier Lambert</span> | Vates CEO</strong>
          <br><strong>XCP-ng &amp; Xen Orchestra - </strong>Vates solutions
         </div>
         <div> <strong>w:</strong>&nbsp;vates.fr&nbsp;| xcp-ng.org | xen-orchestra.com
         </div>
         <div>
          <img style="width: 187px;" src="cid:x-disclaimer995950824-1649676101988.png@bm-disclaimer">
         </div> </td>
       </tr>
      </tbody>
     </table>
    </div>
   </div>
  </div>
 <img src="https://mandrillapp.com/track/open.php?u=30504962&id=ee643d67f5814913871557baab52452d" height="1" width="1"></body>
</html>

--_av-fNQMrDGMxCVo0tfXUaPOPw
Content-Type: image/png
Content-Transfer-Encoding: base64
Content-Id: <x-disclaimer995950824-1649676101988.png@bm-disclaimer>
Content-Disposition: inline

/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEB
AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/
2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB
AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCAB0ALsDAREAAhEBAxEB/8QA
HwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUF
BAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkK
FhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1
dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXG
x8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEB
AQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAEC
AxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRom
JygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOE
hYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU
1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD+/igAoAKA
CgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAo
AKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoA/kj/4O5fhR
8ftE/Y7+FP7bf7Nnxe+Mnws8Ufs1/EnTfDPxTX4XfE7xx4EtL/4VfFG7ttN0
nxNqll4b8T6XY3+o+D/ipZ+CdM09xpNzqP2Lxzql5cahBYaKsLgH7/8A/BN7
9r/Rf29P2HP2a/2sdHawS5+Lnw10rUvF2n6a0P2PRPiNoclx4X+JWgwQxajq
rWkGj+O9E8QWNpaXV/cXsFlDbLeP9oMgoA+sfHvjnwt8MfA3jP4k+ONXttA8
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
SFLq28PrPd6zH8bxVl3FtelPFcKZ9HA4qFPXLcXg8BXwmJlFP+Hia+Gq18LW
krJc0qlCcklJUeaVVf0n4CcZfR5yrMMPkfj/AOE1birIsTi3bjTh7iTirKuI
Mkp1ZKyxuSZZnWCyvPcuozvKbo0sJm1CjKcqdTMvZ0cDL8M/2d/+C6zya74n
/Yt/4LCfA/TdC1H7dcfD7x944vfBcY0KKSVYYns/jF8JXsry2gsrjfHqC+MP
A63GjS2l1p2pWHhW10xV11/yrJvFdutX4X8R8qp0ajnLB4vFTwy9ld2XLmOX
uEoqMrqX1jCp03GUJww6p/vn/fXiV9ABRy3K/HT6FvHuKzHBrD0+I+H8iw+d
yeYcsHKSrcG8XxxFGtKtSSnQeTZ9KOMhVo4rDYnOamJl/Z6+IP8Agrr/AMEa
fC3wI8GP+2f+xFfw+N/2V9ehsNe8SeEtB1d/GUPw00bXFtjpfjLwb4pivtWm
8XfCnUpbmMyXlze3t/4VFza3MupatoFxLd6F8r4jeGeHyrCvifhaaxWRVVCt
Xw9Gp9ZWDpVVH2eJw1eMqjxGAm5L33KU6HNGUp1KUnOl++/Qw+nBm/HueQ8D
fHjDzyLxXy6eIy7K85zHBrJKvEuOwEqqxWSZ3lNShg4ZNxZhIUpKOHp0KFDN
PZVaVPC4PH0oUMf+Pn7IP7dv7Tf7DfjYeMv2fPiLfeHra9uYJvFHgXVVOtfD
vxvBFsRrbxR4UupBZ3Ez26fZodb05tN8S6bEx/snWrB/mr824b4uz3hTFfWc
oxk6UJSTr4Sp+9weJirXjXw8nySbiuVVY8laC/h1YPU/tjxq+jx4VePuRPJf
EThrD4+vQpVI5TxBg39R4jyOpU5pKrlebUY+3pwVSXtZ4KusTlmKml9cwOJg
uQ/0AP8AgmV/wVG+Dv8AwUc+HN1c6JBb+APjn4Lsbeb4n/By91OO9vdNgkmS
0i8X+D72SO1n8S+BNQupIIDqIs4b3w9qdzBomv28Mlzo2oa5/X/A3HmW8a4K
U6KjhM0w0E8flsqilKmm1FYjDyajKthZyaXPyqVGpJUqq1pVKv8AzlfSo+if
xt9GTiinh8wlV4g4DzuvUjwpxrQwsqNDFTjCVaWT5xRhKrTyzPsPShUmsO60
qOZYWlUx2XzkqWOwuX/qDX3Z/KQUAFABQAUAfwJ/8FebK+/4I+f8HFP7Hv8A
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
AKACgD//2Q==

--_av-fNQMrDGMxCVo0tfXUaPOPw--

--_av-Wn4-HBU4NEOJIpFTAZy3sA--


